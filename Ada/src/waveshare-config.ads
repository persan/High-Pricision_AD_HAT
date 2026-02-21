with Ada.Finalization;
with Interfaces.C; use Interfaces.C;

private package Waveshare.Config is
   pragma Elaborate_Body;

   function DEV_RST_PIN return Unsigned_Char with Inline_Always;
   function DEV_CS_PIN return Unsigned_Char with Inline_Always;
   function DEV_DRDY_PIN return Unsigned_Char with Inline_Always;


   procedure DEV_Digital_Write (Pin : unsigned_Char; Value : unsigned_Char);

   function DEV_Digital_Read (Pin : unsigned_Char) return unsigned_Char;

   function DEV_SPI_WriteByte (Value : unsigned_Char) return unsigned_Char;
   procedure DEV_SPI_WriteByte (Value : unsigned_Char);

   function DEV_SPI_ReadByte return unsigned_Char;
   
private
   type Package_Controler is new Ada.Finalization.Limited_Controlled with null record with Unreferenced_Objects;
   procedure Initialize (Object : in out Package_Controler);
   procedure Finalize   (Object : in out Package_Controler);
end Waveshare.Config;
