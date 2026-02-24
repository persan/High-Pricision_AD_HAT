with Bcm2835;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.Source_Info;
package body Waveshare.Config is

   -----------------------
   -- DEV_Digital_Write --
   -----------------------
   The_DEV_RST_PIN : aliased Unsigned_Char := 0;

   The_DEV_CS_PIN : aliased Unsigned_Char := 0;

   The_DEV_DRDY_PIN : aliased Unsigned_Char := 0;

   function DEV_RST_PIN return Unsigned_Char is
   begin
      return The_DEV_RST_PIN;
   end;

   function DEV_CS_PIN return Unsigned_Char  is
   begin
      return The_DEV_CS_PIN;
   end;
   function DEV_DRDY_PIN return Unsigned_Char  is
   begin
      return The_DEV_DRDY_PIN;
   end;


   procedure DEV_Digital_Write
     (Pin : unsigned_Char; Value : unsigned_Char)
   is
   begin
      pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & "(Pin =>" & Pin'image & ",Value => " & Value'Image & ");"));

      Bcm2835.Gpio_Write (Pin, Value);
   end DEV_Digital_Write;

   ----------------------
   -- DEV_Digital_Read --
   ----------------------

   function DEV_Digital_Read
     (Pin : unsigned_Char) return unsigned_Char
   is
   begin
      pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & "(Pin =>" & Pin'Image & ");"));
      return Bcm2835.Gpio_Lev (Pin);
   end DEV_Digital_Read;


   -----------------------
   -- DEV_SPI_WriteByte --
   -----------------------

   function DEV_SPI_WriteByte
     (Value : unsigned_Char) return unsigned_Char
   is
   begin
      return Ret : Unsigned_Char := Bcm2835.Spi_Transfer (Value)  do
         pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & "(Value =>" & Value'Image & ") -> " & Ret'image & ";"));
         null;
      end return ;
   end DEV_SPI_WriteByte;

   procedure DEV_SPI_WriteByte (Value : unsigned_Char) is
      Dummy : Unsigned_Char;
   begin
      Dummy := DEV_SPI_WriteByte (Value);
   end;

   ----------------------
   -- DEV_SPI_ReadByte --
   ----------------------

   function DEV_SPI_ReadByte return unsigned_Char is
   begin
      return DEV_SPI_WriteByte (16#00#);
   end DEV_SPI_ReadByte;

   --  static int DEV_Equipment_Testing(void)
   --  {
   --  	int i;
   --  	int fd;
   --  	char value_str[20];
   --  	fd = open("/etc/issue", O_RDONLY);
   --      printf("Current environment: ");
   --  	while(1) {
   --  		if (fd < 0) {
   --  			Debug( "Read failed Pin\n");
   --  			return -1;
   --  		}
   --  		for(i=0;; i++) {
   --  			if (read(fd, &value_str[i], 1) < 0) {
   --  				Debug( "failed to read value!\n");
   --  				return -1;
   --  			}
   --  			if(value_str[i] ==32) {
   --  				printf("\r\n");
   --  				break;
   --  			}
   --  			printf("%c",value_str[i]);
   --  		}
   --  		break;
   --  	}
   --  	if(i<5) {
   --  		printf("Unrecognizable\r\n");
   --  	} else {
   --  		char RPI_System[10]   = {"Raspbian"};
   --  		for(i=0; i<6; i++) {
   --  			if(RPI_System[i]!= value_str[i]) {
   --  				printf("Please make JETSON !!!!!!!!!!\r\n");
   --  				return -1;
   --  			}
   --  		}
   --  	}

   --  	return 0;
   --  }
   --



   procedure DEV_GPIO_Init is
      procedure DEV_GPIO_Mode (Pin : Unsigned_Char; Mode : Unsigned_Short) is
      begin
         if Mode = 0 then
            Bcm2835.Gpio_Fsel (Pin, Bcm2835.GPIO_FSEL_INPT);
         else
            Bcm2835.Gpio_Fsel (Pin, Bcm2835.GPIO_FSEL_OUTP);
         end if;
      end;
   begin
      pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & ";"));
      The_DEV_RST_PIN     := 18;
      The_DEV_CS_PIN      := 22;
      The_DEV_DRDY_PIN    := 17;

      DEV_GPIO_Mode (DEV_RST_PIN, 1);
      DEV_GPIO_Mode (DEV_CS_PIN, 1);

      DEV_GPIO_Mode (DEV_DRDY_PIN, 0);

      DEV_Digital_Write (DEV_CS_PIN, 1);
   end;




   procedure Initialize (Object : in out Package_Controler) is
      Dummy_Int : Int;
   begin
      pragma Debug (Put_Line (GNAT.Source_Info.Enclosing_Entity & ";"));

      -- DEV_Equipment_Testing;
      if Bcm2835.Init = 0 then
         raise Program_Error with  "bcm2835 init Failed";
      end if;
      DEV_GPIO_Init;

      Dummy_Int := Bcm2835.Spi_Begin;                             --  Start spi interface, set spi pin for the reuse function
      Bcm2835.Spi_SetBitOrder (Bcm2835.SPI_BIT_ORDER_MSBFIRST);   --  High first transmission
      Bcm2835.Spi_SetDataMode (Bcm2835.SPI_MODE1);                --  Spi mode 1, '0, 1'
      Bcm2835.Spi_SetClockDivider (Bcm2835.SPI_CLOCK_DIVIDER_32); --  Frequency
   end;

   procedure Finalize   (Object : in out Package_Controler) is
      Dummy : int;
   begin
      DEV_Digital_Write (DEV_RST_PIN, Bcm2835.LOW);
      DEV_Digital_Write (DEV_CS_PIN, Bcm2835.LOW);
      Bcm2835.Spi_End;
      Dummy := Bcm2835.Close;
   end;
   Controler : Package_Controler;


end Waveshare.Config;
