with Ada.Numerics;
with Ada.Numerics.Long_Real_Arrays;
with Ada.Numerics.Real_Arrays;

with Interfaces.C; use Interfaces.C;

package Waveshare.ADS1263 is


   type GAIN is 
     (GAIN_1,
      GAIN_2,
      GAIN_4,
      GAIN_8,
      GAIN_16,
      GAIN_32,
      GAIN_64)
     with Convention => C;  -- ADS1263.h:51

   type DRATE is 
     (DRATE_2d5SPS,
      DRATE_5SPS,
      DRATE_10SPS,
      DRATE_16d6SPS,
      DRATE_20SPS,
      DRATE_50SPS,
      DRATE_60SPS,
      DRATE_100SPS,
      DRATE_400SPS,
      DRATE_1200SPS,
      DRATE_2400SPS,
      DRATE_4800SPS,
      DRATE_7200SPS,
      DRATE_14400SPS,
      DRATE_19200SPS,
      DRATE_38400SPS)
     with Convention => C;  -- ADS1263.h:71

   type DELAY_Time is 
     (DELAY_0s,
      DELAY_8d7us,
      DELAY_17us,
      DELAY_35us,
      DELAY_169us,
      DELAY_139us,
      DELAY_278us,
      DELAY_555us,
      DELAY_1d1ms,
      DELAY_2d2ms,
      DELAY_4d4ms,
      DELAY_8d8ms)
     with Convention => C;  -- ADS1263.h:87

   type ADC2_DRATE is 
     (ADC2_10SPS,
      ADC2_100SPS,
      ADC2_400SPS,
      ADC2_800SPS)
     with Convention => C;  -- ADS1263.h:95

   type ADC2_GAIN is 
     (ADC2_GAIN_1,
      ADC2_GAIN_2,
      ADC2_GAIN_4,
      ADC2_GAIN_8,
      ADC2_GAIN_16,
      ADC2_GAIN_32,
      ADC2_GAIN_64,
      ADC2_GAIN_128)
     with Convention => C;  -- ADS1263.h:107

   subtype DAC_VOLT is Unsigned_Char range 0 .. 25;
   DAC_VLOT_4_5 : constant := 9;
   DAC_VLOT_3_5 : constant := 8;
   DAC_VLOT_3 : constant := 7;
   DAC_VLOT_2_75 : constant := 6;
   DAC_VLOT_2_625 : constant := 5;
   DAC_VLOT_2_5625 : constant := 4;
   DAC_VLOT_2_53125 : constant := 3;
   DAC_VLOT_2_515625 : constant := 2;
   DAC_VLOT_2_5078125 : constant := 1;
   DAC_VLOT_2_5 : constant := 0;
   DAC_VLOT_2_4921875 : constant := 17;
   DAC_VLOT_2_484375 : constant := 18;
   DAC_VLOT_2_46875 : constant := 19;
   DAC_VLOT_2_4375 : constant := 20;
   DAC_VLOT_2_375 : constant := 21;
   DAC_VLOT_2_25 : constant := 22;
   DAC_VLOT_2 : constant := 23;
   DAC_VLOT_1_5 : constant := 24;
   DAC_VLOT_0_5 : constant := 25;  -- ADS1263.h:130

  

   procedure SetMode (Mode : Unsigned_Char);

   procedure ConfigADC1
     (The_Gain    : GAIN;
      The_drate   : DRATE;
      The_Delay   : Delay_Time);

   procedure ConfigADC2
     (gain      : ADC2_GAIN;
      drate     : ADC2_DRATE;
      The_Delay : Delay_Time);

   procedure init_ADC1 (rate : DRATE);

   procedure init_ADC2 (rate : ADC2_DRATE);

   subtype Channel_Number is Unsigned_Char range 0 .. 9;
   subtype Diff_Channel_Number is Channel_Number range 0 .. 4;
   
   procedure SetChannal (Channal : Channel_Number);

   procedure SetChannal_ADC2 (Channal : Channel_Number);

   procedure SetDiffChannal (Channal : Diff_Channel_Number);

   procedure SetDiffChannal_ADC2 (Channal : Diff_Channel_Number);

   function Read_ADC1_Data return Unsigned_Long;

   function Read_ADC2_Data return Unsigned_Long;

   function GetChannalValue (Channel : Channel_Number) return Unsigned_Long with
     Pre => Channel < 5;

   function GetChannalValue_ADC2 (Channel : Channel_Number) return Unsigned_Long;
   function GetChannalValue_ADC2 (Channel : Channel_Number ; Ref_Voltage : Float := 5.08) return Float;
   function GetChannalValue_ADC2 (Channel : Channel_Number ; Ref_Voltage : Long_Float := 5.08) return Long_Float;
   
   type Channel_List is array (Natural range <>) of aliased Channel_Number;
   type Data_Values is array (Natural range <>) of aliased unsigned_long;
   
   
   function GetAll
     (List   : Channel_List ) return Data_Values with
     Post => List'Length = GetAll'Result'Length;
   
   function GetAll
     (List   : Channel_List ; Ref_Voltage : Float := 5.08) return Ada.Numerics.Real_Arrays.Real_Vector with
     Post => List'Length = GetAll'Result'Length;
   
   function GetAll
     (List   : Channel_List ; Ref_Voltage : Long_Float := 5.08) return Ada.Numerics.Long_Real_Arrays.Real_Vector with
     Post => List'Length = GetAll'Result'Length;

   procedure GetAll
     (List        : Channel_List;
      Data        : out Data_Values) with
     pre => List'Length = Data'Length;

   
   
   subtype All_Data_Values is Data_Values (1 .. 10);
   procedure GetAll_ADC2 (ADC_Values : out All_Data_Values);
   
   
   function RTD
     (c_delay     : Delay_Time;
      The_Gain    : GAIN;
      The_Drate   : DRATE) return Unsigned_Long;

   procedure DAC
     (volt       : DAC_VOLT;
      isPositive : Boolean;
      isOpen     : Boolean);
   
   function Scale (Items       : Data_Values; 
                   Ref_Voltage : Long_Float := 5.08) return Ada.Numerics.Long_Real_Arrays.Real_Vector;
   
   function Scale (Items       : Data_Values; 
                   Ref_Voltage : Float := 5.08) return Ada.Numerics.Real_Arrays.Real_Vector;
   
   function Scale (Item        : Unsigned_Long;
                   Ref_Voltage : Long_Float := 5.08) return Long_Float;
   function Scale (Item        : Unsigned_Long; 
                   Ref_Voltage : Float := 5.08) return Float;


