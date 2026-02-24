pragma Warnings (Off);
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.Source_Info;
with System.Dim.Generic_Mks;
with Waveshare.Config;
package body Waveshare.ADS1263 is
   ScanMode    : aliased Unsigned_Char;
   use Waveshare.Config;


   Positive_A6 : constant := 1;  --  ADS1263.h:35
   Negative_A7 : constant := 0;  --  ADS1263.h:36

   Open        : constant := 1;  --  ADS1263.h:38
   Close       : constant := 0;  --  ADS1263.h:39


   -----------
   -- Reset --
   -----------

   procedure Reset is
   begin
      pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity));

      DEV_Digital_Write (DEV_RST_PIN, 1);
      delay 0.300;
      DEV_Digital_Write (DEV_RST_PIN, 0);
      delay 0.300;
      DEV_Digital_Write (DEV_RST_PIN, 1);
      delay 0.300;
   end Reset;

   --------------
   -- WriteCmd --
   --------------

   procedure WriteCmd (Cmd : Unsigned_Char) is
   begin
      -- pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & "(Cmd =>" & Cmd'image & ");"));
      DEV_Digital_Write (DEV_CS_PIN, 0);
      DEV_SPI_WriteByte (Cmd);
      DEV_Digital_Write (DEV_CS_PIN, 1);
   end WriteCmd;

   --------------
   -- WriteReg --
   --------------

   procedure WriteReg (R : Reg; data : Unsigned_Char) is
   begin
      --  pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & "(Reg =>" & R'image & ",data =>" & Data'Image & " );"));
      DEV_Digital_Write (DEV_CS_PIN, 0);
      DEV_SPI_WriteByte (CMD_WREG or Reg'pos (R));
      DEV_SPI_WriteByte (16#00#);
      DEV_SPI_WriteByte (data);
      DEV_Digital_Write (DEV_CS_PIN, 1);
   end WriteReg;

   ---------------
   -- Read_data --
   ---------------

   function Read_data (R : REG) return Unsigned_Char is
      Temp : Unsigned_Char;
   begin
      DEV_Digital_Write (DEV_CS_PIN, 0);
      DEV_SPI_WriteByte (CMD_RREG or Reg'Pos (R));
      DEV_SPI_WriteByte (16#00#);
      delay 0.001;
      temp := DEV_SPI_ReadByte;
      DEV_Digital_Write (DEV_CS_PIN, 1);
      return temp;
   end Read_data;

   --------------
   -- Checksum --
   --------------

   function Checksum
     (val : Unsigned_Char_Array; byt : Unsigned_Char) return Unsigned_Char
   is
      Sum  : Unsigned_Char := 0;
      Mask : constant := 16#FF#;
   begin
      for I of Val loop
         Sum := (Sum + I);
      end loop;
      Sum := Sum + 16#9B#;
      return Sum xor Byt;
   end Checksum;

   procedure  Checksum
     (val : Unsigned_Char_Array; byt : Unsigned_Char) is
   begin
      if Checksum (Val, Byt) /= 0 then
         raise Constraint_Error with "Checksum fail";
      end if;
   end;

   --------------
   -- WaitDRDY --
   --------------

   procedure WaitDRDY is
      I : unsigned_long := 0;
   begin
      while DEV_Digital_Read (DEV_DRDY_PIN) /= 0 loop
         I := I + 1;
         delay 0.001;
         if I > 1000 then
            raise Program_Error with "Time out";
         end if;
      end loop;
   end WaitDRDY;

   ----------------
   -- ReadChipID --
   ----------------

   function ReadChipID return Unsigned_Char is
   begin

      return Ret : Unsigned_Char :=  Read_Data (REG_ID) do
         Ret := Ret  / (2 ** 5);
      end return;

   end ReadChipID;

   -------------
   -- SetMode --
   -------------

   procedure SetMode (Mode : Unsigned_Char) is
   begin
      pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity));
      ScanMode := (if Mode = 0 then 0 else 1);
   end SetMode;

   ----------------
   -- ConfigADC1 --
   ----------------
   procedure Set (Registry : REG; Value : Unsigned_Char) is
      Val : Unsigned_Char;
   begin
      WriteReg (Registry, Value);
      delay 0.001;

      Val := Read_Data (Registry);
      if  Val /= Value then
         raise Program_Error with "Set " & Registry'Image & " Failed, (got:" & Val'Image & " expected :" & Value'Image & ").";
      end if;
   end;


   procedure ConfigADC1
     (The_Gain : GAIN; The_drate : DRATE; The_Delay : Delay_Time)
   is
   begin
      Set (REG_MODE2,  16#80# or (GAIN'Pos (The_Gain) * 2 ** 4) or DRATE'Pos (The_Drate));
      delay 0.001;
      Set (REG_REFMUX, 16#24#);
      delay 0.001;
      Set (REG_MODE0,  Delay_Time'Pos (The_Delay));
      delay 0.001;
      Set (REG_MODE1,  16#84#); --  Digital Filter; 0x84:FIR, 0x64:Sinc4, 0x44:Sinc3, 0x24:Sinc2, 0x04:Sinc1
      delay 0.001;
   end ConfigADC1;

   ----------------
   -- ConfigADC2 --
   ----------------

   procedure ConfigADC2
     (gain : ADC2_GAIN; drate : ADC2_DRATE; The_Delay : Delay_Time)
   is
   begin
      WriteReg (REG_ADC2CFG, 16#20# or ADC2_DRATE'Pos (Drate) * 2 ** 16 or ADC2_GAIN'Pos (Gain));
      Set (REG_MODE0, Delay_Time'Pos (The_Delay));
   end ConfigADC2;

   ---------------
   -- init_ADC1 --
   ---------------

   procedure init_ADC1 (rate : DRATE)  is
      Dummy : Unsigned_Char;
   begin
      --  pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & "(rate =>" & Rate'image & ");"));
      Reset;
      Dummy := ReadChipID;
      WriteCmd (CMD_STOP1);
      ConfigADC1 (GAIN_1, rate, DELAY_35us);
      WriteCmd (CMD_START1);
   end init_ADC1;

   ---------------
   -- init_ADC2 --
   ---------------

   procedure init_ADC2 (rate : ADC2_DRATE)  is
   begin
      Reset;
      if ReadChipID /= 1 then
         raise Program_Error with "ID Read Failed";
      end if;
      WriteCmd (CMD_STOP2);
      ConfigADC2 (ADC2_GAIN_1, rate, DELAY_35us);
   end init_ADC2;

   ----------------
   -- SetChannal --
   ----------------

   procedure SetChannal (Channal : Channel_Number) is
   begin
      Set (REG_INPMUX, Channal * 2 ** 4 or 14#0A#);
   end SetChannal;

   ---------------------
   -- SetChannal_ADC2 --
   ---------------------

   procedure SetChannal_ADC2 (Channal : Channel_Number) is
   begin
      Set (REG_ADC2MUX, Channal * 2 ** 4 or 14#0A#);
   end SetChannal_ADC2;

   --------------------
   -- SetDiffChannal --
   --------------------

   procedure SetDiffChannal (Channal : Diff_Channel_Number) is
   begin
      Set (REG_INPMUX, (case Channal is
              when 0      => 2#0000_0001#,
              when 1      => 2#0010_0011#,
              when 2      => 2#0100_0101#,
              when 3      => 2#0110_0111#,
              when 4      => 2#1000_1001#));
   end SetDiffChannal;

   -------------------------
   -- SetDiffChannal_ADC2 --
   -------------------------

   procedure SetDiffChannal_ADC2 (Channal : Diff_Channel_Number) is
   begin
      Set (REG_ADC2MUX, (case Channal is
              when 0      => 2#0000_0001#,
              when 1      => 2#0010_0011#,
              when 2      => 2#0100_0101#,
              when 3      => 2#0110_0111#,
              when 4      => 2#1000_1001#));
   end SetDiffChannal_ADC2;

   --------------------
   -- Read_ADC1_Data --
   --------------------

   function Read_ADC1_Data return Unsigned_Long is
      Buf         : Unsigned_Char_Array (1 .. 4);
      Read        : Unsigned_Long with Import => True, Address => Buf'Address;
      Status, CRC : Unsigned_Char;

   begin
      DEV_Digital_Write (DEV_CS_PIN, 0);

      loop
         DEV_SPI_WriteByte (CMD_RDATA1);
         if  (DEV_SPI_ReadByte and 16#40#) /= 0 then
            exit;
         end if;
      end loop;

      Buf (4) := DEV_SPI_ReadByte;
      Buf (3) := DEV_SPI_ReadByte;
      Buf (2) := DEV_SPI_ReadByte;
      Buf (1) := DEV_SPI_ReadByte;
      DEV_Digital_Write (DEV_CS_PIN, 1);
      return read;
   end Read_ADC1_Data;

   --------------------
   -- Read_ADC2_Data --
   --------------------

   function Read_ADC2_Data return Unsigned_Long is

      type Ret_type  (Part : Boolean := False ) is record
         case Part is
            when True =>   Buf         : Unsigned_Char_Array (1 .. 4);
            when False =>  Read        : Unsigned_Long;
         end case;
      end record;
      Ret : Ret_Type;

      Status, CRC : Unsigned_Char;
   begin
      DEV_Digital_Write (DEV_CS_PIN, 0);
      loop
         DEV_SPI_WriteByte (CMD_RDATA2);
         exit when (DEV_SPI_ReadByte and 16#80#) /= 0;
      end loop;
      Ret.Buf (4) := DEV_SPI_ReadByte;
      Ret.Buf (3) := DEV_SPI_ReadByte;
      Ret.Buf (2) := DEV_SPI_ReadByte;
      Ret.Buf (1) := DEV_SPI_ReadByte;
      CRC := DEV_SPI_ReadByte;
      DEV_Digital_Write (DEV_CS_PIN, 1);
      ADS1263.Checksum (Ret.Buf, Crc);
      return Ret.Read;
   end Read_ADC2_Data;

   ---------------------
   -- GetChannalValue --
   ---------------------

   function GetChannalValue (Channel : Channel_Number) return Unsigned_Long is

      Value : Unsigned_Char := 0;

   begin
      if ScanMode = 0 then -- 0  Single-ended input  10 channel1 Differential input  5 channel
         SetChannal (Channel);
      else
         SetDiffChannal (Channel);
      end if;
      WaitDRDY;
      return Read_ADC1_Data;
   end GetChannalValue;

   --------------------------
   -- GetChannalValue_ADC2 --
   --------------------------

   function GetChannalValue_ADC2 (Channel : Channel_Number) return Unsigned_Long
   is
   begin
      if ScanMode = 0 then -- 0  Single-ended input  10 channel1 Differential input  5 channel
         SetChannal_ADC2 (Channel);
         WriteCmd (CMD_START2);
      else
         SetDiffChannal_ADC2 (Channel);
         WriteCmd (CMD_START2);
      end if;
      return Read_ADC2_Data;
   end GetChannalValue_ADC2;

   function GetChannalValue_ADC2 (Channel : Channel_Number ; Ref_Voltage : Float := 5.08) return Float is
   begin
      return Scale (GetChannalValue_ADC2 (Channel), Ref_Voltage);
   End GetChannalValue_ADC2;

   function GetChannalValue_ADC2 (Channel : Channel_Number ; Ref_Voltage : Long_Float := 5.08)return Long_Float is
   begin
      return Scale (GetChannalValue_ADC2 (Channel), Ref_Voltage);
   End GetChannalValue_ADC2;

   ------------
   -- GetAll --
   ------------



   function GetAll
     (List   : Channel_List ) return Data_Values is
   begin
      return Ret : Data_Values (List'Range) do
         GetAll (List, Ret);
      end return;
   end;

   function GetAll
     (List   : Channel_List ; Ref_Voltage : Float := 5.08) return Ada.Numerics.Real_Arrays.Real_Vector is
   begin
      return Scale (GetAll (List), Ref_Voltage);
   end;

   function GetAll
     (List        : Channel_List ;
      Ref_Voltage : Long_Float := 5.08) return Ada.Numerics.Long_Real_Arrays.Real_Vector is
   begin
      return Scale (GetAll (List), Ref_Voltage);
   end;

   procedure GetAll
     (List        : Channel_List;
      Data        : out Data_Values) is
   begin
      for I in List'Range loop
         Data (I) := GetChannalValue (List (I));
      end loop;
   end;

   -----------------
   -- GetAll_ADC2 --
   -----------------

   procedure GetAll_ADC2 (ADC_Values : out All_Data_Values) is
   begin
      for I in ADC_Values'range loop
         ADC_Values (I) := ADS1263.GetChannalValue_ADC2 (Channel_Number (I));
         ADS1263.WriteCmd (CMD_STOP2);
      end loop;
   end GetAll_ADC2;

   ---------
   -- RTD --
   ---------

   function RTD
     (c_delay   : Delay_Time;
      The_Gain  : GAIN;
      The_Drate : DRATE)
      return Unsigned_Long
   is
      MODE0   : Unsigned_Char := Delay_Time'Pos (C_Delay);
      IDACMUX : Unsigned_Char := 2#1010_0011#;
      IDACMAG : Unsigned_Char := 2#0011_0011#;
      MODE2   : Unsigned_Char := GAIN'Pos (The_Gain) * 2 ** 4  or Drate'Pos (The_Drate);
      INPMUX  : Unsigned_Char := 2#0111_0110#;
      REFMUX  : Unsigned_Char := 2#0001_1011#;
      Value   : Unsigned_Long;
   begin
      ADS1263.WriteReg (REG_MODE0, MODE0);
      delay 0.001;

      --(IDACMUX) IDAC2 AINCOM,IDAC1 AIN3
      ADS1263.WriteReg (REG_IDACMUX, IDACMUX);
      delay 0.001;

      --((IDACMAG)) IDAC2 = IDAC1 = 250uA
      ADS1263.WriteReg (REG_IDACMAG, IDACMAG);
      delay 0.001;

      ADS1263.WriteReg (REG_MODE2, MODE2);
      delay 0.001;

      --INPMUX (AINP = AIN7, AINN = AIN6)
      ADS1263.WriteReg (REG_INPMUX, INPMUX);
      delay 0.001;

      -- REFMUX AIN4 AIN5
      ADS1263.WriteReg (REG_REFMUX, REFMUX);
      delay 0.001;

      --Read one conversion
      ADS1263.WriteCmd (CMD_START1);
      delay 0.010;
      ADS1263.WaitDRDY;
      Value := ADS1263.Read_ADC1_Data;
      ADS1263.WriteCmd (CMD_STOP1);
      return Value;
   end RTD;

   ---------
   -- DAC --
   ---------

   procedure DAC
     (volt : DAC_VOLT; isPositive : boolean; isOpen : boolean)
   is
   begin
      ADS1263.WriteReg ((if IsPositive then REG_TDACP else REG_TDACN),
                        (if IsOpen then (Volt or 16#80#) else 0));
   end DAC;


   function Scale (Items : Data_Values; Ref_Voltage : Long_Float := 5.08) return Ada.Numerics.Long_Real_Arrays.Real_Vector is
   begin
      return Ret : Ada.Numerics.Long_Real_Arrays.Real_Vector (Items'Range) do
         for I in Ret'Range loop
            Ret (I) := Scale (Items (I), Ref_Voltage);
         end loop;
      end return;
   end Scale;

   function Scale (Items : Data_Values; Ref_Voltage : Float := 5.08) return Ada.Numerics.Real_Arrays.Real_Vector is
   begin
      return Ret : Ada.Numerics.Real_Arrays.Real_Vector (Items'Range) do
         for I in Ret'Range loop
            Ret (I) := Scale (Items (I), Ref_Voltage);
         end loop;
      end return;
   end Scale;

   function Scale (Item : Unsigned_Long; Ref_Voltage : Long_Float := 5.08) return Long_Float is
   begin
      if (Item and 2#1000_000#) /= 0 then
         Return Ref_Voltage * 2.0 - Long_Float (Item) / 2147483648.0 * Ref_Voltage;
      else
         Return Long_Float (Item) / 2147483647.0 * Ref_Voltage;
      end if;
   end Scale;

   function Scale (Item : Unsigned_Long; Ref_Voltage : Float := 5.08) return Float is
   begin
      return Float (Long_Float'(Scale (Item, Long_Float (Ref_Voltage))));
   end Scale;

end Waveshare.ADS1263;
