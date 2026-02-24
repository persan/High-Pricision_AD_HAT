with Ada.Finalization;
with Interfaces.C; use Interfaces.C;

private package Waveshare.Config is
   pragma Elaborate_Body;

   function DEV_RST_PIN return unsigned_char with Inline_Always;
   function DEV_CS_PIN return unsigned_char with Inline_Always;
   function DEV_DRDY_PIN return unsigned_char with Inline_Always;

   procedure DEV_Digital_Write (Pin : unsigned_char; Value : unsigned_char);

   function DEV_Digital_Read (Pin : unsigned_char) return unsigned_char;

   function DEV_SPI_WriteByte (Value : unsigned_char) return unsigned_char;
   procedure DEV_SPI_WriteByte (Value : unsigned_char);

   function DEV_SPI_ReadByte return unsigned_char;

private
   type Package_Controler is new Ada.Finalization.Limited_Controlled with null record with Unreferenced_Objects;
   overriding procedure Initialize (Object : in out Package_Controler);
   overriding procedure Finalize   (Object : in out Package_Controler);
end Waveshare.Config;
