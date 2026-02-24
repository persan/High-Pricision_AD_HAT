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
      GAIN_64,
      GAIN_128);

   type ADC1_DRATE is
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
      DRATE_38400SPS);

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
      DELAY_8d8ms);

   type ADC2_DRATE is
     (ADC2_10SPS,
      ADC2_100SPS,
      ADC2_400SPS,
      ADC2_800SPS)
     with Convention => C;  -- ADS1263.h:95

   subtype ADC1_GAIN is GAIN range GAIN_1 .. GAIN_64;

   subtype DAC_VOLT is unsigned_char range 0 .. 25;
   DAC_VLOT_4_5       : constant := 9;
   DAC_VLOT_3_5       : constant := 8;
   DAC_VLOT_3         : constant := 7;
   DAC_VLOT_2_75      : constant := 6;
   DAC_VLOT_2_625     : constant := 5;
   DAC_VLOT_2_5625    : constant := 4;
   DAC_VLOT_2_53125   : constant := 3;
   DAC_VLOT_2_515625  : constant := 2;
   DAC_VLOT_2_5078125 : constant := 1;
   DAC_VLOT_2_5       : constant := 0;
   DAC_VLOT_2_4921875 : constant := 17;
   DAC_VLOT_2_484375  : constant := 18;
   DAC_VLOT_2_46875   : constant := 19;
   DAC_VLOT_2_4375    : constant := 20;
   DAC_VLOT_2_375     : constant := 21;
   DAC_VLOT_2_25      : constant := 22;
   DAC_VLOT_2         : constant := 23;
   DAC_VLOT_1_5       : constant := 24;
   DAC_VLOT_0_5       : constant := 25;  -- ADS1263.h:130

   procedure Set_Mode  (Differential : Boolean := False);

   procedure ConfigADC1
     (The_Gain    : ADC1_GAIN;
      The_drate   : ADC1_DRATE;
      The_Delay   : DELAY_Time);
   --  ADC config function, which can set the ADC rate, PGA gain multiple, reference voltage, etc.
   --  The information on the register you can check in the ADS1263.
   --  If you need to configure other registers, it is better to read and verify after each writing according to the routine manner.
   --  In order to ensure data stability and reduce crosstalk between multiple channels and two ADCs,
   --  the data conversion delay used by the demo is relatively large and the conversion rate is relatively slow.
   --  But you can modify it if you need to increase the speed.
   --  It is not recommended to turn on PGA when using single-ended measurement for ADC1. The PGA is off by default.
   --  -------------------------------------------------------------------------

   subtype Channel_Number is unsigned_char range 0 .. 9;
   subtype Diff_Channel_Number is Channel_Number range 0 .. 4;

   type Channel_List is array (Natural range <>) of aliased Channel_Number;
   type Data_Values is array (Natural range <>) of aliased unsigned_long;

   procedure init_ADC1 (rate : ADC1_DRATE);
   --  Chip initialization functions, including resetting, verifying, and configuring the ADC device.
   --  -------------------------------------------------------------------------

   procedure SetChannal_ADC1 (Channal : Channel_Number);
   procedure SetDiffChannal_ADC1 (Channal : Diff_Channel_Number);
   --  Select the channel function, and call this function before switching the ADC channel.
   --  -------------------------------------------------------------------------

   function Get_ADC1
     (Channel        : Channel_Number;
      Ref_Voltage    : Float := 5.08) return Float;

   function Get_ADC1
     (Channel        : Channel_Number;
      Ref_Voltage    : Long_Float := 5.08) return Long_Float;

   function Get_ADC1
     (List        : Channel_List;
      Ref_Voltage : Float := 5.08)
      return Ada.Numerics.Real_Arrays.Real_Vector with
     Post => List'Length = Get_ADC1'Result'Length;

   function Get_ADC1
     (List        : Channel_List;
      Ref_Voltage : Long_Float := 5.08)
      return Ada.Numerics.Long_Real_Arrays.Real_Vector with
     Post => List'Length = Get_ADC1'Result'Length;

   procedure init_ADC2 (rate : ADC2_DRATE);
   --  Chip initialization functions, including resetting, verifying, and configuring the ADC device.
   --  -------------------------------------------------------------------------

   procedure ConfigADC2
     (GAIN      : ADS1263.GAIN;
      drate     : ADC2_DRATE;
      The_Delay : DELAY_Time);
   --  ADC config function, which can set the ADC rate, PGA gain multiple, reference voltage, etc.
   --  The information on the register you can check in the ADS1263.
   --  If you need to configure other registers, it is better to read and verify after each writing according to the routine manner.
   --  In order to ensure data stability and reduce crosstalk between multiple channels and two ADCs,
   --  the data conversion delay used by the demo is relatively large and the conversion rate is relatively slow.
   --  But you can modify it if you need to increase the speed.
   --  It is not recommended to turn on PGA when using single-ended measurement for ADC1. The PGA is off by default.
   --  -------------------------------------------------------------------------

   procedure SetChannal_ADC2 (Channal : Channel_Number);
   procedure SetDiffChannal_ADC2 (Channal : Diff_Channel_Number);
   --  Select the channel function, and call this function before switching the ADC channel.

   function Get_ADC2 (Channel     : Channel_Number;
                      Ref_Voltage : Float := 5.08) return Float;

   function Get_ADC2 (Channel     : Channel_Number;
                      Ref_Voltage : Long_Float := 5.08) return Long_Float;

   function Get_ADC2
     (List        : Channel_List;
      Ref_Voltage : Float := 5.08)
      return Ada.Numerics.Real_Arrays.Real_Vector with
     Post => List'Length = Get_ADC2'Result'Length;

   function Get_ADC2
     (List        : Channel_List;
      Ref_Voltage : Long_Float := 5.08)
      return Ada.Numerics.Long_Real_Arrays.Real_Vector with
     Post => List'Length = Get_ADC2'Result'Length;

   -----------------------------------------------------------------------------

   function RTD
     (c_delay     : DELAY_Time;
      The_Gain    : GAIN;
      The_Drate   : ADC1_DRATE) return unsigned_long;

   procedure DAC
     (volt       : DAC_VOLT;
      isPositive : Boolean;
      isOpen     : Boolean);

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
      REG_ADC2FSC1);

   CMD_RESET   : constant := 2#0000_0110#; --  Reset the ADC,                  0000 011x (06h or 07h)
   CMD_START1  : constant := 2#0000_1000#; --  Start ADC1 conversions,         0000 100x (08h or 09h)
   CMD_STOP1   : constant := 2#0000_1010#; --  Stop ADC1 conversions,          0000 101x (0Ah or 0Bh)
   CMD_START2  : constant := 2#0000_1100#; --  Start ADC2 conversions,         0000 110x (0Ch or 0Dh)
   CMD_STOP2   : constant := 2#0000_1110#; --  Stop ADC2 conversions,          0000 111x (0Eh or 0Fh)
   CMD_RDATA1  : constant := 2#0001_0010#; --  Read ADC1 data,                 0001 001x (12h or 13h)
   CMD_RDATA2  : constant := 2#0001_0100#; --  Read ADC2 data,                 0001 010x (14h or 15h)
   CMD_SYOCAL1 : constant := 2#0001_0110#; --  DC1 system offset calibration,  0001 0110 (16h)
   CMD_SYGCAL1 : constant := 2#0001_0111#; --  ADC1 system gain calibration,   0001 0111 (17h)
   CMD_SFOCAL1 : constant := 2#0001_1001#; --  ADC1 self offset calibration,   0001 1001 (19h)
   CMD_SYOCAL2 : constant := 2#0001_1011#; --  ADC2 system offset calibration, 0001 1011 (1Bh)
   CMD_SYGCAL2 : constant := 2#0001_1100#; --  ADC2 system gain calibration,   0001 1100 (1Ch)
   CMD_SFOCAL2 : constant := 2#0001_1110#; --  ADC2 self offset calibration,   0001 1110 (1Eh)
   CMD_RREG    : constant := 2#0010_0000#; --  Read registers                  001r rrrr (20h+000r rrrr)
   CMD_RREG2   : constant := 2#0000_0000#; --  number of registers to read minus 1, 000n nnnn
   CMD_WREG    : constant := 2#0100_0000#; --  Write registers                 010r rrrr (40h+000r rrrr)
   CMD_WREG2   : constant := 2#0000_0000#; --  number of registers to write minus 1, 000n nnnn

   procedure WriteCmd (Cmd : unsigned_char);

   procedure WriteReg (R : REG; data : unsigned_char);

   function Read_data (R : REG) return unsigned_char;
   type Unsigned_Char_Array is array (Natural range <>) of aliased unsigned_char with Pack => True;

   function Checksum (val : Unsigned_Char_Array; byt : unsigned_char) return unsigned_char;
   procedure Reset;

   procedure WaitDRDY;
   --  Data waiting function, DEV_DRDY_PIN is the DRDY pin,
   --  which is valid when ADC1 performs data conversion and sends a low level after the data is ready.
   --  Note ADC2 is not applicable to this function.

   function ReadChipID return unsigned_char;
   --  Chip Read function, if the return value is 1, which means the IC is ADS1263, and return 0 for ADS1262.

   function GetChannalValue (Channel : Channel_Number) return unsigned_long with
     Pre => Channel < 5;

   function Get_ADC2 (Channel : Channel_Number) return unsigned_long;

   function Read_ADC1_Data return unsigned_long;
   function Read_ADC2_Data return unsigned_long;
   --  Read ADC data function,
   --  the return value of ADC1 is 32-bit data, and for ADC2 is 24-bit data.
   --  -------------------------------------------------------------------------
   function Get_ADC1
     (List   : Channel_List) return Data_Values with
     Post => List'Length = Get_ADC1'Result'Length;

   procedure Get_ADC1
     (List        : Channel_List;
      Data        : out Data_Values) with
     pre => List'Length = Data'Length;

   function Scale (Items       : Data_Values;
                   Ref_Voltage : Long_Float := 5.08) return Ada.Numerics.Long_Real_Arrays.Real_Vector;

   function Scale (Items       : Data_Values;
                   Ref_Voltage : Float := 5.08) return Ada.Numerics.Real_Arrays.Real_Vector;

   function Scale (Item        : unsigned_long;
                   Ref_Voltage : Long_Float := 5.08) return Long_Float;

   function Scale (Item        : unsigned_long;
                   Ref_Voltage : Float := 5.08) return Float;

end Waveshare.ADS1263;
