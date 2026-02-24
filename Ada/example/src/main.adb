with Ada.Calendar;
with Ada.Text_IO;
with Ada.Long_Float_Text_IO;
with GNAT.Altivec;
with Interfaces.C;
with Waveshare.ADS1263;
with GNAT.Exception_Traces;
with GNAT.Traceback.Symbolic;

with bcm2835_h_Impl; -- to get the mockup

procedure Main is
   use Waveshare;
   use Ada.Long_Float_Text_IO;
   use Ada.Text_IO;
   use type Interfaces.C.unsigned_long;
   use all type Ada.Calendar.Time;

   REF      :  constant := 5.08;
   Continue : Boolean := True with Warnings => Off;

   -- Modify REF according to actual voltage
   -- External AVDD and AVSS(Default), or internal 2.5V
   procedure On_Ctrl_C is
   begin
      Continue := False;
   end;

   procedure TEST_ADC1 is
      Channels : constant ADS1263.Channel_List := (0, 1, 2, 3, 4);
      Value    : ADS1263.Data_Values (Channels'Range);
   begin
      while Continue loop
         Put_Line ("--------------------------------------");
         Value := ADS1263.Get_ADC1 (Channels);
         for I in  Channels'range loop
            Put ("Ch:" & Channels (I)'image & " =>" );
            Put (Value (I)'image & "  ");
            Put (Item => ADS1263.Scale (Value (I)));
            New_Line;
         end loop;
         delay 1.0;
      end loop;
   end;

   procedure TEST_ADC2 is
      Value    : ADS1263.All_Data_Values;
   begin
      ADS1263.Init_ADC2 (ADS1263.ADC2_100SPS);
      while Continue loop
         ADS1263.GetAll_ADC2 (Value);
         Put_Line (Value'image);
      end loop;
   end;

   procedure TEST_ADC1_RATE is
      Dummy    : Interfaces.C.Unsigned_Long;
      start    : Ada.Calendar.Time;
      Time     : Duration;
      Times    : constant := 10000;
   begin
      start := Ada.Calendar.Clock;
      for I in 1 .. Times loop
         Dummy := ADS1263.GetChannalValue (0);
      end loop;

      Time := Ada.Calendar.Clock - Start;
      Put_Line (Time'Image);
   end;

   procedure TEST_RTD is
      Data    : Interfaces.C.Unsigned_Long;
   begin
      Data := ADS1263.RTD (ADS1263.DELAY_8d8ms, ADS1263.GAIN_1, ADS1263.DRATE_20SPS);

   end;

begin
   Ada.Long_Float_Text_IO.Default_Exp := 0;
   GNAT.Exception_Traces.Trace_On (GNAT.Exception_Traces.Every_Raise);
   GNAT.Exception_Traces.Set_Trace_Decorator (GNAT.Traceback.Symbolic.Symbolic_Traceback_No_Hex'Access);
   ADS1263.SetMode (0);
   ADS1263.init_ADC1 (ADS1263.DRATE_400SPS);
   TEST_ADC1;
end;
