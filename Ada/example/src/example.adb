with Ada.Calendar;
with Ada.Text_IO;
with Ada.Float_Text_IO;
with Interfaces.C;
with Waveshare.ADS1263;
with Ada.Numerics.Real_Arrays;
package body example is
   use Waveshare;
   use Ada.Float_Text_IO;
   use Ada.Text_IO;
   use all type Ada.Calendar.Time;
   Continue : Boolean := True with Warnings => Off;

   -- Modify REF according to actual voltage
   -- External AVDD and AVSS(Default), or internal 2.5V
   procedure On_Ctrl_C is
   begin
      Continue := False;
   end;

   procedure TEST_ADC1 is
      Channels : constant ADS1263.Channel_List := [0, 1, 2, 3, 4];
      Value    : Ada.Numerics.Real_Arrays.Real_Vector (Channels'Range);
   begin
      ADS1263.Set_Mode (Differential => False);
      ADS1263.init_ADC1 (Rate => ADS1263.DRATE_400SPS);
      while Continue loop
         Put_Line ("--------------------------------------");
         Value := ADS1263.Get_ADC1 (Channels);
         for I in  Channels'range loop
            Put ("Ch:" & Channels (I)'image & " =>" );
            Put (Item => Value (I));
            New_Line;
         end loop;
         delay 1.0;
      end loop;
   end;

   procedure TEST_ADC2 is
      Channels : constant ADS1263.Channel_List := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      Value    : Ada.Numerics.Real_Arrays.Real_Vector (Channels'Range);
   begin
      ADS1263.Init_ADC2 (ADS1263.ADC2_100SPS);
      while Continue loop
         Value := ADS1263.Get_ADC2 (Channels);
         Put_Line (Value'image);
      end loop;
   end;

   procedure TEST_ADC1_RATE is
      Dummy    : float;
      start    : Ada.Calendar.Time;
      Time     : Duration;
      Times    : constant := 1000;
   begin
      ADS1263.Set_Mode (Differential => False);
      ADS1263.init_ADC1 (Rate => ADS1263.DRATE_400SPS);
      start := Ada.Calendar.Clock;
      for I in 1 .. Times loop
         Dummy := ADS1263.Get_ADC1 (0);
      end loop;

      Time := Ada.Calendar.Clock - Start;
      Put_Line (Time'Image);
   end;

   procedure TEST_RTD is
      Dummy_Data    : Interfaces.C.Unsigned_Long;
   begin
      Dummy_Data := ADS1263.RTD (ADS1263.DELAY_8d8ms, ADS1263.GAIN_1, ADS1263.DRATE_20SPS);

   end;
end example;
