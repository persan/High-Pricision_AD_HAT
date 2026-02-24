with Ada.Text_IO; use Ada.Text_IO;
with GNAt.Source_Info;
with GNAT.Time_Stamp;
package body bcm2835_h_Impl is
   use Interfaces.C.Strings;
   pragma Warnings (Off);
   ------------------
   -- bcm2835_init --
   ------------------
   procedure Log (Args : String := ""; Ret : String := ""; Location : String := GNAT.Source_Info.Enclosing_Entity) is
   begin
      Ada.Text_IO.Put_Line (GNAT.Time_Stamp.Current_Time &   ": " & Location &
                            (if Args'Length > 0 then"(" & Args & ")" else Args) &
                            (if Ret'Length > 0 then "-> " & Ret else ""));
   end;

   function bcm2835_init return int is
   begin
      Log;
      return 0;
   end bcm2835_init;

   -------------------
   -- bcm2835_close --
   -------------------

   function bcm2835_close return int is
   begin
      Log;
      return 0;
   end bcm2835_close;

   -----------------------
   -- bcm2835_set_debug --
   -----------------------

   procedure bcm2835_set_debug (debug : unsigned_Char) is
   begin
      log ("debug =>" & Debug'Image);
   end bcm2835_set_debug;

   -------------------------
   -- bcm2835_lib_version --
   -------------------------

   function bcm2835_lib_version return unsigned is
   begin
      log;
      return BCM2835_VERSION;
   end bcm2835_lib_version;

   ---------------------
   -- bcm2835_regbase --
   ---------------------
   Regs : array (1 .. 256) of aliased Unsigned;
   function bcm2835_regbase
     (regbase : unsigned_Char) return access Unsigned
   is
   begin
      Log ( "regbase =>" & Regbase'Image);
      return Regs (Regs'First)'Access;
   end bcm2835_regbase;

   -----------------------
   -- bcm2835_peri_read --
   -----------------------

   function bcm2835_peri_read
     (paddr : access Unsigned) return Unsigned
   is
   begin
      Log ("Padr=> " & Paddr.all'Image);
      return 0;
   end bcm2835_peri_read;

   --------------------------
   -- bcm2835_peri_read_nb --
   --------------------------

   function bcm2835_peri_read_nb
     (paddr : access Unsigned) return Unsigned
   is
   begin
      Log ("Padr=> " & Paddr.all'Image);
      return 0;
   end bcm2835_peri_read_nb;

   ------------------------
   -- bcm2835_peri_write --
   ------------------------

   procedure bcm2835_peri_write
     (paddr : access Unsigned; value : Unsigned)
   is
   begin
      Log ("Padr=> " & Paddr.all'Image & ", value=> " & Value'Image);
   end bcm2835_peri_write;

   ---------------------------
   -- bcm2835_peri_write_nb --
   ---------------------------

   procedure bcm2835_peri_write_nb
     (paddr : access Unsigned; value : Unsigned)
   is
   begin
      log ("padr=> " & Paddr.all'Image & ", value=> " & value'Image);
   end bcm2835_peri_write_nb;

   ---------------------------
   -- bcm2835_peri_set_bits --
   ---------------------------

   procedure bcm2835_peri_set_bits
     (paddr : access Unsigned;
      Value : Unsigned;
      mask  : Unsigned)
   is
   begin
      log;
   end bcm2835_peri_set_bits;

   -----------------------
   -- bcm2835_gpio_fsel --
   -----------------------

   procedure bcm2835_gpio_fsel
     (pin : unsigned_Char; mode : unsigned_Char)
   is
   begin
      Log ("pin =>" & Pin'image & ", mode => " & Mode'Image);
   end bcm2835_gpio_fsel;

   ----------------------
   -- bcm2835_gpio_set --
   ----------------------

   procedure bcm2835_gpio_set (pin : unsigned_Char) is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_gpio_set;

   ----------------------
   -- bcm2835_gpio_clr --
   ----------------------

   procedure bcm2835_gpio_clr (pin : unsigned_Char) is
   begin
      Log ("pin =>" & Pin'Image);
   end bcm2835_gpio_clr;

   ----------------------------
   -- bcm2835_gpio_set_multi --
   ----------------------------

   procedure bcm2835_gpio_set_multi (mask : Unsigned) is
   begin
      Log ("mask =>" & mask'Image);
   end bcm2835_gpio_set_multi;

   ----------------------------
   -- bcm2835_gpio_clr_multi --
   ----------------------------

   procedure bcm2835_gpio_clr_multi (mask : Unsigned) is
   begin
      Log ("mask =>" & mask'Image);
   end bcm2835_gpio_clr_multi;

   ----------------------
   -- bcm2835_gpio_lev --
   ----------------------

   function bcm2835_gpio_lev
     (pin : unsigned_Char) return unsigned_Char
   is
   begin
      Log ("pin =>" & pin'Image);
      return 0;
   end bcm2835_gpio_lev;

   ----------------------
   -- bcm2835_gpio_eds --
   ----------------------

   function bcm2835_gpio_eds
     (pin : unsigned_Char) return unsigned_Char
   is
   begin
      Log ("pin =>" & pin'Image);
      return 0;
   end bcm2835_gpio_eds;

   ----------------------------
   -- bcm2835_gpio_eds_multi --
   ----------------------------

   function bcm2835_gpio_eds_multi
     (mask : Unsigned) return Unsigned
   is
   begin
      Log ("mask =>" & mask'Image);
      return 0;
   end bcm2835_gpio_eds_multi;

   --------------------------
   -- bcm2835_gpio_set_eds --
   --------------------------

   procedure bcm2835_gpio_set_eds (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_set_eds;

   --------------------------------
   -- bcm2835_gpio_set_eds_multi --
   --------------------------------

   procedure bcm2835_gpio_set_eds_multi (mask : Unsigned) is
   begin
      Log ("mask =>" & mask'Image);
   end bcm2835_gpio_set_eds_multi;

   ----------------------
   -- bcm2835_gpio_ren --
   ----------------------

   procedure bcm2835_gpio_ren (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_ren;

   --------------------------
   -- bcm2835_gpio_clr_ren --
   --------------------------

   procedure bcm2835_gpio_clr_ren (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_clr_ren;

   ----------------------
   -- bcm2835_gpio_fen --
   ----------------------

   procedure bcm2835_gpio_fen (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_fen;

   --------------------------
   -- bcm2835_gpio_clr_fen --
   --------------------------

   procedure bcm2835_gpio_clr_fen (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_clr_fen;

   ----------------------
   -- bcm2835_gpio_hen --
   ----------------------

   procedure bcm2835_gpio_hen (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_hen;

   --------------------------
   -- bcm2835_gpio_clr_hen --
   --------------------------

   procedure bcm2835_gpio_clr_hen (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_clr_hen;

   ----------------------
   -- bcm2835_gpio_len --
   ----------------------

   procedure bcm2835_gpio_len (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_len;

   --------------------------
   -- bcm2835_gpio_clr_len --
   --------------------------

   procedure bcm2835_gpio_clr_len (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_clr_len;

   -----------------------
   -- bcm2835_gpio_aren --
   -----------------------

   procedure bcm2835_gpio_aren (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_aren;

   ---------------------------
   -- bcm2835_gpio_clr_aren --
   ---------------------------

   procedure bcm2835_gpio_clr_aren (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_clr_aren;

   -----------------------
   -- bcm2835_gpio_afen --
   -----------------------

   procedure bcm2835_gpio_afen (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_afen;

   ---------------------------
   -- bcm2835_gpio_clr_afen --
   ---------------------------

   procedure bcm2835_gpio_clr_afen (pin : unsigned_Char) is
   begin
      Log ("pin =>" & pin'Image);
   end bcm2835_gpio_clr_afen;

   ----------------------
   -- bcm2835_gpio_pud --
   ----------------------

   procedure bcm2835_gpio_pud (pud : unsigned_Char) is
   begin
      Log ("pud =>" & pud'Image);
   end bcm2835_gpio_pud;

   -------------------------
   -- bcm2835_gpio_pudclk --
   -------------------------

   procedure bcm2835_gpio_pudclk
     (pin : unsigned_Char; on : unsigned_Char)
   is
   begin
      Log ("pin =>" & Pin'Image & ", on =>" & on'Image);
   end bcm2835_gpio_pudclk;

   ----------------------
   -- bcm2835_gpio_pad --
   ----------------------

   function bcm2835_gpio_pad
     (group : unsigned_Char) return Unsigned
   is
   begin
      Log ("group =>" & group'Image);
      return 0;
   end bcm2835_gpio_pad;

   --------------------------
   -- bcm2835_gpio_set_pad --
   --------------------------

   procedure bcm2835_gpio_set_pad
     (group : unsigned_Char; control : Unsigned)
   is
   begin
      Log ("group =>" & group'Image & ", control =>" & control'Image);
   end bcm2835_gpio_set_pad;

   -------------------
   -- bcm2835_delay --
   -------------------

   procedure bcm2835_delay (millis : unsigned) is
   begin
      Log ("millis =>" & millis'Image);
   end bcm2835_delay;

   -------------------------------
   -- bcm2835_delayMicroseconds --
   -------------------------------

   procedure bcm2835_delayMicroseconds (micros : Interfaces.Unsigned_64) is
   begin
      Log ("micros =>" & micros'Image);
   end bcm2835_delayMicroseconds;

   ------------------------
   -- bcm2835_gpio_write --
   ------------------------

   procedure bcm2835_gpio_write
     (pin : unsigned_Char; on : unsigned_Char)
   is
   begin
      Log ("pin => " & Pin'Image & ", on => " & On'Image);
   end bcm2835_gpio_write;

   ------------------------------
   -- bcm2835_gpio_write_multi --
   ------------------------------

   procedure bcm2835_gpio_write_multi
     (mask : Unsigned; on : unsigned_Char)
   is
   begin
      Log ("mask => " & mask'Image & ", on => " & On'Image);
   end bcm2835_gpio_write_multi;

   -----------------------------
   -- bcm2835_gpio_write_mask --
   -----------------------------

   procedure bcm2835_gpio_write_mask
     (value : Unsigned; mask : Unsigned)
   is
   begin
      Log ("value => " & value'Image & ", mask => " & mask'Image);
   end bcm2835_gpio_write_mask;

   --------------------------
   -- bcm2835_gpio_set_pud --
   --------------------------

   procedure bcm2835_gpio_set_pud
     (pin : unsigned_Char; pud : unsigned_Char)
   is
   begin
      Log ("pin => " & pin'Image & ", pud => " & pud'Image);
   end bcm2835_gpio_set_pud;

   --------------------------
   -- bcm2835_gpio_get_pud --
   --------------------------

   function bcm2835_gpio_get_pud
     (pin : unsigned_Char) return unsigned_Char
   is
   begin
      Log ("pin => " & Pin'Image);
      return 0;
   end bcm2835_gpio_get_pud;

   -----------------------
   -- bcm2835_spi_begin --
   -----------------------

   function bcm2835_spi_begin return int is
   begin
      Log;
      return 0;
   end bcm2835_spi_begin;

   ---------------------
   -- bcm2835_spi_end --
   ---------------------

   procedure bcm2835_spi_end is
   begin
      Log;
   end bcm2835_spi_end;

   -----------------------------
   -- bcm2835_spi_setBitOrder --
   -----------------------------

   procedure bcm2835_spi_setBitOrder (order : unsigned_Char) is
   begin
      Log ("order => " & Order'Image);
   end bcm2835_spi_setBitOrder;

   ---------------------------------
   -- bcm2835_spi_setClockDivider --
   ---------------------------------

   procedure bcm2835_spi_setClockDivider (divider : Unsigned_Short) is
   begin
      Log ("divider => " & divider'Image);
   end bcm2835_spi_setClockDivider;

   ------------------------------
   -- bcm2835_spi_set_speed_hz --
   ------------------------------

   procedure bcm2835_spi_set_speed_hz (speed_hz : Unsigned) is
   begin
      Log ("speed_hz => " & speed_hz'Image);
   end bcm2835_spi_set_speed_hz;

   -----------------------------
   -- bcm2835_spi_setDataMode --
   -----------------------------

   procedure bcm2835_spi_setDataMode (mode : unsigned_Char) is
   begin
      Log ("mode => " & mode'Image);
   end bcm2835_spi_setDataMode;

   ----------------------------
   -- bcm2835_spi_chipSelect --
   ----------------------------

   procedure bcm2835_spi_chipSelect (cs : unsigned_Char) is
   begin
      Log ("cs => " & cs'Image);
   end bcm2835_spi_chipSelect;

   ---------------------------------------
   -- bcm2835_spi_setChipSelectPolarity --
   ---------------------------------------

   procedure bcm2835_spi_setChipSelectPolarity
     (cs : unsigned_Char; active : unsigned_Char)
   is
   begin
      Log ("cs =>" & Cs'Image & ", active =>" & Active'Image);
   end bcm2835_spi_setChipSelectPolarity;


   REGMODE0  : Unsigned_Char := 0;
   REGMODE1  : Unsigned_Char := 0;
   REGMODE2  : Unsigned_Char := 0;
   REG_MODE0 : Unsigned_Char := 0;
   REFMUX    : Unsigned_Char := 0;
   INPMUX    : Unsigned_Char := 0;
   --------------------------
   -- bcm2835_spi_transfer --
   --------------------------
   Buffer    : array (1 .. 16) of Unsigned_Char := (others => 255);
   Cursor    : Natural := Buffer'First;
   function bcm2835_spi_transfer
     (value : unsigned_Char) return unsigned_Char
   is
      Ret : Unsigned_Char := 0;
   begin
      Buffer (Cursor) := Value;
      Put_Line (Buffer (Buffer'first .. Cursor)'image);
      Cursor := Cursor + 1;
      if Buffer (1 .. 3) = (2#0001_0000#, 0, 0) then
         Buffer := (others => 255);
         Cursor := Buffer'First;
         Ret := 2#0010_0000#;

      elsif Buffer (1) = 2#0000_1010# then
         Buffer := (others => 255);
         Cursor := Buffer'First;

      elsif Buffer (1) = 2#0000_1000# then
         Buffer := (others => 255);
         Cursor := Buffer'First;

      elsif Buffer (1 .. 2) = (2#0001_0010#, 0) then
         Cursor := Buffer'First;
         Buffer := (others => 255);
         Ret := 16#40#;

      elsif Buffer (1 .. 2) = (69, 0) and then Buffer (3) /= 255 then
         Cursor := Buffer'First;
         REGMODE2 := Buffer (3);
         Buffer := (others => 255);
      elsif Buffer (1 .. 3) = (37, 0, 0) then
         Buffer := (others => 255);
         Cursor := Buffer'First;
         Ret := REGMODE2;

      elsif Buffer (1 .. 2) = (79, 0) and then Buffer (3) /= 255 then
         Cursor := Buffer'First;
         REFMUX := Buffer (3);
         Buffer := (others => 255);
      elsif Buffer (1 .. 3) = (47, 0, 0) then
         Buffer := (others => 255);
         Cursor := Buffer'First;
         Ret := REFMUX;

      elsif Buffer (1 .. 2) = (67, 0) and then Buffer (3) /= 255 then
         Cursor := Buffer'First;
         REGMODE0 := Buffer (3);
         Buffer := (others => 255);
      elsif Buffer (1 .. 3) = (35, 0, 0) then
         Buffer := (others => 255);
         Cursor := Buffer'First;
         Ret := REGMODE0;

      elsif Buffer (1 .. 2) = (68, 0) and then Buffer (3) /= 255 then
         Cursor := Buffer'First;
         REGMODE1 := Buffer (3);
         Buffer := (others => 255);
      elsif Buffer (1 .. 3) = (36, 0, 0) then
         Buffer := (others => 255);
         Cursor := Buffer'First;
         Ret := REGMODE1;

      elsif Buffer (1 .. 2) = (70, 0) and then Buffer (3) /= 255 then
         Cursor := Buffer'First;
         INPMUX := Buffer (3);
         Buffer := (others => 255);
      elsif Buffer (1 .. 3) = (38, 0, 0) then
         Buffer := (others => 255);
         Cursor := Buffer'First;
         Ret := INPMUX;

      elsif Buffer (1 .. 2) = (67, 0) and then Buffer (3) /= 255 then
         Cursor := Buffer'First;
         REG_MODE0 := Buffer (3);
         Buffer := (others => 255);
      elsif Buffer (1 .. 3) = (35, 0, 0) then
         Buffer := (others => 255);
         Cursor := Buffer'First;
         Ret := REG_MODE0;

      elsif Buffer (1) =  0 then
         Buffer := (others => 255);
         Cursor := Buffer'First;

      elsif Buffer (1) =  14 then
         Buffer := (others => 255);
         Cursor := Buffer'First;
      end if;
      Log ("value =>" & Value'Image, Ret => Ret'Image);
      return Ret;
   end bcm2835_spi_transfer;

   ----------------------------
   -- bcm2835_spi_transfernb --
   ----------------------------

   procedure bcm2835_spi_transfernb
     (tbuf : Interfaces.C.Strings.chars_ptr;
      rbuf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_spi_transfernb;

   ---------------------------
   -- bcm2835_spi_transfern --
   ---------------------------

   procedure bcm2835_spi_transfern
     (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
   is
   begin
      Log ("buf => """ & Value (buf) & """" &
             ", len =>" & Len'Image);
   end bcm2835_spi_transfern;

   -------------------------
   -- bcm2835_spi_writenb --
   -------------------------

   procedure bcm2835_spi_writenb
     (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
   is
   begin
      Log ("buf => """ & Value (buf) & """, len =>" & Len'Image);
   end bcm2835_spi_writenb;

   -----------------------
   -- bcm2835_spi_write --
   -----------------------

   procedure bcm2835_spi_write (data : Unsigned_Short) is
   begin
      Log (" data =>" & data'Image);
   end bcm2835_spi_write;

   ---------------------------
   -- bcm2835_aux_spi_begin --
   ---------------------------

   function bcm2835_aux_spi_begin return int is
   begin
      Log;
      return 0;
   end bcm2835_aux_spi_begin;

   -------------------------
   -- bcm2835_aux_spi_end --
   -------------------------

   procedure bcm2835_aux_spi_end is
   begin
      Log;
   end bcm2835_aux_spi_end;

   -------------------------------------
   -- bcm2835_aux_spi_setClockDivider --
   -------------------------------------
   Spi_CalcClockDivider : Unsigned_Short := 0;
   procedure bcm2835_aux_spi_setClockDivider (divider : Unsigned_Short)
   is
   begin
      Spi_CalcClockDivider := Divider;
      Log ("Divider =>" & Divider'Image);
   end bcm2835_aux_spi_setClockDivider;

   --------------------------------------
   -- bcm2835_aux_spi_CalcClockDivider --
   --------------------------------------

   function bcm2835_aux_spi_CalcClockDivider
     (speed_hz : Unsigned) return Unsigned_Short
   is
   begin
      Log ("speed_hz =>" & speed_hz'Image);
      return Spi_CalcClockDivider;
   end bcm2835_aux_spi_CalcClockDivider;

   ---------------------------
   -- bcm2835_aux_spi_write --
   ---------------------------

   procedure bcm2835_aux_spi_write (data : Unsigned_Short) is
   begin
      Log ("data =>" & data'Image);
   end bcm2835_aux_spi_write;

   -----------------------------
   -- bcm2835_aux_spi_writenb --
   -----------------------------

   procedure bcm2835_aux_spi_writenb
     (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
   is
   begin
      Log ("buf => """ & Value (buf) & """, len =>" & Len'Image);
   end bcm2835_aux_spi_writenb;

   -------------------------------
   -- bcm2835_aux_spi_transfern --
   -------------------------------

   procedure bcm2835_aux_spi_transfern
     (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
   is
   begin
      Log ("buf => """ & Value (buf) & """, len =>" & Len'Image);
   end bcm2835_aux_spi_transfern;

   --------------------------------
   -- bcm2835_aux_spi_transfernb --
   --------------------------------

   procedure bcm2835_aux_spi_transfernb
     (tbuf : Interfaces.C.Strings.chars_ptr;
      rbuf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
   is
   begin
      Log ("tbuf => """ & Value (tbuf) & """" &
             "rbuf => """ & Value (RBuf) & """" &
             ", len =>" & Len'Image);
   end bcm2835_aux_spi_transfernb;

   ------------------------------
   -- bcm2835_aux_spi_transfer --
   ------------------------------

   function bcm2835_aux_spi_transfer
     (value : unsigned_Char) return unsigned_Char
   is
   begin
      Log ("value => " & Value'Image);
      return 0;
   end bcm2835_aux_spi_transfer;

   -----------------------
   -- bcm2835_i2c_begin --
   -----------------------

   function bcm2835_i2c_begin return int is
   begin
      log;
      return 0;
   end bcm2835_i2c_begin;

   ---------------------
   -- bcm2835_i2c_end --
   ---------------------

   procedure bcm2835_i2c_end is
   begin
      log;
   end bcm2835_i2c_end;

   ---------------------------------
   -- bcm2835_i2c_setSlaveAddress --
   ---------------------------------

   procedure bcm2835_i2c_setSlaveAddress (addr : unsigned_Char) is
   begin
      Log ("addr =>" & addr'Image);
   end bcm2835_i2c_setSlaveAddress;

   ---------------------------------
   -- bcm2835_i2c_setClockDivider --
   ---------------------------------

   procedure bcm2835_i2c_setClockDivider (divider : Unsigned_Short) is
   begin
      Log ("divider =>" & divider'Image);
   end bcm2835_i2c_setClockDivider;

   ------------------------------
   -- bcm2835_i2c_set_baudrate --
   ------------------------------

   procedure bcm2835_i2c_set_baudrate (baudrate : Unsigned) is
   begin
      Log ("baudrate =>" & baudrate'Image);
   end bcm2835_i2c_set_baudrate;

   -----------------------
   -- bcm2835_i2c_write --
   -----------------------

   function bcm2835_i2c_write
     (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
      return unsigned_Char
   is
      use Interfaces.C.Strings;
   begin
      Log ("Buff =>" & (if Buf = Null_Ptr then
              "null" else
                 Value (Buf)) &
             ", len =>" & Len'Image);
      return 0;
   end bcm2835_i2c_write;

   ----------------------
   -- bcm2835_i2c_read --
   ----------------------

   function bcm2835_i2c_read
     (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)
      return unsigned_Char
   is
   begin
      Log ("buf => """ & Value (Buf) & """" &
             ", len =>" & Len'Image);
      return 0;
   end bcm2835_i2c_read;

   ----------------------------------
   -- bcm2835_i2c_read_register_rs --
   ----------------------------------

   function bcm2835_i2c_read_register_rs
     (regaddr : Interfaces.C.Strings.chars_ptr;
      buf     : Interfaces.C.Strings.chars_ptr;
      Len     : Unsigned)
      return unsigned_Char
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
      return 0;
   end bcm2835_i2c_read_register_rs;

   -------------------------------
   -- bcm2835_i2c_write_read_rs --
   -------------------------------

   function bcm2835_i2c_write_read_rs
     (cmds : Interfaces.C.Strings.chars_ptr; cmds_len : Unsigned;
      buf  : Interfaces.C.Strings.chars_ptr; buf_len : Unsigned)
      return unsigned_Char
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
      return 0;
   end bcm2835_i2c_write_read_rs;

   -----------------------
   -- bcm2835_smi_begin --
   -----------------------

   function bcm2835_smi_begin return int is
   begin
      Log;
      return 0;
   end bcm2835_smi_begin;

   ---------------------
   -- bcm2835_smi_end --
   ---------------------

   procedure bcm2835_smi_end is
   begin
      Log;
   end bcm2835_smi_end;

   ----------------------------
   -- bcm2835_smi_set_timing --
   ----------------------------

   procedure bcm2835_smi_set_timing
     (smichannel   : Unsigned;
      readchannel  : Unsigned;
      setupcycles  : Unsigned;
      strobecycles : Unsigned;
      holdcycles   : Unsigned; pacecycles : Unsigned)
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_smi_set_timing;

   -----------------------
   -- bcm2835_smi_write --
   -----------------------

   procedure bcm2835_smi_write
     (smichannel : Unsigned; data : unsigned_Char;
      address    : Unsigned)
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_smi_write;

   ----------------------
   -- bcm2835_smi_read --
   ----------------------

   function bcm2835_smi_read
     (smichannel : Unsigned; address : Unsigned)
      return Unsigned
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
      return 0;
   end bcm2835_smi_read;

   ---------------------
   -- bcm2835_st_read --
   ---------------------

   function bcm2835_st_read return Interfaces.Unsigned_64 is
   begin
      Log;
      return 0;
   end bcm2835_st_read;

   ----------------------
   -- bcm2835_st_delay --
   ----------------------

   procedure bcm2835_st_delay
     (offset_micros : Interfaces.Unsigned_64; micros : Interfaces.Unsigned_64)
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_st_delay;

   ---------------------------
   -- bcm2835_pwm_set_clock --
   ---------------------------

   procedure bcm2835_pwm_set_clock (divisor : Unsigned) is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_pwm_set_clock;

   --------------------------
   -- bcm2835_pwm_set_mode --
   --------------------------

   procedure bcm2835_pwm_set_mode
     (channel : unsigned_Char; markspace : unsigned_Char;
      enabled : unsigned_Char)
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_pwm_set_mode;

   ---------------------------
   -- bcm2835_pwm_set_range --
   ---------------------------

   procedure bcm2835_pwm_set_range
     (channel : unsigned_Char; c_range : Unsigned)
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_pwm_set_range;

   --------------------------
   -- bcm2835_pwm_set_data --
   --------------------------

   procedure bcm2835_pwm_set_data
     (channel : unsigned_Char; data : Unsigned)
   is
   begin
      Ada.Text_IO.Put_Line (GNAT.Source_Info.Enclosing_Entity);
   end bcm2835_pwm_set_data;

end bcm2835_h_Impl;
