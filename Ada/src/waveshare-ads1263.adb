with Ada.Text_IO; use Ada.Text_IO;
with GNAT.Source_Info;
with Waveshare.Config;
package body Waveshare.ADS1263 is
   ScanMode    : aliased unsigned_char := 0;
   use Waveshare.Config;

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

   procedure WriteCmd (Cmd : unsigned_char) is
   begin
      DEV_Digital_Write (DEV_CS_PIN, 0);
      DEV_SPI_WriteByte (Cmd);
      DEV_Digital_Write (DEV_CS_PIN, 1);
      delay 0.001;
   end WriteCmd;

   --------------
   -- WriteReg --
   --------------

   procedure WriteReg (R : REG; data : unsigned_char) is
   begin
      DEV_Digital_Write (DEV_CS_PIN, 0);
      DEV_SPI_WriteByte (CMD_WREG or REG'Pos (R));
      DEV_SPI_WriteByte (16#00#);
      DEV_SPI_WriteByte (data);
      DEV_Digital_Write (DEV_CS_PIN, 1);
      delay 0.001;
   end WriteReg;

   ---------------
   -- Read_data --
   ---------------

   function Read_data (R : REG) return unsigned_char is
      Temp : unsigned_char;
   begin
      DEV_Digital_Write (DEV_CS_PIN, 0);
      DEV_SPI_WriteByte (CMD_RREG or REG'Pos (R));
      DEV_SPI_WriteByte (16#00#);
      delay 0.001;
      Temp := DEV_SPI_ReadByte;
      DEV_Digital_Write (DEV_CS_PIN, 1);
      delay 0.001;
      return Temp;
   end Read_data;

   --------------
   -- Checksum --
   --------------

   function Checksum
     (val : Unsigned_Char_Array; byt : unsigned_char) return unsigned_char
   is
      Sum  : unsigned_char := 0;
   begin
      for I of val loop
         Sum := (Sum + I);
      end loop;
      Sum := Sum + 16#9B#;
      return Sum xor byt;
   end Checksum;

   procedure  Checksum
     (val : Unsigned_Char_Array; byt : unsigned_char) is
   begin
      if Checksum (val, byt) /= 0 then
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
         if I > 10000 then
            raise Program_Error with "Time out";
         end if;
      end loop;
   end WaitDRDY;

   ----------------
   -- ReadChipID --
   ----------------

   function ReadChipID return unsigned_char is
   begin

      return Ret : unsigned_char :=  Read_data (REG_ID) do
         Ret := Ret  / (2 ** 5);
      end return;

   end ReadChipID;

   -------------
   -- SetMode --
   -------------

   procedure Set_Mode (Differential : Boolean := False) is
   begin
      ScanMode := (if Differential then 1 else 0);
   end Set_Mode;

   ----------------
   -- ConfigADC1 --
   ----------------
   procedure Set (Registry : REG; Value : unsigned_char) is
      Val : unsigned_char;
   begin
      WriteReg (Registry, Value);
      delay 0.001;

      Val := Read_data (Registry);
      delay 0.001;
      if  Val /= Value then
         raise Program_Error with "Set " & Registry'Image & " Failed, (got:" & Val'Image & " expected :" & Value'Image & ").";
      end if;
   end;

   procedure ConfigADC1
     (The_Gain    : ADC1_GAIN;
      The_drate   : ADC1_DRATE;
      The_Delay   : DELAY_Time)
   is
   begin
      Set (REG_MODE2,  16#80# or (GAIN'Pos (The_Gain) * 2 ** 4) or ADC1_DRATE'Pos (The_drate));
      Set (REG_REFMUX, 16#24#);
      Set (REG_MODE0,  DELAY_Time'Pos (The_Delay));
      Set (REG_MODE1,  16#84#); --  Digital Filter; 0x84:FIR, 0x64:Sinc4, 0x44:Sinc3, 0x24:Sinc2, 0x04:Sinc1
   end ConfigADC1;

   ----------------
   -- ConfigADC2 --
   ----------------

   procedure ConfigADC2
     (GAIN      : ADS1263.GAIN;
      drate     : ADC2_DRATE;
      The_Delay : DELAY_Time)
   is
   begin
      WriteReg (REG_ADC2CFG, 16#20# or ADC2_DRATE'Pos (drate) * 2 ** 16 or ADS1263.GAIN'Pos (GAIN));
      Set (REG_MODE0, DELAY_Time'Pos (The_Delay));
   end ConfigADC2;

   ---------------
   -- init_ADC1 --
   ---------------

   procedure init_ADC1 (rate : ADC1_DRATE)  is
      Dummy : unsigned_char;
   begin
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
      ConfigADC2 (GAIN_1, rate, DELAY_35us);
   end init_ADC2;

   ----------------
   -- SetChannal --
   ----------------

   procedure SetChannal_ADC1 (Channal : Channel_Number) is
   begin
      Set (REG_INPMUX, Channal * 2 ** 4 or 14#0A#);
   end SetChannal_ADC1;

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

   procedure SetDiffChannal_ADC1 (Channal : Diff_Channel_Number) is
   begin
      Set (REG_INPMUX, (case Channal is
              when 0      => 2#0000_0001#,
              when 1      => 2#0010_0011#,
              when 2      => 2#0100_0101#,
              when 3      => 2#0110_0111#,
              when 4      => 2#1000_1001#));
   end SetDiffChannal_ADC1;

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

   function Read_ADC1_Data return unsigned_long is
      Buf         : Unsigned_Char_Array (1 .. 4);
      Read        : unsigned with Import => True, Address => Buf'Address;

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
      return unsigned_long (Read);
   end Read_ADC1_Data;

   --------------------
   -- Read_ADC2_Data --
   --------------------

   function Read_ADC2_Data return unsigned_long is

      type Ret_type  (Part : Boolean := False) is record
         case Part is
            when True =>   Buf         : Unsigned_Char_Array (1 .. 4);
            when False =>  Read        : unsigned_long;
         end case;
      end record;
      Ret : Ret_type;

      CRC : unsigned_char;
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

      ADS1263.Checksum (Ret.Buf, CRC);
      return Ret.Read;
   end Read_ADC2_Data;

   ---------------------
   -- GetChannalValue --
   ---------------------

   function GetChannalValue (Channel : Channel_Number) return unsigned_long is

   begin
      if ScanMode = 0 then -- 0  Single-ended input  10 channel1 Differential input  5 channel
         SetChannal_ADC1 (Channel);
      else
         SetDiffChannal_ADC1 (Channel);
      end if;
      WaitDRDY;
      return Read_ADC1_Data;
   end GetChannalValue;

   --------------------------
   -- GetChannalValue_ADC2 --
   --------------------------

   function Get_ADC2 (Channel : Channel_Number) return unsigned_long
   is
   begin
      if ScanMode = 0 then -- 0  Single-ended input  10 channel1 Differential input  5 channel
         SetChannal_ADC2 (Channel);
      else
         SetDiffChannal_ADC2 (Channel);
      end if;
      WriteCmd (CMD_START2);
      return Read_ADC2_Data;
   end Get_ADC2;

   function Get_ADC2 (Channel : Channel_Number; Ref_Voltage : Float := 5.08) return Float is
   begin
      return Scale (Get_ADC2 (Channel), Ref_Voltage);
   end Get_ADC2;

   function Get_ADC2 (Channel : Channel_Number; Ref_Voltage : Long_Float := 5.08) return Long_Float is
   begin
      return Scale (Get_ADC2 (Channel), Ref_Voltage);
   end Get_ADC2;

   function Get_ADC2
     (List        : Channel_List;
      Ref_Voltage : Float := 5.08)
      return Ada.Numerics.Real_Arrays.Real_Vector is
   begin
      return Ret : Ada.Numerics.Real_Arrays.Real_Vector (List'Range) do
         for I in List'Range loop
            Ret (I) := Scale (Get_ADC2 (List (I)), Ref_Voltage);
         end loop;
      end return;
   end;

   function Get_ADC2
     (List        : Channel_List;
      Ref_Voltage : Long_Float := 5.08)
      return Ada.Numerics.Long_Real_Arrays.Real_Vector is
   begin
      return Ret : Ada.Numerics.Long_Real_Arrays.Real_Vector (List'Range) do
         for I in List'Range loop
            Ret (I) := Scale (Get_ADC2 (List (I)), Ref_Voltage);
         end loop;
      end return;
   end;

   ------------
   -- Get_ADC1 --
   ------------

   function Get_ADC1
     (List   : Channel_List) return Data_Values is
   begin
      return Ret : Data_Values (List'Range) do
         Get_ADC1 (List, Ret);
      end return;
   end;

   function Get_ADC1
     (List   : Channel_List; Ref_Voltage : Float := 5.08) return Ada.Numerics.Real_Arrays.Real_Vector is
   begin
      return Scale (Get_ADC1 (List), Ref_Voltage);
   end;

   function Get_ADC1
     (List        : Channel_List;
      Ref_Voltage : Long_Float := 5.08) return Ada.Numerics.Long_Real_Arrays.Real_Vector is
   begin
      return Scale (Get_ADC1 (List), Ref_Voltage);
   end;

   function Get_ADC1
     (Channel        : Channel_Number;
      Ref_Voltage    : Float := 5.08) return Float is
   begin
      return Scale (GetChannalValue (Channel), Ref_Voltage);
   end;

   function Get_ADC1
     (Channel     : Channel_Number;
      Ref_Voltage : Long_Float := 5.08) return Long_Float is
   begin
      return Scale (GetChannalValue (Channel), Ref_Voltage);
   end;

   procedure Get_ADC1
     (List        : Channel_List;
      Data        : out Data_Values) is
   begin
      for I in List'Range loop
         Data (I) := GetChannalValue (List (I));
      end loop;
   end;

   ---------
   -- RTD --
   ---------

   function RTD
     (c_delay   : DELAY_Time;
      The_Gain  : GAIN;
      The_Drate : ADC1_DRATE)
      return unsigned_long
   is
      MODE0   : constant unsigned_char := DELAY_Time'Pos (c_delay);
      IDACMUX : constant unsigned_char := 2#1010_0011#;
      IDACMAG : constant unsigned_char := 2#0011_0011#;
      MODE2   : constant unsigned_char := GAIN'Pos (The_Gain) * 2 ** 4  or ADC1_DRATE'Pos (The_Drate);
      INPMUX  : constant unsigned_char := 2#0111_0110#;
      REFMUX  : constant unsigned_char := 2#0001_1011#;
      Value   : unsigned_long;
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

      --  INPMUX (AINP = AIN7, AINN = AIN6)
      ADS1263.WriteReg (REG_INPMUX, INPMUX);
      delay 0.001;

      --  REFMUX AIN4 AIN5
      ADS1263.WriteReg (REG_REFMUX, REFMUX);
      delay 0.001;

      --  Read one conversion
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
     (volt : DAC_VOLT; isPositive : Boolean; isOpen : Boolean)
   is
   begin
      ADS1263.WriteReg ((if isPositive then REG_TDACP else REG_TDACN),
                        (if isOpen then (volt or 16#80#) else 0));
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

   function Scale (Item : unsigned_long; Ref_Voltage : Long_Float := 5.08) return Long_Float is
   begin
      if (Item and 2#1000_000#) /= 0 then
         return Ref_Voltage * 2.0 - Long_Float (Item) / 2147483648.0 * Ref_Voltage;
      else
         return Long_Float (Item) / 2147483647.0 * Ref_Voltage;
      end if;
   end Scale;

   function Scale (Item : unsigned_long; Ref_Voltage : Float := 5.08) return Float is
   begin
      return Float (Long_Float'(Scale (Item, Long_Float (Ref_Voltage))));
   end Scale;

end Waveshare.ADS1263;