private 
   type REG is 
     (REG_ID,
      REG_POWER,
      REG_INTERFACE,
      REG_MODE0,
      REG_MODE1,
      REG_MODE2,
      REG_INPMUX,
      REG_OFCAL0,
      REG_OFCAL1,
      REG_OFCAL2,
      REG_FSCAL0,
      REG_FSCAL1,
      REG_FSCAL2,
      REG_IDACMUX,
      REG_IDACMAG,
      REG_REFMUX,
      REG_TDACP,
      REG_TDACN,
      REG_GPIOCON,
      REG_GPIODIR,
      REG_GPIODAT,
      REG_ADC2CFG,
      REG_ADC2MUX,
      REG_ADC2OFC0,
      REG_ADC2OFC1,
      REG_ADC2FSC0,
      REG_ADC2FSC1)
     with Convention => C;  -- ADS1263.h:162

   CMD_RESET : constant := 6;
   CMD_START1 : constant := 8;
   CMD_STOP1 : constant := 10;
   CMD_START2 : constant := 12;
   CMD_STOP2 : constant := 14;
   CMD_RDATA1 : constant := 18;
   CMD_RDATA2 : constant := 20;
   CMD_SYOCAL1 : constant := 22;
   CMD_SYGCAL1 : constant := 23;
   CMD_SFOCAL1 : constant := 25;
   CMD_SYOCAL2 : constant := 27;
   CMD_SYGCAL2 : constant := 28;
   CMD_SFOCAL2 : constant := 30;
   CMD_RREG : constant := 32;
   CMD_RREG2 : constant := 0;
   CMD_WREG : constant := 64;
   CMD_WREG2 : constant := 0;  -- ADS1263.h:183

   procedure WriteCmd (Cmd : Unsigned_Char);

   procedure WriteReg (R : REG; data : Unsigned_Char);

   function Read_data (R : REG) return Unsigned_Char;

   function Checksum (val : unsigned_long; byt : Unsigned_Char) return Unsigned_Char;
   procedure Reset;


   procedure WaitDRDY;

   function ReadChipID return Unsigned_Char;


end Waveshare.ADS1263;
