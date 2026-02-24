with Ada.Calendar;
with Ada.Text_IO;
with Ada.Long_Float_Text_IO;
with GNAT.Altivec;
with GNAT.Ctrl_C;
with Interfaces.C;
with Waveshare.ADS1263;
with GNAT.Exception_Traces;
with GNAT.Traceback.Symbolic;

with bcm2835_h_Impl; -- to get the mockup

procedure Example.Main is




begin
   Ada.Long_Float_Text_IO.Default_Exp := 0;
   GNAT.Ctrl_C.Install_Handler (On_Ctrl_C'Access);
   GNAT.Exception_Traces.Trace_On (GNAT.Exception_Traces.Every_Raise);
   GNAT.Exception_Traces.Set_Trace_Decorator (GNAT.Traceback.Symbolic.Symbolic_Traceback_No_Hex'Access);

   TEST_ADC1;
end;
