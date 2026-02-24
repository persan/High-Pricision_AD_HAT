with Ada.Long_Float_Text_IO;
with GNAT.Ctrl_C;
with GNAT.Exception_Traces;
with GNAT.Traceback.Symbolic;

with bcm2835_h_Impl; pragma Unreferenced (Bcm2835_H_Impl); -- to get the mockup

procedure Example.Main is

begin
   Ada.Long_Float_Text_IO.Default_Exp := 0;
   GNAT.Ctrl_C.Install_Handler (On_Ctrl_C'Access);
   GNAT.Exception_Traces.Trace_On (GNAT.Exception_Traces.Every_Raise);
   GNAT.Exception_Traces.Set_Trace_Decorator (GNAT.Traceback.Symbolic.Symbolic_Traceback_No_Hex'Access);
   -- TEST_ADC1;
   TEST_ADC1_RATE;
end;
