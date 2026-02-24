pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package bcm2835_h_Impl is

   --  The intent of this packe is to enable a mockup for the
   --  bcm2835 chip on the rasperry-pi.

   BCM2835_VERSION : constant := 10077;  --  bcm2835.h:679

   HIGH            : constant := 16#1#;  --  bcm2835.h:701

   LOW             : constant := 16#0#;  --  bcm2835.h:703
   --  arg-macro: function MIN (a, b)
   --    return a < b ? a : b;

   BCM2835_CORE_CLK_HZ : constant := 250000000;  --  bcm2835.h:711

   BMC2835_RPI2_DT_FILENAME : aliased constant String := "/proc/device-tree/soc/ranges" & ASCII.NUL;  --  bcm2835.h:714

   BCM2835_PERI_BASE : constant := 16#20000000#;  --  bcm2835.h:723

   BCM2835_PERI_SIZE : constant := 16#01000000#;  --  bcm2835.h:725

   BCM2835_RPI2_PERI_BASE : constant := 16#3F000000#;  --  bcm2835.h:727

   BCM2835_RPI4_PERI_BASE : constant := 16#FE000000#;  --  bcm2835.h:729

   BCM2835_RPI4_PERI_SIZE : constant := 16#01800000#;  --  bcm2835.h:731

   BCM2835_ST_BASE : constant := 16#3000#;  --  bcm2835.h:736

   BCM2835_GPIO_PADS : constant := 16#100000#;  --  bcm2835.h:738

   BCM2835_CLOCK_BASE : constant := 16#101000#;  --  bcm2835.h:740

   BCM2835_GPIO_BASE : constant := 16#200000#;  --  bcm2835.h:742

   BCM2835_SPI0_BASE : constant := 16#204000#;  --  bcm2835.h:744

   BCM2835_BSC0_BASE : constant := 16#205000#;  --  bcm2835.h:746

   BCM2835_GPIO_PWM : constant := 16#20C000#;  --  bcm2835.h:748

   BCM2835_AUX_BASE : constant := 16#215000#;  --  bcm2835.h:750

   BCM2835_SPI1_BASE : constant := 16#215080#;  --  bcm2835.h:752

   BCM2835_SPI2_BASE : constant := 16#2150C0#;  --  bcm2835.h:754

   BCM2835_BSC1_BASE : constant := 16#804000#;  --  bcm2835.h:756

   BCM2835_SMI_BASE : constant := 16#600000#;  --  bcm2835.h:760

   BCM2835_PAGE_SIZE : constant := (4 * 1024);  --  bcm2835.h:851

   BCM2835_BLOCK_SIZE : constant := (4 * 1024);  --  bcm2835.h:853

   BCM2835_GPFSEL0 : constant := 16#0000#;  --  bcm2835.h:863
   BCM2835_GPFSEL1 : constant := 16#0004#;  --  bcm2835.h:864
   BCM2835_GPFSEL2 : constant := 16#0008#;  --  bcm2835.h:865
   BCM2835_GPFSEL3 : constant := 16#000c#;  --  bcm2835.h:866
   BCM2835_GPFSEL4 : constant := 16#0010#;  --  bcm2835.h:867
   BCM2835_GPFSEL5 : constant := 16#0014#;  --  bcm2835.h:868
   BCM2835_GPSET0  : constant := 16#001c#;  --  bcm2835.h:869
   BCM2835_GPSET1  : constant := 16#0020#;  --  bcm2835.h:870
   BCM2835_GPCLR0  : constant := 16#0028#;  --  bcm2835.h:871
   BCM2835_GPCLR1  : constant := 16#002c#;  --  bcm2835.h:872
   BCM2835_GPLEV0  : constant := 16#0034#;  --  bcm2835.h:873
   BCM2835_GPLEV1  : constant := 16#0038#;  --  bcm2835.h:874
   BCM2835_GPEDS0  : constant := 16#0040#;  --  bcm2835.h:875
   BCM2835_GPEDS1  : constant := 16#0044#;  --  bcm2835.h:876
   BCM2835_GPREN0  : constant := 16#004c#;  --  bcm2835.h:877
   BCM2835_GPREN1  : constant := 16#0050#;  --  bcm2835.h:878
   BCM2835_GPFEN0  : constant := 16#0058#;  --  bcm2835.h:879
   BCM2835_GPFEN1  : constant := 16#005c#;  --  bcm2835.h:880
   BCM2835_GPHEN0  : constant := 16#0064#;  --  bcm2835.h:881
   BCM2835_GPHEN1  : constant := 16#0068#;  --  bcm2835.h:882
   BCM2835_GPLEN0  : constant := 16#0070#;  --  bcm2835.h:883
   BCM2835_GPLEN1  : constant := 16#0074#;  --  bcm2835.h:884
   BCM2835_GPAREN0 : constant := 16#007c#;  --  bcm2835.h:885
   BCM2835_GPAREN1 : constant := 16#0080#;  --  bcm2835.h:886
   BCM2835_GPAFEN0 : constant := 16#0088#;  --  bcm2835.h:887
   BCM2835_GPAFEN1 : constant := 16#008c#;  --  bcm2835.h:888
   BCM2835_GPPUD   : constant := 16#0094#;  --  bcm2835.h:889
   BCM2835_GPPUDCLK0 : constant := 16#0098#;  --  bcm2835.h:890
   BCM2835_GPPUDCLK1 : constant := 16#009c#;  --  bcm2835.h:891

   BCM2835_GPPUPPDN0 : constant := 16#00e4#;  --  bcm2835.h:894
   BCM2835_GPPUPPDN1 : constant := 16#00e8#;  --  bcm2835.h:895
   BCM2835_GPPUPPDN2 : constant := 16#00ec#;  --  bcm2835.h:896
   BCM2835_GPPUPPDN3 : constant := 16#00f0#;  --  bcm2835.h:897

   BCM2835_GPIO_PUD_ERROR : constant := 16#08#;  --  bcm2835.h:926

   BCM2835_PADS_GPIO_0_27 : constant := 16#002c#;  --  bcm2835.h:929
   BCM2835_PADS_GPIO_28_45 : constant := 16#0030#;  --  bcm2835.h:930
   BCM2835_PADS_GPIO_46_53 : constant := 16#0034#;  --  bcm2835.h:931
   --  unsupported macro: BCM2835_PAD_PASSWRD (0x5A << 24)

   BCM2835_PAD_SLEW_RATE_UNLIMITED : constant := 16#10#;  --  bcm2835.h:935
   BCM2835_PAD_HYSTERESIS_ENABLED : constant := 16#08#;  --  bcm2835.h:936
   BCM2835_PAD_DRIVE_2mA : constant := 16#00#;  --  bcm2835.h:937
   BCM2835_PAD_DRIVE_4mA : constant := 16#01#;  --  bcm2835.h:938
   BCM2835_PAD_DRIVE_6mA : constant := 16#02#;  --  bcm2835.h:939
   BCM2835_PAD_DRIVE_8mA : constant := 16#03#;  --  bcm2835.h:940
   BCM2835_PAD_DRIVE_10mA : constant := 16#04#;  --  bcm2835.h:941
   BCM2835_PAD_DRIVE_12mA : constant := 16#05#;  --  bcm2835.h:942
   BCM2835_PAD_DRIVE_14mA : constant := 16#06#;  --  bcm2835.h:943
   BCM2835_PAD_DRIVE_16mA : constant := 16#07#;  --  bcm2835.h:944

   BCM2835_AUX_IRQ : constant := 16#0000#;  --  bcm2835.h:1056
   BCM2835_AUX_ENABLE : constant := 16#0004#;  --  bcm2835.h:1057

   BCM2835_AUX_ENABLE_UART1 : constant := 16#01#;  --  bcm2835.h:1059
   BCM2835_AUX_ENABLE_SPI0 : constant := 16#02#;  --  bcm2835.h:1060
   BCM2835_AUX_ENABLE_SPI1 : constant := 16#04#;  --  bcm2835.h:1061

   BCM2835_AUX_SPI_CNTL0 : constant := 16#0000#;  --  bcm2835.h:1064
   BCM2835_AUX_SPI_CNTL1 : constant := 16#0004#;  --  bcm2835.h:1065
   BCM2835_AUX_SPI_STAT : constant := 16#0008#;  --  bcm2835.h:1066
   BCM2835_AUX_SPI_PEEK : constant := 16#000C#;  --  bcm2835.h:1067
   BCM2835_AUX_SPI_IO : constant := 16#0020#;  --  bcm2835.h:1068
   BCM2835_AUX_SPI_TXHOLD : constant := 16#0030#;  --  bcm2835.h:1069

   BCM2835_AUX_SPI_CLOCK_MIN : constant := 30500;  --  bcm2835.h:1071
   BCM2835_AUX_SPI_CLOCK_MAX : constant := 125000000;  --  bcm2835.h:1072

   BCM2835_AUX_SPI_CNTL0_SPEED : constant := 16#FFF00000#;  --  bcm2835.h:1074
   BCM2835_AUX_SPI_CNTL0_SPEED_MAX : constant := 16#FFF#;  --  bcm2835.h:1075

   BCM2835_AUX_SPI_CNTL0_CS0_N : constant := 16#000C0000#;  --  bcm2835.h:1078
   BCM2835_AUX_SPI_CNTL0_CS1_N : constant := 16#000A0000#;  --  bcm2835.h:1079
   BCM2835_AUX_SPI_CNTL0_CS2_N : constant := 16#00060000#;  --  bcm2835.h:1080

   BCM2835_AUX_SPI_CNTL0_POSTINPUT : constant := 16#00010000#;  --  bcm2835.h:1082
   BCM2835_AUX_SPI_CNTL0_VAR_CS : constant := 16#00008000#;  --  bcm2835.h:1083
   BCM2835_AUX_SPI_CNTL0_VAR_WIDTH : constant := 16#00004000#;  --  bcm2835.h:1084
   BCM2835_AUX_SPI_CNTL0_DOUTHOLD : constant := 16#00003000#;  --  bcm2835.h:1085
   BCM2835_AUX_SPI_CNTL0_ENABLE : constant := 16#00000800#;  --  bcm2835.h:1086
   BCM2835_AUX_SPI_CNTL0_CPHA_IN : constant := 16#00000400#;  --  bcm2835.h:1087
   BCM2835_AUX_SPI_CNTL0_CLEARFIFO : constant := 16#00000200#;  --  bcm2835.h:1088
   BCM2835_AUX_SPI_CNTL0_CPHA_OUT : constant := 16#00000100#;  --  bcm2835.h:1089
   BCM2835_AUX_SPI_CNTL0_CPOL : constant := 16#00000080#;  --  bcm2835.h:1090
   BCM2835_AUX_SPI_CNTL0_MSBF_OUT : constant := 16#00000040#;  --  bcm2835.h:1091
   BCM2835_AUX_SPI_CNTL0_SHIFTLEN : constant := 16#0000003F#;  --  bcm2835.h:1092

   BCM2835_AUX_SPI_CNTL1_CSHIGH : constant := 16#00000700#;  --  bcm2835.h:1094
   BCM2835_AUX_SPI_CNTL1_IDLE : constant := 16#00000080#;  --  bcm2835.h:1095
   BCM2835_AUX_SPI_CNTL1_TXEMPTY : constant := 16#00000040#;  --  bcm2835.h:1096
   BCM2835_AUX_SPI_CNTL1_MSBF_IN : constant := 16#00000002#;  --  bcm2835.h:1097
   BCM2835_AUX_SPI_CNTL1_KEEP_IN : constant := 16#00000001#;  --  bcm2835.h:1098

   BCM2835_AUX_SPI_STAT_TX_LVL : constant := 16#F0000000#;  --  bcm2835.h:1100
   BCM2835_AUX_SPI_STAT_RX_LVL : constant := 16#00F00000#;  --  bcm2835.h:1101
   BCM2835_AUX_SPI_STAT_TX_FULL : constant := 16#00000400#;  --  bcm2835.h:1102
   BCM2835_AUX_SPI_STAT_TX_EMPTY : constant := 16#00000200#;  --  bcm2835.h:1103
   BCM2835_AUX_SPI_STAT_RX_FULL : constant := 16#00000100#;  --  bcm2835.h:1104
   BCM2835_AUX_SPI_STAT_RX_EMPTY : constant := 16#00000080#;  --  bcm2835.h:1105
   BCM2835_AUX_SPI_STAT_BUSY : constant := 16#00000040#;  --  bcm2835.h:1106
   BCM2835_AUX_SPI_STAT_BITCOUNT : constant := 16#0000003F#;  --  bcm2835.h:1107

   BCM2835_SPI0_CS : constant := 16#0000#;  --  bcm2835.h:1113
   BCM2835_SPI0_FIFO : constant := 16#0004#;  --  bcm2835.h:1114
   BCM2835_SPI0_CLK : constant := 16#0008#;  --  bcm2835.h:1115
   BCM2835_SPI0_DLEN : constant := 16#000c#;  --  bcm2835.h:1116
   BCM2835_SPI0_LTOH : constant := 16#0010#;  --  bcm2835.h:1117
   BCM2835_SPI0_DC : constant := 16#0014#;  --  bcm2835.h:1118

   BCM2835_SPI0_CS_LEN_LONG : constant := 16#02000000#;  --  bcm2835.h:1121
   BCM2835_SPI0_CS_DMA_LEN : constant := 16#01000000#;  --  bcm2835.h:1122
   BCM2835_SPI0_CS_CSPOL2 : constant := 16#00800000#;  --  bcm2835.h:1123
   BCM2835_SPI0_CS_CSPOL1 : constant := 16#00400000#;  --  bcm2835.h:1124
   BCM2835_SPI0_CS_CSPOL0 : constant := 16#00200000#;  --  bcm2835.h:1125
   BCM2835_SPI0_CS_RXF : constant := 16#00100000#;  --  bcm2835.h:1126
   BCM2835_SPI0_CS_RXR : constant := 16#00080000#;  --  bcm2835.h:1127
   BCM2835_SPI0_CS_TXD : constant := 16#00040000#;  --  bcm2835.h:1128
   BCM2835_SPI0_CS_RXD : constant := 16#00020000#;  --  bcm2835.h:1129
   BCM2835_SPI0_CS_DONE : constant := 16#00010000#;  --  bcm2835.h:1130
   BCM2835_SPI0_CS_TE_EN : constant := 16#00008000#;  --  bcm2835.h:1131
   BCM2835_SPI0_CS_LMONO : constant := 16#00004000#;  --  bcm2835.h:1132
   BCM2835_SPI0_CS_LEN : constant := 16#00002000#;  --  bcm2835.h:1133
   BCM2835_SPI0_CS_REN : constant := 16#00001000#;  --  bcm2835.h:1134
   BCM2835_SPI0_CS_ADCS : constant := 16#00000800#;  --  bcm2835.h:1135
   BCM2835_SPI0_CS_INTR : constant := 16#00000400#;  --  bcm2835.h:1136
   BCM2835_SPI0_CS_INTD : constant := 16#00000200#;  --  bcm2835.h:1137
   BCM2835_SPI0_CS_DMAEN : constant := 16#00000100#;  --  bcm2835.h:1138
   BCM2835_SPI0_CS_TA : constant := 16#00000080#;  --  bcm2835.h:1139
   BCM2835_SPI0_CS_CSPOL : constant := 16#00000040#;  --  bcm2835.h:1140
   BCM2835_SPI0_CS_CLEAR : constant := 16#00000030#;  --  bcm2835.h:1141
   BCM2835_SPI0_CS_CLEAR_RX : constant := 16#00000020#;  --  bcm2835.h:1142
   BCM2835_SPI0_CS_CLEAR_TX : constant := 16#00000010#;  --  bcm2835.h:1143
   BCM2835_SPI0_CS_CPOL : constant := 16#00000008#;  --  bcm2835.h:1144
   BCM2835_SPI0_CS_CPHA : constant := 16#00000004#;  --  bcm2835.h:1145
   BCM2835_SPI0_CS_CS : constant := 16#00000003#;  --  bcm2835.h:1146

   BCM2835_BSC_C   : constant := 16#0000#;  --  bcm2835.h:1218
   BCM2835_BSC_S   : constant := 16#0004#;  --  bcm2835.h:1219
   BCM2835_BSC_DLEN : constant := 16#0008#;  --  bcm2835.h:1220
   BCM2835_BSC_A   : constant := 16#000c#;  --  bcm2835.h:1221
   BCM2835_BSC_FIFO : constant := 16#0010#;  --  bcm2835.h:1222
   BCM2835_BSC_DIV : constant := 16#0014#;  --  bcm2835.h:1223
   BCM2835_BSC_DEL : constant := 16#0018#;  --  bcm2835.h:1224
   BCM2835_BSC_CLKT : constant := 16#001c#;  --  bcm2835.h:1225

   BCM2835_BSC_C_I2CEN : constant := 16#00008000#;  --  bcm2835.h:1228
   BCM2835_BSC_C_INTR : constant := 16#00000400#;  --  bcm2835.h:1229
   BCM2835_BSC_C_INTT : constant := 16#00000200#;  --  bcm2835.h:1230
   BCM2835_BSC_C_INTD : constant := 16#00000100#;  --  bcm2835.h:1231
   BCM2835_BSC_C_ST : constant := 16#00000080#;  --  bcm2835.h:1232
   BCM2835_BSC_C_CLEAR_1 : constant := 16#00000020#;  --  bcm2835.h:1233
   BCM2835_BSC_C_CLEAR_2 : constant := 16#00000010#;  --  bcm2835.h:1234
   BCM2835_BSC_C_READ : constant := 16#00000001#;  --  bcm2835.h:1235

   BCM2835_BSC_S_CLKT : constant := 16#00000200#;  --  bcm2835.h:1238
   BCM2835_BSC_S_ERR : constant := 16#00000100#;  --  bcm2835.h:1239
   BCM2835_BSC_S_RXF : constant := 16#00000080#;  --  bcm2835.h:1240
   BCM2835_BSC_S_TXE : constant := 16#00000040#;  --  bcm2835.h:1241
   BCM2835_BSC_S_RXD : constant := 16#00000020#;  --  bcm2835.h:1242
   BCM2835_BSC_S_TXD : constant := 16#00000010#;  --  bcm2835.h:1243
   BCM2835_BSC_S_RXR : constant := 16#00000008#;  --  bcm2835.h:1244
   BCM2835_BSC_S_TXW : constant := 16#00000004#;  --  bcm2835.h:1245
   BCM2835_BSC_S_DONE : constant := 16#00000002#;  --  bcm2835.h:1246
   BCM2835_BSC_S_TA : constant := 16#00000001#;  --  bcm2835.h:1247

   BCM2835_BSC_FIFO_SIZE : constant := 16;  --  bcm2835.h:1249
   BCM2835_AUX_SPI_FIFO_SIZE : constant := 4;  --  bcm2835.h:1250

   BCM2835_SMI_CS  : constant := 0;  --  bcm2835.h:1278
   BCM2835_SMI_LENGTH : constant := 1;  --  bcm2835.h:1279
   BCM2835_SMI_ADRS : constant := 2;  --  bcm2835.h:1280
   BCM2835_SMI_DATA : constant := 3;  --  bcm2835.h:1281
   BCM2835_SMI_READ0 : constant := 4;  --  bcm2835.h:1282
   BCM2835_SMI_WRITE0 : constant := 5;  --  bcm2835.h:1283
   BCM2835_SMI_READ1 : constant := 6;  --  bcm2835.h:1284
   BCM2835_SMI_WRITE1 : constant := 7;  --  bcm2835.h:1285
   BCM2835_SMI_READ2 : constant := 8;  --  bcm2835.h:1286
   BCM2835_SMI_WRITE2 : constant := 9;  --  bcm2835.h:1287
   BCM2835_SMI_READ3 : constant := 10;  --  bcm2835.h:1288
   BCM2835_SMI_WRITE3 : constant := 11;  --  bcm2835.h:1289
   BCM2835_SMI_DMAC : constant := 12;  --  bcm2835.h:1290
   BCM2835_SMI_DIRCS : constant := 13;  --  bcm2835.h:1291
   BCM2835_SMI_DIRADDR : constant := 14;  --  bcm2835.h:1292
   BCM2835_SMI_DIRDATA : constant := 15;  --  bcm2835.h:1293

   BCM2835_SMI_RW_WIDTH_MSK : constant := 16#C0000000#;  --  bcm2835.h:1296
   BCM2835_SMI_RW_WID8 : constant := 16#00000000#;  --  bcm2835.h:1297
   BCM2835_SMI_RW_WID16 : constant := 16#40000000#;  --  bcm2835.h:1298
   BCM2835_SMI_RW_WID18 : constant := 16#80000000#;  --  bcm2835.h:1299
   BCM2835_SMI_RW_WID9 : constant := 16#C0000000#;  --  bcm2835.h:1300
   BCM2835_SMI_RW_SETUP_MSK : constant := 16#3F000000#;  --  bcm2835.h:1301
   BCM2835_SMI_RW_SETUP_LS : constant := 24;  --  bcm2835.h:1302
   BCM2835_SMI_RW_MODE68 : constant := 16#00800000#;  --  bcm2835.h:1303
   BCM2835_SMI_RW_MODE80 : constant := 16#00000000#;  --  bcm2835.h:1304
   BCM2835_SMI_READ_FSETUP : constant := 16#00400000#;  --  bcm2835.h:1305
   BCM2835_SMI_WRITE_SWAP : constant := 16#00400000#;  --  bcm2835.h:1306
   BCM2835_SMI_RW_HOLD_MSK : constant := 16#003F0000#;  --  bcm2835.h:1307
   BCM2835_SMI_RW_HOLD_LS : constant := 16;  --  bcm2835.h:1308
   BCM2835_SMI_RW_PACEALL : constant := 16#00008000#;  --  bcm2835.h:1309
   BCM2835_SMI_RW_PACE_MSK : constant := 16#00007F00#;  --  bcm2835.h:1310
   BCM2835_SMI_RW_PACE_LS : constant := 8;  --  bcm2835.h:1311
   BCM2835_SMI_RW_DREQ : constant := 16#00000080#;  --  bcm2835.h:1312
   BCM2835_SMI_RW_STROBE_MSK : constant := 16#0000007F#;  --  bcm2835.h:1313
   BCM2835_SMI_RW_STROBE_LS : constant := 0;  --  bcm2835.h:1314

   BCM2835_SMI_DIRCS_ENABLE : constant := 16#00000001#;  --  bcm2835.h:1317
   BCM2835_SMI_DIRCS_START : constant := 16#00000002#;  --  bcm2835.h:1318
   BCM2835_SMI_DIRCS_DONE : constant := 16#00000004#;  --  bcm2835.h:1319
   BCM2835_SMI_DIRCS_WRITE : constant := 16#00000008#;  --  bcm2835.h:1320

   BCM2835_SMI_DIRADRS_DEV_MSK : constant := 16#00000300#;  --  bcm2835.h:1323
   BCM2835_SMI_DIRADRS_DEV_LS : constant := 8;  --  bcm2835.h:1324
   BCM2835_SMI_DIRADRS_DEV0 : constant := 16#00000000#;  --  bcm2835.h:1325
   BCM2835_SMI_DIRADRS_DEV1 : constant := 16#00000100#;  --  bcm2835.h:1326
   BCM2835_SMI_DIRADRS_DEV2 : constant := 16#00000200#;  --  bcm2835.h:1327
   BCM2835_SMI_DIRADRS_DEV3 : constant := 16#00000300#;  --  bcm2835.h:1328
   BCM2835_SMI_DIRADRS_MSK : constant := 16#0000003F#;  --  bcm2835.h:1329
   BCM2835_SMI_DIRADRS_LS : constant := 0;  --  bcm2835.h:1330

   SMICLK_CNTL     : constant := (44);  --  bcm2835.h:1333
   SMICLK_DIV      : constant := (45);  --  bcm2835.h:1334

   BCM2835_ST_CS   : constant := 16#0000#;  --  bcm2835.h:1348
   BCM2835_ST_CLO  : constant := 16#0004#;  --  bcm2835.h:1349
   BCM2835_ST_CHI  : constant := 16#0008#;  --  bcm2835.h:1350

   BCM2835_PWM_CONTROL : constant := 0;  --  bcm2835.h:1356
   BCM2835_PWM_STATUS : constant := 1;  --  bcm2835.h:1357
   BCM2835_PWM_DMAC : constant := 2;  --  bcm2835.h:1358
   BCM2835_PWM0_RANGE : constant := 4;  --  bcm2835.h:1359
   BCM2835_PWM0_DATA : constant := 5;  --  bcm2835.h:1360
   BCM2835_PWM_FIF1 : constant := 6;  --  bcm2835.h:1361
   BCM2835_PWM1_RANGE : constant := 8;  --  bcm2835.h:1362
   BCM2835_PWM1_DATA : constant := 9;  --  bcm2835.h:1363

   BCM2835_PWMCLK_CNTL : constant := 40;  --  bcm2835.h:1366
   BCM2835_PWMCLK_DIV : constant := 41;  --  bcm2835.h:1367
   --  unsupported macro: BCM2835_PWM_PASSWRD (0x5A << 24)

   BCM2835_PWM1_MS_MODE : constant := 16#8000#;  --  bcm2835.h:1370
   BCM2835_PWM1_USEFIFO : constant := 16#2000#;  --  bcm2835.h:1371
   BCM2835_PWM1_REVPOLAR : constant := 16#1000#;  --  bcm2835.h:1372
   BCM2835_PWM1_OFFSTATE : constant := 16#0800#;  --  bcm2835.h:1373
   BCM2835_PWM1_REPEATFF : constant := 16#0400#;  --  bcm2835.h:1374
   BCM2835_PWM1_SERIAL : constant := 16#0200#;  --  bcm2835.h:1375
   BCM2835_PWM1_ENABLE : constant := 16#0100#;  --  bcm2835.h:1376

   BCM2835_PWM0_MS_MODE : constant := 16#0080#;  --  bcm2835.h:1378
   BCM2835_PWM_CLEAR_FIFO : constant := 16#0040#;  --  bcm2835.h:1379
   BCM2835_PWM0_USEFIFO : constant := 16#0020#;  --  bcm2835.h:1380
   BCM2835_PWM0_REVPOLAR : constant := 16#0010#;  --  bcm2835.h:1381
   BCM2835_PWM0_OFFSTATE : constant := 16#0008#;  --  bcm2835.h:1382
   BCM2835_PWM0_REPEATFF : constant := 16#0004#;  --  bcm2835.h:1383
   BCM2835_PWM0_SERIAL : constant := 16#0002#;  --  bcm2835.h:1384
   BCM2835_PWM0_ENABLE : constant := 16#0001#;  --  bcm2835.h:1385
   --  arg-macro: procedure delay (x)
   --    bcm2835_delay(x)
   --  arg-macro: procedure delayMicroseconds (x)
   --    bcm2835_delayMicroseconds(x)

   BCM2835_AUX_SPI_CNTL0_SPEED_SHIFT : constant := 20;  --  bcm2835.h:1076

   --  bcm2835_peripherals_base : aliased arm_linux_gnueabihf_sys_types_h.off_t  -- bcm2835.h:767
   --    with Export => True,
   --    Convention => C,
   --    External_Name => "bcm2835_peripherals_base";

   bcm2835_peripherals_size : size_t  -- bcm2835.h:769
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_peripherals_size";

   bcm2835_peripherals : access Unsigned  -- bcm2835.h:772
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_peripherals";

   bcm2835_st : access Unsigned  -- bcm2835.h:777
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_st";

   bcm2835_gpio : access Unsigned  -- bcm2835.h:782
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio";

   bcm2835_pwm : access Unsigned  -- bcm2835.h:787
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_pwm";

   bcm2835_clk : access Unsigned  -- bcm2835.h:792
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_clk";

   bcm2835_pads : access Unsigned  -- bcm2835.h:797
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_pads";

   bcm2835_spi0 : access Unsigned  -- bcm2835.h:802
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi0";

   bcm2835_bsc0 : access Unsigned  -- bcm2835.h:807
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_bsc0";

   bcm2835_bsc1 : access Unsigned  -- bcm2835.h:812
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_bsc1";

   bcm2835_aux : access Unsigned  -- bcm2835.h:817
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux";

   bcm2835_spi1 : access Unsigned  -- bcm2835.h:822
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi1";

   bcm2835_smi : access Unsigned  -- bcm2835.h:828
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_smi";

   subtype bcm2835RegisterBase is unsigned;
   bcm2835RegisterBase_BCM2835_REGBASE_ST   : constant  := 1;
   bcm2835RegisterBase_BCM2835_REGBASE_GPIO : constant  := 2;
   bcm2835RegisterBase_BCM2835_REGBASE_PWM  : constant  := 3;
   bcm2835RegisterBase_BCM2835_REGBASE_CLK  : constant  := 4;
   bcm2835RegisterBase_BCM2835_REGBASE_PADS : constant  := 5;
   bcm2835RegisterBase_BCM2835_REGBASE_SPI0 : constant  := 6;
   bcm2835RegisterBase_BCM2835_REGBASE_BSC0 : constant  := 7;
   bcm2835RegisterBase_BCM2835_REGBASE_BSC1 : constant  := 8;
   bcm2835RegisterBase_BCM2835_REGBASE_AUX  : constant  := 9;
   bcm2835RegisterBase_BCM2835_REGBASE_SPI1 : constant  := 10;
   bcm2835RegisterBase_BCM2835_REGBASE_SMI  : constant  := 11;  -- bcm2835.h:848

   subtype bcm2835FunctionSelect is unsigned;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_INPT : constant bcm2835FunctionSelect := 0;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_OUTP : constant bcm2835FunctionSelect := 1;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_ALT0 : constant bcm2835FunctionSelect := 4;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_ALT1 : constant bcm2835FunctionSelect := 5;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_ALT2 : constant bcm2835FunctionSelect := 6;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_ALT3 : constant bcm2835FunctionSelect := 7;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_ALT4 : constant bcm2835FunctionSelect := 3;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_ALT5 : constant bcm2835FunctionSelect := 2;
   bcm2835FunctionSelect_BCM2835_GPIO_FSEL_MASK : constant bcm2835FunctionSelect := 7;  -- bcm2835.h:913

   type bcm2835PUDControl is
     (BCM2835_GPIO_PUD_OFF,
      BCM2835_GPIO_PUD_DOWN,
      BCM2835_GPIO_PUD_UP)
     with Convention => C;  -- bcm2835.h:923

   type bcm2835PadGroup is
     (BCM2835_PAD_GROUP_GPIO_0_27,
      BCM2835_PAD_GROUP_GPIO_28_45,
      BCM2835_PAD_GROUP_GPIO_46_53)
     with Convention => C;  -- bcm2835.h:954

   subtype RPiGPIOPin is unsigned;
   RPiGPIOPin_RPI_GPIO_P1_03                : constant RPiGPIOPin := 0;
   RPiGPIOPin_RPI_GPIO_P1_05                : constant RPiGPIOPin := 1;
   RPiGPIOPin_RPI_GPIO_P1_07                : constant RPiGPIOPin := 4;
   RPiGPIOPin_RPI_GPIO_P1_08                : constant RPiGPIOPin := 14;
   RPiGPIOPin_RPI_GPIO_P1_10                : constant RPiGPIOPin := 15;
   RPiGPIOPin_RPI_GPIO_P1_11                : constant RPiGPIOPin := 17;
   RPiGPIOPin_RPI_GPIO_P1_12                : constant RPiGPIOPin := 18;
   RPiGPIOPin_RPI_GPIO_P1_13                : constant RPiGPIOPin := 21;
   RPiGPIOPin_RPI_GPIO_P1_15                : constant RPiGPIOPin := 22;
   RPiGPIOPin_RPI_GPIO_P1_16                : constant RPiGPIOPin := 23;
   RPiGPIOPin_RPI_GPIO_P1_18                : constant RPiGPIOPin := 24;
   RPiGPIOPin_RPI_GPIO_P1_19                : constant RPiGPIOPin := 10;
   RPiGPIOPin_RPI_GPIO_P1_21                : constant RPiGPIOPin := 9;
   RPiGPIOPin_RPI_GPIO_P1_22                : constant RPiGPIOPin := 25;
   RPiGPIOPin_RPI_GPIO_P1_23                : constant RPiGPIOPin := 11;
   RPiGPIOPin_RPI_GPIO_P1_24                : constant RPiGPIOPin := 8;
   RPiGPIOPin_RPI_GPIO_P1_26                : constant RPiGPIOPin := 7;
   RPiGPIOPin_RPI_V2_GPIO_P1_03             : constant RPiGPIOPin := 2;
   RPiGPIOPin_RPI_V2_GPIO_P1_05             : constant RPiGPIOPin := 3;
   RPiGPIOPin_RPI_V2_GPIO_P1_07             : constant RPiGPIOPin := 4;
   RPiGPIOPin_RPI_V2_GPIO_P1_08             : constant RPiGPIOPin := 14;
   RPiGPIOPin_RPI_V2_GPIO_P1_10             : constant RPiGPIOPin := 15;
   RPiGPIOPin_RPI_V2_GPIO_P1_11             : constant RPiGPIOPin := 17;
   RPiGPIOPin_RPI_V2_GPIO_P1_12             : constant RPiGPIOPin := 18;
   RPiGPIOPin_RPI_V2_GPIO_P1_13             : constant RPiGPIOPin := 27;
   RPiGPIOPin_RPI_V2_GPIO_P1_15             : constant RPiGPIOPin := 22;
   RPiGPIOPin_RPI_V2_GPIO_P1_16             : constant RPiGPIOPin := 23;
   RPiGPIOPin_RPI_V2_GPIO_P1_18             : constant RPiGPIOPin := 24;
   RPiGPIOPin_RPI_V2_GPIO_P1_19             : constant RPiGPIOPin := 10;
   RPiGPIOPin_RPI_V2_GPIO_P1_21             : constant RPiGPIOPin := 9;
   RPiGPIOPin_RPI_V2_GPIO_P1_22             : constant RPiGPIOPin := 25;
   RPiGPIOPin_RPI_V2_GPIO_P1_23             : constant RPiGPIOPin := 11;
   RPiGPIOPin_RPI_V2_GPIO_P1_24             : constant RPiGPIOPin := 8;
   RPiGPIOPin_RPI_V2_GPIO_P1_26             : constant RPiGPIOPin := 7;
   RPiGPIOPin_RPI_V2_GPIO_P1_29             : constant RPiGPIOPin := 5;
   RPiGPIOPin_RPI_V2_GPIO_P1_31             : constant RPiGPIOPin := 6;
   RPiGPIOPin_RPI_V2_GPIO_P1_32             : constant RPiGPIOPin := 12;
   RPiGPIOPin_RPI_V2_GPIO_P1_33             : constant RPiGPIOPin := 13;
   RPiGPIOPin_RPI_V2_GPIO_P1_35             : constant RPiGPIOPin := 19;
   RPiGPIOPin_RPI_V2_GPIO_P1_36             : constant RPiGPIOPin := 16;
   RPiGPIOPin_RPI_V2_GPIO_P1_37             : constant RPiGPIOPin := 26;
   RPiGPIOPin_RPI_V2_GPIO_P1_38             : constant RPiGPIOPin := 20;
   RPiGPIOPin_RPI_V2_GPIO_P1_40             : constant RPiGPIOPin := 21;
   RPiGPIOPin_RPI_V2_GPIO_P5_03             : constant RPiGPIOPin := 28;
   RPiGPIOPin_RPI_V2_GPIO_P5_04             : constant RPiGPIOPin := 29;
   RPiGPIOPin_RPI_V2_GPIO_P5_05             : constant RPiGPIOPin := 30;
   RPiGPIOPin_RPI_V2_GPIO_P5_06             : constant RPiGPIOPin := 31;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_03          : constant RPiGPIOPin := 2;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_05          : constant RPiGPIOPin := 3;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_07          : constant RPiGPIOPin := 4;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_08          : constant RPiGPIOPin := 14;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_10          : constant RPiGPIOPin := 15;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_11          : constant RPiGPIOPin := 17;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_12          : constant RPiGPIOPin := 18;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_13          : constant RPiGPIOPin := 27;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_15          : constant RPiGPIOPin := 22;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_16          : constant RPiGPIOPin := 23;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_18          : constant RPiGPIOPin := 24;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_19          : constant RPiGPIOPin := 10;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_21          : constant RPiGPIOPin := 9;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_22          : constant RPiGPIOPin := 25;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_23          : constant RPiGPIOPin := 11;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_24          : constant RPiGPIOPin := 8;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_26          : constant RPiGPIOPin := 7;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_29          : constant RPiGPIOPin := 5;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_31          : constant RPiGPIOPin := 6;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_32          : constant RPiGPIOPin := 12;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_33          : constant RPiGPIOPin := 13;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_35          : constant RPiGPIOPin := 19;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_36          : constant RPiGPIOPin := 16;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_37          : constant RPiGPIOPin := 26;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_38          : constant RPiGPIOPin := 20;
   RPiGPIOPin_RPI_BPLUS_GPIO_J8_40          : constant RPiGPIOPin := 21;  -- bcm2835.h:1051

   type bcm2835SPIBitOrder is
     (BCM2835_SPI_BIT_ORDER_LSBFIRST,
      BCM2835_SPI_BIT_ORDER_MSBFIRST)
     with Convention => C;  -- bcm2835.h:1155

   type bcm2835SPIMode is
     (BCM2835_SPI_MODE0,
      BCM2835_SPI_MODE1,
      BCM2835_SPI_MODE2,
      BCM2835_SPI_MODE3)
     with Convention => C;  -- bcm2835.h:1166

   type bcm2835SPIChipSelect is
     (BCM2835_SPI_CS0,
      BCM2835_SPI_CS1,
      BCM2835_SPI_CS2,
      BCM2835_SPI_CS_NONE)
     with Convention => C;  -- bcm2835.h:1177

   subtype bcm2835SPIClockDivider is unsigned;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_65536 : constant bcm2835SPIClockDivider := 0;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_32768 : constant bcm2835SPIClockDivider := 32768;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_16384 : constant bcm2835SPIClockDivider := 16384;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_8192 : constant bcm2835SPIClockDivider := 8192;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_4096 : constant bcm2835SPIClockDivider := 4096;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_2048 : constant bcm2835SPIClockDivider := 2048;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_1024 : constant bcm2835SPIClockDivider := 1024;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_512 : constant bcm2835SPIClockDivider := 512;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_256 : constant bcm2835SPIClockDivider := 256;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_128 : constant bcm2835SPIClockDivider := 128;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_64 : constant bcm2835SPIClockDivider := 64;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_32 : constant bcm2835SPIClockDivider := 32;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_16 : constant bcm2835SPIClockDivider := 16;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_8 : constant bcm2835SPIClockDivider := 8;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_4 : constant bcm2835SPIClockDivider := 4;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_2 : constant bcm2835SPIClockDivider := 2;
   bcm2835SPIClockDivider_BCM2835_SPI_CLOCK_DIVIDER_1 : constant bcm2835SPIClockDivider := 1;  -- bcm2835.h:1212

   subtype bcm2835I2CClockDivider is unsigned;
   bcm2835I2CClockDivider_BCM2835_I2C_CLOCK_DIVIDER_2500 : constant bcm2835I2CClockDivider := 2500;
   bcm2835I2CClockDivider_BCM2835_I2C_CLOCK_DIVIDER_626 : constant bcm2835I2CClockDivider := 626;
   bcm2835I2CClockDivider_BCM2835_I2C_CLOCK_DIVIDER_150 : constant bcm2835I2CClockDivider := 150;
   bcm2835I2CClockDivider_BCM2835_I2C_CLOCK_DIVIDER_148 : constant bcm2835I2CClockDivider := 148;  -- bcm2835.h:1262

   subtype bcm2835I2CReasonCodes is unsigned;
   bcm2835I2CReasonCodes_BCM2835_I2C_REASON_OK : constant bcm2835I2CReasonCodes := 0;
   bcm2835I2CReasonCodes_BCM2835_I2C_REASON_ERROR_NACK : constant bcm2835I2CReasonCodes := 1;
   bcm2835I2CReasonCodes_BCM2835_I2C_REASON_ERROR_CLKT : constant bcm2835I2CReasonCodes := 2;
   bcm2835I2CReasonCodes_BCM2835_I2C_REASON_ERROR_DATA : constant bcm2835I2CReasonCodes := 4;
   bcm2835I2CReasonCodes_BCM2835_I2C_REASON_ERROR_TIMEOUT : constant bcm2835I2CReasonCodes := 8;  -- bcm2835.h:1275

   subtype bcm2835PWMClockDivider is unsigned;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_2048 : constant bcm2835PWMClockDivider := 2048;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_1024 : constant bcm2835PWMClockDivider := 1024;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_512 : constant bcm2835PWMClockDivider := 512;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_256 : constant bcm2835PWMClockDivider := 256;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_128 : constant bcm2835PWMClockDivider := 128;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_64 : constant bcm2835PWMClockDivider := 64;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_32 : constant bcm2835PWMClockDivider := 32;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_16 : constant bcm2835PWMClockDivider := 16;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_8 : constant bcm2835PWMClockDivider := 8;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_4 : constant bcm2835PWMClockDivider := 4;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_2 : constant bcm2835PWMClockDivider := 2;
   bcm2835PWMClockDivider_BCM2835_PWM_CLOCK_DIVIDER_1 : constant bcm2835PWMClockDivider := 1;  -- bcm2835.h:1407

   function bcm2835_init return int  -- bcm2835.h:1437
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_init";

   function bcm2835_close return int  -- bcm2835.h:1442
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_close";

   procedure bcm2835_set_debug (debug : unsigned_Char)  -- bcm2835.h:1451
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_set_debug";

   function bcm2835_lib_version return unsigned  -- bcm2835.h:1456
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_version";

   function bcm2835_regbase (regbase : unsigned_Char) return access Unsigned  -- bcm2835.h:1473
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_regbase";

   function bcm2835_peri_read (paddr : access Unsigned) return Unsigned  -- bcm2835.h:1483
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_peri_read";

   function bcm2835_peri_read_nb (paddr : access Unsigned) return Unsigned  -- bcm2835.h:1495
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_peri_read_nb";

   procedure bcm2835_peri_write (paddr : access Unsigned; value : Unsigned)  -- bcm2835.h:1509
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_peri_write";

   procedure bcm2835_peri_write_nb (paddr : access Unsigned; value : Unsigned)  -- bcm2835.h:1523
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_peri_write_nb";

   procedure bcm2835_peri_set_bits
     (paddr : access Unsigned;
      value : Unsigned;
      mask  : Unsigned)  -- bcm2835.h:1537
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_peri_set_bits";

   procedure bcm2835_gpio_fsel (pin : unsigned_Char; mode : unsigned_Char)  -- bcm2835.h:1551
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_fsel";

   procedure bcm2835_gpio_set (pin : unsigned_Char)  -- bcm2835.h:1558
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_set";

   procedure bcm2835_gpio_clr (pin : unsigned_Char)  -- bcm2835.h:1565
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr";

   procedure bcm2835_gpio_set_multi (mask : Unsigned)  -- bcm2835.h:1572
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_set_multi";

   procedure bcm2835_gpio_clr_multi (mask : Unsigned)  -- bcm2835.h:1579
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr_multi";

   function bcm2835_gpio_lev (pin : unsigned_Char) return unsigned_Char  -- bcm2835.h:1587
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_lev";

   function bcm2835_gpio_eds (pin : unsigned_Char) return unsigned_Char  -- bcm2835.h:1597
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_eds";

   function bcm2835_gpio_eds_multi (mask : Unsigned) return Unsigned  -- bcm2835.h:1604
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_eds_multi";

   procedure bcm2835_gpio_set_eds (pin : unsigned_Char)  -- bcm2835.h:1611
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_set_eds";

   procedure bcm2835_gpio_set_eds_multi (mask : Unsigned)  -- bcm2835.h:1617
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_set_eds_multi";

   procedure bcm2835_gpio_ren (pin : unsigned_Char)  -- bcm2835.h:1627
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_ren";

   procedure bcm2835_gpio_clr_ren (pin : unsigned_Char)  -- bcm2835.h:1632
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr_ren";

   procedure bcm2835_gpio_fen (pin : unsigned_Char)  -- bcm2835.h:1642
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_fen";

   procedure bcm2835_gpio_clr_fen (pin : unsigned_Char)  -- bcm2835.h:1647
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr_fen";

   procedure bcm2835_gpio_hen (pin : unsigned_Char)  -- bcm2835.h:1653
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_hen";

   procedure bcm2835_gpio_clr_hen (pin : unsigned_Char)  -- bcm2835.h:1658
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr_hen";

   procedure bcm2835_gpio_len (pin : unsigned_Char)  -- bcm2835.h:1664
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_len";

   procedure bcm2835_gpio_clr_len (pin : unsigned_Char)  -- bcm2835.h:1669
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr_len";

   procedure bcm2835_gpio_aren (pin : unsigned_Char)  -- bcm2835.h:1677
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_aren";

   procedure bcm2835_gpio_clr_aren (pin : unsigned_Char)  -- bcm2835.h:1682
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr_aren";

   procedure bcm2835_gpio_afen (pin : unsigned_Char)  -- bcm2835.h:1690
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_afen";

   procedure bcm2835_gpio_clr_afen (pin : unsigned_Char)  -- bcm2835.h:1695
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_clr_afen";

   procedure bcm2835_gpio_pud (pud : unsigned_Char)  -- bcm2835.h:1705
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_pud";

   procedure bcm2835_gpio_pudclk (pin : unsigned_Char; on : unsigned_Char)  -- bcm2835.h:1717
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_pudclk";

   function bcm2835_gpio_pad (group : unsigned_Char) return Unsigned  -- bcm2835.h:1724
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_pad";

   procedure bcm2835_gpio_set_pad (group : unsigned_Char; control : Unsigned)  -- bcm2835.h:1733
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_set_pad";

   procedure bcm2835_delay (millis : unsigned)  -- bcm2835.h:1745
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_delay";

   procedure bcm2835_delayMicroseconds (micros : Interfaces.Unsigned_64)  -- bcm2835.h:1760
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_delayMicroseconds";

   procedure bcm2835_gpio_write (pin : unsigned_Char; on : unsigned_Char)  -- bcm2835.h:1766
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_write";

   procedure bcm2835_gpio_write_multi (mask : Unsigned; on : unsigned_Char)  -- bcm2835.h:1772
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_write_multi";

   procedure bcm2835_gpio_write_mask (value : Unsigned; mask : Unsigned)  -- bcm2835.h:1778
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_write_mask";

   procedure bcm2835_gpio_set_pud (pin : unsigned_Char; pud : unsigned_Char)  -- bcm2835.h:1785
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_set_pud";

   function bcm2835_gpio_get_pud (pin : unsigned_Char) return unsigned_Char  -- bcm2835.h:1793
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_gpio_get_pud";

   function bcm2835_spi_begin return int  -- bcm2835.h:1811
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_begin";

   procedure bcm2835_spi_end  -- bcm2835.h:1817
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_end";

   procedure bcm2835_spi_setBitOrder (order : unsigned_Char)  -- bcm2835.h:1826
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_setBitOrder";

   procedure bcm2835_spi_setClockDivider (divider : Unsigned_Short)  -- bcm2835.h:1833
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_setClockDivider";

   procedure bcm2835_spi_set_speed_hz (speed_hz : Unsigned)  -- bcm2835.h:1839
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_set_speed_hz";

   procedure bcm2835_spi_setDataMode (mode : unsigned_Char)  -- bcm2835.h:1846
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_setDataMode";

   procedure bcm2835_spi_chipSelect (cs : unsigned_Char)  -- bcm2835.h:1854
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_chipSelect";

   procedure bcm2835_spi_setChipSelectPolarity (cs : unsigned_Char; active : unsigned_Char)  -- bcm2835.h:1864
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_setChipSelectPolarity";

   function bcm2835_spi_transfer (value : unsigned_Char) return unsigned_Char  -- bcm2835.h:1876
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_transfer";

   procedure bcm2835_spi_transfernb
     (tbuf : Interfaces.C.Strings.chars_ptr;
      rbuf : Interfaces.C.Strings.chars_ptr;
      len  : Unsigned)  -- bcm2835.h:1889
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_transfernb";

   procedure bcm2835_spi_transfern (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1898
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_transfern";

   procedure bcm2835_spi_writenb (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1906
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_writenb";

   procedure bcm2835_spi_write (data : Unsigned_Short)  -- bcm2835.h:1916
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_spi_write";

   function bcm2835_aux_spi_begin return int  -- bcm2835.h:1923
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_begin";

   procedure bcm2835_aux_spi_end  -- bcm2835.h:1929
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_end";

   procedure bcm2835_aux_spi_setClockDivider (divider : Unsigned_Short)  -- bcm2835.h:1934
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_setClockDivider";

   function bcm2835_aux_spi_CalcClockDivider (speed_hz : Unsigned) return Unsigned_Short  -- bcm2835.h:1941
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_CalcClockDivider";

   procedure bcm2835_aux_spi_write (data : Unsigned_Short)  -- bcm2835.h:1949
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_write";

   procedure bcm2835_aux_spi_writenb (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1956
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_writenb";

   procedure bcm2835_aux_spi_transfern (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1965
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_transfern";

   procedure bcm2835_aux_spi_transfernb
     (tbuf : Interfaces.C.Strings.chars_ptr;
      rbuf : Interfaces.C.Strings.chars_ptr;
      len  : Unsigned)  -- bcm2835.h:1975
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_transfernb";

   function bcm2835_aux_spi_transfer (value : unsigned_Char) return unsigned_Char  -- bcm2835.h:1984
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_aux_spi_transfer";

   function bcm2835_i2c_begin return int  -- bcm2835.h:2002
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_begin";

   procedure bcm2835_i2c_end  -- bcm2835.h:2008
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_end";

   procedure bcm2835_i2c_setSlaveAddress (addr : unsigned_Char)  -- bcm2835.h:2013
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_setSlaveAddress";

   procedure bcm2835_i2c_setClockDivider (divider : Unsigned_Short)  -- bcm2835.h:2019
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_setClockDivider";

   procedure bcm2835_i2c_set_baudrate (baudrate : Unsigned)  -- bcm2835.h:2027
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_set_baudrate";

   function bcm2835_i2c_write (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned) return unsigned_Char  -- bcm2835.h:2035
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_write";

   function bcm2835_i2c_read (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned) return unsigned_Char  -- bcm2835.h:2043
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_read";

   function bcm2835_i2c_read_register_rs
     (regaddr : Interfaces.C.Strings.chars_ptr;
      buf     : Interfaces.C.Strings.chars_ptr;
      len     : Unsigned) return unsigned_Char  -- bcm2835.h:2059
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_read_register_rs";

   function bcm2835_i2c_write_read_rs
     (cmds     : Interfaces.C.Strings.chars_ptr;
      cmds_len : Unsigned;
      buf      : Interfaces.C.Strings.chars_ptr;
      buf_len  : Unsigned) return unsigned_Char  -- bcm2835.h:2071
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_i2c_write_read_rs";

   function bcm2835_smi_begin return int  -- bcm2835.h:2089
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_smi_begin";

   procedure bcm2835_smi_end  -- bcm2835.h:2095
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_smi_end";

   procedure bcm2835_smi_set_timing
     (smichannel   : Unsigned;
      readchannel  : Unsigned;
      setupcycles  : Unsigned;
      strobecycles : Unsigned;
      holdcycles   : Unsigned;
      pacecycles   : Unsigned)  -- bcm2835.h:2110
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_smi_set_timing";

   procedure bcm2835_smi_write
     (smichannel : Unsigned;
      data       : unsigned_Char;
      address    : Unsigned)  -- bcm2835.h:2121
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_smi_write";

   function bcm2835_smi_read (smichannel : Unsigned; address : Unsigned) return Unsigned  -- bcm2835.h:2130
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_smi_read";

   function bcm2835_st_read return Interfaces.Unsigned_64  -- bcm2835.h:2143
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_st_read";

   procedure bcm2835_st_delay (offset_micros : Interfaces.Unsigned_64; micros : Interfaces.Unsigned_64)  -- bcm2835.h:2149
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_st_delay";

   procedure bcm2835_pwm_set_clock (divisor : Unsigned)  -- bcm2835.h:2166
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_pwm_set_clock";

   procedure bcm2835_pwm_set_mode
     (channel   : unsigned_Char;
      markspace : unsigned_Char;
      enabled   : unsigned_Char)  -- bcm2835.h:2174
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_pwm_set_mode";

   procedure bcm2835_pwm_set_range (channel : unsigned_Char; c_range : Unsigned)  -- bcm2835.h:2181
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_pwm_set_range";

   procedure bcm2835_pwm_set_data (channel : unsigned_Char; data : Unsigned)  -- bcm2835.h:2189
     with Export => True,
     Convention => C,
     External_Name => "bcm2835_pwm_set_data";

end bcm2835_h_Impl;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
