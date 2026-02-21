pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package Bcm2835 is

   VERSION : constant := 10077;  --  bcm2835.h:679

   HIGH            : constant := 16#1#;  --  bcm2835.h:701

   LOW             : constant := 16#0#;  --  bcm2835.h:703
   --  arg-macro: function MIN (a, b)
   --    return a < b ? a : b;

   CORE_CLK_HZ : constant := 250000000;  --  bcm2835.h:711

   BMC2835_RPI2_DT_FILENAME : aliased constant String := "/proc/device-tree/soc/ranges" & ASCII.NUL;  --  bcm2835.h:714

   PERI_BASE : constant := 16#20000000#;  --  bcm2835.h:723

   PERI_SIZE : constant := 16#01000000#;  --  bcm2835.h:725

   RPI2_PERI_BASE : constant := 16#3F000000#;  --  bcm2835.h:727

   RPI4_PERI_BASE : constant := 16#FE000000#;  --  bcm2835.h:729

   RPI4_PERI_SIZE : constant := 16#01800000#;  --  bcm2835.h:731

   ST_BASE : constant := 16#3000#;  --  bcm2835.h:736

   GPIO_PADS : constant := 16#100000#;  --  bcm2835.h:738

   CLOCK_BASE : constant := 16#101000#;  --  bcm2835.h:740

   GPIO_BASE : constant := 16#200000#;  --  bcm2835.h:742

   SPI0_BASE : constant := 16#204000#;  --  bcm2835.h:744

   BSC0_BASE : constant := 16#205000#;  --  bcm2835.h:746

   GPIO_PWM : constant := 16#20C000#;  --  bcm2835.h:748

   AUX_BASE : constant := 16#215000#;  --  bcm2835.h:750

   SPI1_BASE : constant := 16#215080#;  --  bcm2835.h:752

   SPI2_BASE : constant := 16#2150C0#;  --  bcm2835.h:754

   BSC1_BASE : constant := 16#804000#;  --  bcm2835.h:756

   SMI_BASE : constant := 16#600000#;  --  bcm2835.h:760

   PAGE_SIZE : constant := (4 * 1024);  --  bcm2835.h:851

   BLOCK_SIZE : constant := (4 * 1024);  --  bcm2835.h:853

   GPFSEL0 : constant := 16#0000#;  --  bcm2835.h:863
   GPFSEL1 : constant := 16#0004#;  --  bcm2835.h:864
   GPFSEL2 : constant := 16#0008#;  --  bcm2835.h:865
   GPFSEL3 : constant := 16#000c#;  --  bcm2835.h:866
   GPFSEL4 : constant := 16#0010#;  --  bcm2835.h:867
   GPFSEL5 : constant := 16#0014#;  --  bcm2835.h:868
   GPSET0  : constant := 16#001c#;  --  bcm2835.h:869
   GPSET1  : constant := 16#0020#;  --  bcm2835.h:870
   GPCLR0  : constant := 16#0028#;  --  bcm2835.h:871
   GPCLR1  : constant := 16#002c#;  --  bcm2835.h:872
   GPLEV0  : constant := 16#0034#;  --  bcm2835.h:873
   GPLEV1  : constant := 16#0038#;  --  bcm2835.h:874
   GPEDS0  : constant := 16#0040#;  --  bcm2835.h:875
   GPEDS1  : constant := 16#0044#;  --  bcm2835.h:876
   GPREN0  : constant := 16#004c#;  --  bcm2835.h:877
   GPREN1  : constant := 16#0050#;  --  bcm2835.h:878
   GPFEN0  : constant := 16#0058#;  --  bcm2835.h:879
   GPFEN1  : constant := 16#005c#;  --  bcm2835.h:880
   GPHEN0  : constant := 16#0064#;  --  bcm2835.h:881
   GPHEN1  : constant := 16#0068#;  --  bcm2835.h:882
   GPLEN0  : constant := 16#0070#;  --  bcm2835.h:883
   GPLEN1  : constant := 16#0074#;  --  bcm2835.h:884
   GPAREN0 : constant := 16#007c#;  --  bcm2835.h:885
   GPAREN1 : constant := 16#0080#;  --  bcm2835.h:886
   GPAFEN0 : constant := 16#0088#;  --  bcm2835.h:887
   GPAFEN1 : constant := 16#008c#;  --  bcm2835.h:888
   GPPUD   : constant := 16#0094#;  --  bcm2835.h:889
   GPPUDCLK0 : constant := 16#0098#;  --  bcm2835.h:890
   GPPUDCLK1 : constant := 16#009c#;  --  bcm2835.h:891

   GPPUPPDN0 : constant := 16#00e4#;  --  bcm2835.h:894
   GPPUPPDN1 : constant := 16#00e8#;  --  bcm2835.h:895
   GPPUPPDN2 : constant := 16#00ec#;  --  bcm2835.h:896
   GPPUPPDN3 : constant := 16#00f0#;  --  bcm2835.h:897

   GPIO_PUD_ERROR : constant := 16#08#;  --  bcm2835.h:926

   PADS_GPIO_0_27 : constant := 16#002c#;  --  bcm2835.h:929
   PADS_GPIO_28_45 : constant := 16#0030#;  --  bcm2835.h:930
   PADS_GPIO_46_53 : constant := 16#0034#;  --  bcm2835.h:931
   --  unsupported macro: PAD_PASSWRD (0x5A << 24)

   PAD_SLEW_RATE_UNLIMITED : constant := 16#10#;  --  bcm2835.h:935
   PAD_HYSTERESIS_ENABLED : constant := 16#08#;  --  bcm2835.h:936
   PAD_DRIVE_2mA : constant := 16#00#;  --  bcm2835.h:937
   PAD_DRIVE_4mA : constant := 16#01#;  --  bcm2835.h:938
   PAD_DRIVE_6mA : constant := 16#02#;  --  bcm2835.h:939
   PAD_DRIVE_8mA : constant := 16#03#;  --  bcm2835.h:940
   PAD_DRIVE_10mA : constant := 16#04#;  --  bcm2835.h:941
   PAD_DRIVE_12mA : constant := 16#05#;  --  bcm2835.h:942
   PAD_DRIVE_14mA : constant := 16#06#;  --  bcm2835.h:943
   PAD_DRIVE_16mA : constant := 16#07#;  --  bcm2835.h:944

   AUX_IRQ : constant := 16#0000#;  --  bcm2835.h:1056
   AUX_ENABLE : constant := 16#0004#;  --  bcm2835.h:1057

   AUX_ENABLE_UART1 : constant := 16#01#;  --  bcm2835.h:1059
   AUX_ENABLE_SPI0 : constant := 16#02#;  --  bcm2835.h:1060
   AUX_ENABLE_SPI1 : constant := 16#04#;  --  bcm2835.h:1061

   AUX_SPI_CNTL0 : constant := 16#0000#;  --  bcm2835.h:1064
   AUX_SPI_CNTL1 : constant := 16#0004#;  --  bcm2835.h:1065
   AUX_SPI_STAT : constant := 16#0008#;  --  bcm2835.h:1066
   AUX_SPI_PEEK : constant := 16#000C#;  --  bcm2835.h:1067
   AUX_SPI_IO : constant := 16#0020#;  --  bcm2835.h:1068
   AUX_SPI_TXHOLD : constant := 16#0030#;  --  bcm2835.h:1069

   AUX_SPI_CLOCK_MIN : constant := 30500;  --  bcm2835.h:1071
   AUX_SPI_CLOCK_MAX : constant := 125000000;  --  bcm2835.h:1072

   AUX_SPI_CNTL0_SPEED : constant := 16#FFF00000#;  --  bcm2835.h:1074
   AUX_SPI_CNTL0_SPEED_MAX : constant := 16#FFF#;  --  bcm2835.h:1075

   AUX_SPI_CNTL0_CS0_N : constant := 16#000C0000#;  --  bcm2835.h:1078
   AUX_SPI_CNTL0_CS1_N : constant := 16#000A0000#;  --  bcm2835.h:1079
   AUX_SPI_CNTL0_CS2_N : constant := 16#00060000#;  --  bcm2835.h:1080

   AUX_SPI_CNTL0_POSTINPUT : constant := 16#00010000#;  --  bcm2835.h:1082
   AUX_SPI_CNTL0_VAR_CS : constant := 16#00008000#;  --  bcm2835.h:1083
   AUX_SPI_CNTL0_VAR_WIDTH : constant := 16#00004000#;  --  bcm2835.h:1084
   AUX_SPI_CNTL0_DOUTHOLD : constant := 16#00003000#;  --  bcm2835.h:1085
   AUX_SPI_CNTL0_ENABLE : constant := 16#00000800#;  --  bcm2835.h:1086
   AUX_SPI_CNTL0_CPHA_IN : constant := 16#00000400#;  --  bcm2835.h:1087
   AUX_SPI_CNTL0_CLEARFIFO : constant := 16#00000200#;  --  bcm2835.h:1088
   AUX_SPI_CNTL0_CPHA_OUT : constant := 16#00000100#;  --  bcm2835.h:1089
   AUX_SPI_CNTL0_CPOL : constant := 16#00000080#;  --  bcm2835.h:1090
   AUX_SPI_CNTL0_MSBF_OUT : constant := 16#00000040#;  --  bcm2835.h:1091
   AUX_SPI_CNTL0_SHIFTLEN : constant := 16#0000003F#;  --  bcm2835.h:1092

   AUX_SPI_CNTL1_CSHIGH : constant := 16#00000700#;  --  bcm2835.h:1094
   AUX_SPI_CNTL1_IDLE : constant := 16#00000080#;  --  bcm2835.h:1095
   AUX_SPI_CNTL1_TXEMPTY : constant := 16#00000040#;  --  bcm2835.h:1096
   AUX_SPI_CNTL1_MSBF_IN : constant := 16#00000002#;  --  bcm2835.h:1097
   AUX_SPI_CNTL1_KEEP_IN : constant := 16#00000001#;  --  bcm2835.h:1098

   AUX_SPI_STAT_TX_LVL : constant := 16#F0000000#;  --  bcm2835.h:1100
   AUX_SPI_STAT_RX_LVL : constant := 16#00F00000#;  --  bcm2835.h:1101
   AUX_SPI_STAT_TX_FULL : constant := 16#00000400#;  --  bcm2835.h:1102
   AUX_SPI_STAT_TX_EMPTY : constant := 16#00000200#;  --  bcm2835.h:1103
   AUX_SPI_STAT_RX_FULL : constant := 16#00000100#;  --  bcm2835.h:1104
   AUX_SPI_STAT_RX_EMPTY : constant := 16#00000080#;  --  bcm2835.h:1105
   AUX_SPI_STAT_BUSY : constant := 16#00000040#;  --  bcm2835.h:1106
   AUX_SPI_STAT_BITCOUNT : constant := 16#0000003F#;  --  bcm2835.h:1107

   SPI0_CS : constant := 16#0000#;  --  bcm2835.h:1113
   SPI0_FIFO : constant := 16#0004#;  --  bcm2835.h:1114
   SPI0_CLK : constant := 16#0008#;  --  bcm2835.h:1115
   SPI0_DLEN : constant := 16#000c#;  --  bcm2835.h:1116
   SPI0_LTOH : constant := 16#0010#;  --  bcm2835.h:1117
   SPI0_DC : constant := 16#0014#;  --  bcm2835.h:1118

   SPI0_CS_LEN_LONG : constant := 16#02000000#;  --  bcm2835.h:1121
   SPI0_CS_DMA_LEN : constant := 16#01000000#;  --  bcm2835.h:1122
   SPI0_CS_CSPOL2 : constant := 16#00800000#;  --  bcm2835.h:1123
   SPI0_CS_CSPOL1 : constant := 16#00400000#;  --  bcm2835.h:1124
   SPI0_CS_CSPOL0 : constant := 16#00200000#;  --  bcm2835.h:1125
   SPI0_CS_RXF : constant := 16#00100000#;  --  bcm2835.h:1126
   SPI0_CS_RXR : constant := 16#00080000#;  --  bcm2835.h:1127
   SPI0_CS_TXD : constant := 16#00040000#;  --  bcm2835.h:1128
   SPI0_CS_RXD : constant := 16#00020000#;  --  bcm2835.h:1129
   SPI0_CS_DONE : constant := 16#00010000#;  --  bcm2835.h:1130
   SPI0_CS_TE_EN : constant := 16#00008000#;  --  bcm2835.h:1131
   SPI0_CS_LMONO : constant := 16#00004000#;  --  bcm2835.h:1132
   SPI0_CS_LEN : constant := 16#00002000#;  --  bcm2835.h:1133
   SPI0_CS_REN : constant := 16#00001000#;  --  bcm2835.h:1134
   SPI0_CS_ADCS : constant := 16#00000800#;  --  bcm2835.h:1135
   SPI0_CS_INTR : constant := 16#00000400#;  --  bcm2835.h:1136
   SPI0_CS_INTD : constant := 16#00000200#;  --  bcm2835.h:1137
   SPI0_CS_DMAEN : constant := 16#00000100#;  --  bcm2835.h:1138
   SPI0_CS_TA : constant := 16#00000080#;  --  bcm2835.h:1139
   SPI0_CS_CSPOL : constant := 16#00000040#;  --  bcm2835.h:1140
   SPI0_CS_CLEAR : constant := 16#00000030#;  --  bcm2835.h:1141
   SPI0_CS_CLEAR_RX : constant := 16#00000020#;  --  bcm2835.h:1142
   SPI0_CS_CLEAR_TX : constant := 16#00000010#;  --  bcm2835.h:1143
   SPI0_CS_CPOL : constant := 16#00000008#;  --  bcm2835.h:1144
   SPI0_CS_CPHA : constant := 16#00000004#;  --  bcm2835.h:1145
   SPI0_CS_CS : constant := 16#00000003#;  --  bcm2835.h:1146

   BSC_C   : constant := 16#0000#;  --  bcm2835.h:1218
   BSC_S   : constant := 16#0004#;  --  bcm2835.h:1219
   BSC_DLEN : constant := 16#0008#;  --  bcm2835.h:1220
   BSC_A   : constant := 16#000c#;  --  bcm2835.h:1221
   BSC_FIFO : constant := 16#0010#;  --  bcm2835.h:1222
   BSC_DIV : constant := 16#0014#;  --  bcm2835.h:1223
   BSC_DEL : constant := 16#0018#;  --  bcm2835.h:1224
   BSC_CLKT : constant := 16#001c#;  --  bcm2835.h:1225

   BSC_C_I2CEN : constant := 16#00008000#;  --  bcm2835.h:1228
   BSC_C_INTR : constant := 16#00000400#;  --  bcm2835.h:1229
   BSC_C_INTT : constant := 16#00000200#;  --  bcm2835.h:1230
   BSC_C_INTD : constant := 16#00000100#;  --  bcm2835.h:1231
   BSC_C_ST : constant := 16#00000080#;  --  bcm2835.h:1232
   BSC_C_CLEAR_1 : constant := 16#00000020#;  --  bcm2835.h:1233
   BSC_C_CLEAR_2 : constant := 16#00000010#;  --  bcm2835.h:1234
   BSC_C_READ : constant := 16#00000001#;  --  bcm2835.h:1235

   BSC_S_CLKT : constant := 16#00000200#;  --  bcm2835.h:1238
   BSC_S_ERR : constant := 16#00000100#;  --  bcm2835.h:1239
   BSC_S_RXF : constant := 16#00000080#;  --  bcm2835.h:1240
   BSC_S_TXE : constant := 16#00000040#;  --  bcm2835.h:1241
   BSC_S_RXD : constant := 16#00000020#;  --  bcm2835.h:1242
   BSC_S_TXD : constant := 16#00000010#;  --  bcm2835.h:1243
   BSC_S_RXR : constant := 16#00000008#;  --  bcm2835.h:1244
   BSC_S_TXW : constant := 16#00000004#;  --  bcm2835.h:1245
   BSC_S_DONE : constant := 16#00000002#;  --  bcm2835.h:1246
   BSC_S_TA : constant := 16#00000001#;  --  bcm2835.h:1247

   BSC_FIFO_SIZE : constant := 16;  --  bcm2835.h:1249
   AUX_SPI_FIFO_SIZE : constant := 4;  --  bcm2835.h:1250

   SMI_CS  : constant := 0;  --  bcm2835.h:1278
   SMI_LENGTH : constant := 1;  --  bcm2835.h:1279
   SMI_ADRS : constant := 2;  --  bcm2835.h:1280
   SMI_DATA : constant := 3;  --  bcm2835.h:1281
   SMI_READ0 : constant := 4;  --  bcm2835.h:1282
   SMI_WRITE0 : constant := 5;  --  bcm2835.h:1283
   SMI_READ1 : constant := 6;  --  bcm2835.h:1284
   SMI_WRITE1 : constant := 7;  --  bcm2835.h:1285
   SMI_READ2 : constant := 8;  --  bcm2835.h:1286
   SMI_WRITE2 : constant := 9;  --  bcm2835.h:1287
   SMI_READ3 : constant := 10;  --  bcm2835.h:1288
   SMI_WRITE3 : constant := 11;  --  bcm2835.h:1289
   SMI_DMAC : constant := 12;  --  bcm2835.h:1290
   SMI_DIRCS : constant := 13;  --  bcm2835.h:1291
   SMI_DIRADDR : constant := 14;  --  bcm2835.h:1292
   SMI_DIRDATA : constant := 15;  --  bcm2835.h:1293

   SMI_RW_WIDTH_MSK : constant := 16#C0000000#;  --  bcm2835.h:1296
   SMI_RW_WID8 : constant := 16#00000000#;  --  bcm2835.h:1297
   SMI_RW_WID16 : constant := 16#40000000#;  --  bcm2835.h:1298
   SMI_RW_WID18 : constant := 16#80000000#;  --  bcm2835.h:1299
   SMI_RW_WID9 : constant := 16#C0000000#;  --  bcm2835.h:1300
   SMI_RW_SETUP_MSK : constant := 16#3F000000#;  --  bcm2835.h:1301
   SMI_RW_SETUP_LS : constant := 24;  --  bcm2835.h:1302
   SMI_RW_MODE68 : constant := 16#00800000#;  --  bcm2835.h:1303
   SMI_RW_MODE80 : constant := 16#00000000#;  --  bcm2835.h:1304
   SMI_READ_FSETUP : constant := 16#00400000#;  --  bcm2835.h:1305
   SMI_WRITE_SWAP : constant := 16#00400000#;  --  bcm2835.h:1306
   SMI_RW_HOLD_MSK : constant := 16#003F0000#;  --  bcm2835.h:1307
   SMI_RW_HOLD_LS : constant := 16;  --  bcm2835.h:1308
   SMI_RW_PACEALL : constant := 16#00008000#;  --  bcm2835.h:1309
   SMI_RW_PACE_MSK : constant := 16#00007F00#;  --  bcm2835.h:1310
   SMI_RW_PACE_LS : constant := 8;  --  bcm2835.h:1311
   SMI_RW_DREQ : constant := 16#00000080#;  --  bcm2835.h:1312
   SMI_RW_STROBE_MSK : constant := 16#0000007F#;  --  bcm2835.h:1313
   SMI_RW_STROBE_LS : constant := 0;  --  bcm2835.h:1314

   SMI_DIRCS_ENABLE : constant := 16#00000001#;  --  bcm2835.h:1317
   SMI_DIRCS_START : constant := 16#00000002#;  --  bcm2835.h:1318
   SMI_DIRCS_DONE : constant := 16#00000004#;  --  bcm2835.h:1319
   SMI_DIRCS_WRITE : constant := 16#00000008#;  --  bcm2835.h:1320

   SMI_DIRADRS_DEV_MSK : constant := 16#00000300#;  --  bcm2835.h:1323
   SMI_DIRADRS_DEV_LS : constant := 8;  --  bcm2835.h:1324
   SMI_DIRADRS_DEV0 : constant := 16#00000000#;  --  bcm2835.h:1325
   SMI_DIRADRS_DEV1 : constant := 16#00000100#;  --  bcm2835.h:1326
   SMI_DIRADRS_DEV2 : constant := 16#00000200#;  --  bcm2835.h:1327
   SMI_DIRADRS_DEV3 : constant := 16#00000300#;  --  bcm2835.h:1328
   SMI_DIRADRS_MSK : constant := 16#0000003F#;  --  bcm2835.h:1329
   SMI_DIRADRS_LS : constant := 0;  --  bcm2835.h:1330

   SMICLK_CNTL     : constant := (44);  --  bcm2835.h:1333
   SMICLK_DIV      : constant := (45);  --  bcm2835.h:1334

   ST_CS   : constant := 16#0000#;  --  bcm2835.h:1348
   ST_CLO  : constant := 16#0004#;  --  bcm2835.h:1349
   ST_CHI  : constant := 16#0008#;  --  bcm2835.h:1350

   PWM_CONTROL : constant := 0;  --  bcm2835.h:1356
   PWM_STATUS : constant := 1;  --  bcm2835.h:1357
   PWM_DMAC : constant := 2;  --  bcm2835.h:1358
   PWM0_RANGE : constant := 4;  --  bcm2835.h:1359
   PWM0_DATA : constant := 5;  --  bcm2835.h:1360
   PWM_FIF1 : constant := 6;  --  bcm2835.h:1361
   PWM1_RANGE : constant := 8;  --  bcm2835.h:1362
   PWM1_DATA : constant := 9;  --  bcm2835.h:1363

   PWMCLK_CNTL : constant := 40;  --  bcm2835.h:1366
   PWMCLK_DIV : constant := 41;  --  bcm2835.h:1367
   --  unsupported macro: PWM_PASSWRD (0x5A << 24)

   PWM1_MS_MODE : constant := 16#8000#;  --  bcm2835.h:1370
   PWM1_USEFIFO : constant := 16#2000#;  --  bcm2835.h:1371
   PWM1_REVPOLAR : constant := 16#1000#;  --  bcm2835.h:1372
   PWM1_OFFSTATE : constant := 16#0800#;  --  bcm2835.h:1373
   PWM1_REPEATFF : constant := 16#0400#;  --  bcm2835.h:1374
   PWM1_SERIAL : constant := 16#0200#;  --  bcm2835.h:1375
   PWM1_ENABLE : constant := 16#0100#;  --  bcm2835.h:1376

   PWM0_MS_MODE : constant := 16#0080#;  --  bcm2835.h:1378
   PWM_CLEAR_FIFO : constant := 16#0040#;  --  bcm2835.h:1379
   PWM0_USEFIFO : constant := 16#0020#;  --  bcm2835.h:1380
   PWM0_REVPOLAR : constant := 16#0010#;  --  bcm2835.h:1381
   PWM0_OFFSTATE : constant := 16#0008#;  --  bcm2835.h:1382
   PWM0_REPEATFF : constant := 16#0004#;  --  bcm2835.h:1383
   PWM0_SERIAL : constant := 16#0002#;  --  bcm2835.h:1384
   PWM0_ENABLE : constant := 16#0001#;  --  bcm2835.h:1385
   --  arg-macro: procedure delay (x)
   --    delay(x)
   --  arg-macro: procedure delayMicroseconds (x)
   --    delayMicroseconds(x)

   AUX_SPI_CNTL0_SPEED_SHIFT : constant := 20;  --  bcm2835.h:1076

   --  peripherals_base : aliased arm_linux_gnueabihf_sys_types_h.off_t  -- bcm2835.h:767
   --    with Import => True,
   --    Convention => C,
   --    External_Name => "bcm2835_peripherals_base";

   peripherals_size : size_t  -- bcm2835.h:769
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_peripherals_size";

   peripherals : access Unsigned  -- bcm2835.h:772
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_peripherals";

   st : access Unsigned  -- bcm2835.h:777
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_st";

   gpio : access Unsigned  -- bcm2835.h:782
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio";

   pwm : access Unsigned  -- bcm2835.h:787
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_pwm";

   clk : access Unsigned  -- bcm2835.h:792
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_clk";

   pads : access Unsigned  -- bcm2835.h:797
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_pads";

   spi0 : access Unsigned  -- bcm2835.h:802
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi0";

   bsc0 : access Unsigned  -- bcm2835.h:807
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_bsc0";

   bsc1 : access Unsigned  -- bcm2835.h:812
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_bsc1";

   aux : access Unsigned  -- bcm2835.h:817
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux";

   spi1 : access Unsigned  -- bcm2835.h:822
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi1";

   smi : access Unsigned  -- bcm2835.h:828
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_smi";

   subtype bcm2835RegisterBase is unsigned;
   REGBASE_ST   : constant  := 1;
   REGBASE_GPIO : constant  := 2;
   REGBASE_PWM  : constant  := 3;
   REGBASE_CLK  : constant  := 4;
   REGBASE_PADS : constant  := 5;
   REGBASE_SPI0 : constant  := 6;
   REGBASE_BSC0 : constant  := 7;
   REGBASE_BSC1 : constant  := 8;
   REGBASE_AUX  : constant  := 9;
   REGBASE_SPI1 : constant  := 10;
   REGBASE_SMI  : constant  := 11;  -- bcm2835.h:848

   subtype bcm2835FunctionSelect is unsigned;
   GPIO_FSEL_INPT : constant := 0;
   GPIO_FSEL_OUTP : constant := 1;
   GPIO_FSEL_ALT0 : constant := 4;
   GPIO_FSEL_ALT1 : constant := 5;
   GPIO_FSEL_ALT2 : constant := 6;
   GPIO_FSEL_ALT3 : constant := 7;
   GPIO_FSEL_ALT4 : constant := 3;
   GPIO_FSEL_ALT5 : constant := 2;
   GPIO_FSEL_MASK : constant := 7;  -- bcm2835.h:913

   type bcm2835PUDControl is 
     (BCM2835_GPIO_PUD_OFF,
      GPIO_PUD_DOWN,
      GPIO_PUD_UP)
     with Convention => C;  -- bcm2835.h:923

   type bcm2835PadGroup is 
     (BCM2835_PAD_GROUP_GPIO_0_27,
      PAD_GROUP_GPIO_28_45,
      PAD_GROUP_GPIO_46_53)
     with Convention => C;  -- bcm2835.h:954

   subtype RPiGPIOPin is unsigned;
   RPI_GPIO_P1_03                : constant := 0;
   RPI_GPIO_P1_05                : constant := 1;
   RPI_GPIO_P1_07                : constant := 4;
   RPI_GPIO_P1_08                : constant := 14;
   RPI_GPIO_P1_10                : constant := 15;
   RPI_GPIO_P1_11                : constant := 17;
   RPI_GPIO_P1_12                : constant := 18;
   RPI_GPIO_P1_13                : constant := 21;
   RPI_GPIO_P1_15                : constant := 22;
   RPI_GPIO_P1_16                : constant := 23;
   RPI_GPIO_P1_18                : constant := 24;
   RPI_GPIO_P1_19                : constant := 10;
   RPI_GPIO_P1_21                : constant := 9;
   RPI_GPIO_P1_22                : constant := 25;
   RPI_GPIO_P1_23                : constant := 11;
   RPI_GPIO_P1_24                : constant := 8;
   RPI_GPIO_P1_26                : constant := 7;
   RPI_V2_GPIO_P1_03             : constant := 2;
   RPI_V2_GPIO_P1_05             : constant := 3;
   RPI_V2_GPIO_P1_07             : constant := 4;
   RPI_V2_GPIO_P1_08             : constant := 14;
   RPI_V2_GPIO_P1_10             : constant := 15;
   RPI_V2_GPIO_P1_11             : constant := 17;
   RPI_V2_GPIO_P1_12             : constant := 18;
   RPI_V2_GPIO_P1_13             : constant := 27;
   RPI_V2_GPIO_P1_15             : constant := 22;
   RPI_V2_GPIO_P1_16             : constant := 23;
   RPI_V2_GPIO_P1_18             : constant := 24;
   RPI_V2_GPIO_P1_19             : constant := 10;
   RPI_V2_GPIO_P1_21             : constant := 9;
   RPI_V2_GPIO_P1_22             : constant := 25;
   RPI_V2_GPIO_P1_23             : constant := 11;
   RPI_V2_GPIO_P1_24             : constant := 8;
   RPI_V2_GPIO_P1_26             : constant := 7;
   RPI_V2_GPIO_P1_29             : constant := 5;
   RPI_V2_GPIO_P1_31             : constant := 6;
   RPI_V2_GPIO_P1_32             : constant := 12;
   RPI_V2_GPIO_P1_33             : constant := 13;
   RPI_V2_GPIO_P1_35             : constant := 19;
   RPI_V2_GPIO_P1_36             : constant := 16;
   RPI_V2_GPIO_P1_37             : constant := 26;
   RPI_V2_GPIO_P1_38             : constant := 20;
   RPI_V2_GPIO_P1_40             : constant := 21;
   RPI_V2_GPIO_P5_03             : constant := 28;
   RPI_V2_GPIO_P5_04             : constant := 29;
   RPI_V2_GPIO_P5_05             : constant := 30;
   RPI_V2_GPIO_P5_06             : constant := 31;
   RPI_BPLUS_GPIO_J8_03          : constant := 2;
   RPI_BPLUS_GPIO_J8_05          : constant := 3;
   RPI_BPLUS_GPIO_J8_07          : constant := 4;
   RPI_BPLUS_GPIO_J8_08          : constant := 14;
   RPI_BPLUS_GPIO_J8_10          : constant := 15;
   RPI_BPLUS_GPIO_J8_11          : constant := 17;
   RPI_BPLUS_GPIO_J8_12          : constant := 18;
   RPI_BPLUS_GPIO_J8_13          : constant := 27;
   RPI_BPLUS_GPIO_J8_15          : constant := 22;
   RPI_BPLUS_GPIO_J8_16          : constant := 23;
   RPI_BPLUS_GPIO_J8_18          : constant := 24;
   RPI_BPLUS_GPIO_J8_19          : constant := 10;
   RPI_BPLUS_GPIO_J8_21          : constant := 9;
   RPI_BPLUS_GPIO_J8_22          : constant := 25;
   RPI_BPLUS_GPIO_J8_23          : constant := 11;
   RPI_BPLUS_GPIO_J8_24          : constant := 8;
   RPI_BPLUS_GPIO_J8_26          : constant := 7;
   RPI_BPLUS_GPIO_J8_29          : constant := 5;
   RPI_BPLUS_GPIO_J8_31          : constant := 6;
   RPI_BPLUS_GPIO_J8_32          : constant := 12;
   RPI_BPLUS_GPIO_J8_33          : constant := 13;
   RPI_BPLUS_GPIO_J8_35          : constant := 19;
   RPI_BPLUS_GPIO_J8_36          : constant := 16;
   RPI_BPLUS_GPIO_J8_37          : constant := 26;
   RPI_BPLUS_GPIO_J8_38          : constant := 20;
   RPI_BPLUS_GPIO_J8_40          : constant := 21;  -- bcm2835.h:1051

   type bcm2835SPIBitOrder is 
     (BCM2835_SPI_BIT_ORDER_LSBFIRST,
      SPI_BIT_ORDER_MSBFIRST)
     with Convention => C;  -- bcm2835.h:1155

   type bcm2835SPIMode is 
     (BCM2835_SPI_MODE0,
      SPI_MODE1,
      SPI_MODE2,
      SPI_MODE3)
     with Convention => C;  -- bcm2835.h:1166

   type bcm2835SPIChipSelect is 
     (BCM2835_SPI_CS0,
      SPI_CS1,
      SPI_CS2,
      SPI_CS_NONE)
     with Convention => C;  -- bcm2835.h:1177

   subtype bcm2835SPIClockDivider is unsigned;
   SPI_CLOCK_DIVIDER_65536 : constant := 0;
   SPI_CLOCK_DIVIDER_32768 : constant := 32768;
   SPI_CLOCK_DIVIDER_16384 : constant := 16384;
   SPI_CLOCK_DIVIDER_8192 : constant := 8192;
   SPI_CLOCK_DIVIDER_4096 : constant := 4096;
   SPI_CLOCK_DIVIDER_2048 : constant := 2048;
   SPI_CLOCK_DIVIDER_1024 : constant := 1024;
   SPI_CLOCK_DIVIDER_512 : constant := 512;
   SPI_CLOCK_DIVIDER_256 : constant := 256;
   SPI_CLOCK_DIVIDER_128 : constant := 128;
   SPI_CLOCK_DIVIDER_64 : constant := 64;
   SPI_CLOCK_DIVIDER_32 : constant := 32;
   SPI_CLOCK_DIVIDER_16 : constant := 16;
   SPI_CLOCK_DIVIDER_8 : constant := 8;
   SPI_CLOCK_DIVIDER_4 : constant := 4;
   SPI_CLOCK_DIVIDER_2 : constant := 2;
   SPI_CLOCK_DIVIDER_1 : constant := 1;  -- bcm2835.h:1212

   subtype bcm2835I2CClockDivider is unsigned;
   I2C_CLOCK_DIVIDER_2500 : constant := 2500;
   I2C_CLOCK_DIVIDER_626 : constant := 626;
   I2C_CLOCK_DIVIDER_150 : constant := 150;
   I2C_CLOCK_DIVIDER_148 : constant := 148;  -- bcm2835.h:1262

   subtype bcm2835I2CReasonCodes is unsigned;
   I2C_REASON_OK : constant := 0;
   I2C_REASON_ERROR_NACK : constant := 1;
   I2C_REASON_ERROR_CLKT : constant := 2;
   I2C_REASON_ERROR_DATA : constant := 4;
   I2C_REASON_ERROR_TIMEOUT : constant := 8;  -- bcm2835.h:1275

   subtype bcm2835PWMClockDivider is unsigned;
   PWM_CLOCK_DIVIDER_2048 : constant := 2048;
   PWM_CLOCK_DIVIDER_1024 : constant := 1024;
   PWM_CLOCK_DIVIDER_512 : constant := 512;
   PWM_CLOCK_DIVIDER_256 : constant := 256;
   PWM_CLOCK_DIVIDER_128 : constant := 128;
   PWM_CLOCK_DIVIDER_64 : constant := 64;
   PWM_CLOCK_DIVIDER_32 : constant := 32;
   PWM_CLOCK_DIVIDER_16 : constant := 16;
   PWM_CLOCK_DIVIDER_8 : constant := 8;
   PWM_CLOCK_DIVIDER_4 : constant := 4;
   PWM_CLOCK_DIVIDER_2 : constant := 2;
   PWM_CLOCK_DIVIDER_1 : constant := 1;  -- bcm2835.h:1407

   function init return int  -- bcm2835.h:1437
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_init";

   function close return int  -- bcm2835.h:1442
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_close";

   procedure set_debug (debug : unsigned_Char)  -- bcm2835.h:1451
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_set_debug";

   function lib_version return unsigned  -- bcm2835.h:1456
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_version";

   function regbase (regbase : unsigned_Char) return access Unsigned  -- bcm2835.h:1473
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_regbase";

   function peri_read (paddr : access Unsigned) return Unsigned  -- bcm2835.h:1483
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_peri_read";

   function peri_read_nb (paddr : access Unsigned) return Unsigned  -- bcm2835.h:1495
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_peri_read_nb";

   procedure peri_write (paddr : access Unsigned; value : Unsigned)  -- bcm2835.h:1509
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_peri_write";

   procedure peri_write_nb (paddr : access Unsigned; value : Unsigned)  -- bcm2835.h:1523
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_peri_write_nb";

   procedure peri_set_bits
     (paddr : access Unsigned;
      value : Unsigned;
      mask  : Unsigned)  -- bcm2835.h:1537
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_peri_set_bits";

   procedure gpio_fsel (pin : unsigned_Char; mode : unsigned_Char)  -- bcm2835.h:1551
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_fsel";

   procedure gpio_set (pin : unsigned_Char)  -- bcm2835.h:1558
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_set";

   procedure gpio_clr (pin : unsigned_Char)  -- bcm2835.h:1565
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr";

   procedure gpio_set_multi (mask : Unsigned)  -- bcm2835.h:1572
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_set_multi";

   procedure gpio_clr_multi (mask : Unsigned)  -- bcm2835.h:1579
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr_multi";

   function gpio_lev (pin : unsigned_Char) return unsigned_Char  -- bcm2835.h:1587
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_lev";

   function gpio_eds (pin : unsigned_Char) return unsigned_Char  -- bcm2835.h:1597
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_eds";

   function gpio_eds_multi (mask : Unsigned) return Unsigned  -- bcm2835.h:1604
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_eds_multi";

   procedure gpio_set_eds (pin : unsigned_Char)  -- bcm2835.h:1611
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_set_eds";

   procedure gpio_set_eds_multi (mask : Unsigned)  -- bcm2835.h:1617
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_set_eds_multi";

   procedure gpio_ren (pin : unsigned_Char)  -- bcm2835.h:1627
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_ren";

   procedure gpio_clr_ren (pin : unsigned_Char)  -- bcm2835.h:1632
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr_ren";

   procedure gpio_fen (pin : unsigned_Char)  -- bcm2835.h:1642
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_fen";

   procedure gpio_clr_fen (pin : unsigned_Char)  -- bcm2835.h:1647
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr_fen";

   procedure gpio_hen (pin : unsigned_Char)  -- bcm2835.h:1653
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_hen";

   procedure gpio_clr_hen (pin : unsigned_Char)  -- bcm2835.h:1658
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr_hen";

   procedure gpio_len (pin : unsigned_Char)  -- bcm2835.h:1664
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_len";

   procedure gpio_clr_len (pin : unsigned_Char)  -- bcm2835.h:1669
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr_len";

   procedure gpio_aren (pin : unsigned_Char)  -- bcm2835.h:1677
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_aren";

   procedure gpio_clr_aren (pin : unsigned_Char)  -- bcm2835.h:1682
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr_aren";

   procedure gpio_afen (pin : unsigned_Char)  -- bcm2835.h:1690
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_afen";

   procedure gpio_clr_afen (pin : unsigned_Char)  -- bcm2835.h:1695
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_clr_afen";

   procedure gpio_pud (pud : unsigned_Char)  -- bcm2835.h:1705
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_pud";

   procedure gpio_pudclk (pin : unsigned_Char; on : unsigned_Char)  -- bcm2835.h:1717
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_pudclk";

   function gpio_pad (group : unsigned_Char) return Unsigned  -- bcm2835.h:1724
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_pad";

   procedure gpio_set_pad (group : unsigned_Char; control : Unsigned)  -- bcm2835.h:1733
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_set_pad";

   procedure delayMicroseconds (micros : Interfaces.Unsigned_64)  -- bcm2835.h:1760
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_delayMicroseconds";

   procedure gpio_write (pin : unsigned_Char; on : unsigned_Char)  -- bcm2835.h:1766
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_write";

   procedure gpio_write_multi (mask : Unsigned; on : unsigned_Char)  -- bcm2835.h:1772
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_write_multi";

   procedure gpio_write_mask (value : Unsigned; mask : Unsigned)  -- bcm2835.h:1778
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_write_mask";

   procedure gpio_set_pud (pin : unsigned_Char; pud : unsigned_Char)  -- bcm2835.h:1785
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_set_pud";

   function gpio_get_pud (pin : unsigned_Char) return unsigned_Char  -- bcm2835.h:1793
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_gpio_get_pud";

   function spi_begin return int  -- bcm2835.h:1811
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_begin";

   procedure spi_end  -- bcm2835.h:1817
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_end";

   procedure spi_setBitOrder (order : bcm2835SPIBitOrder)  -- bcm2835.h:1826
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_setBitOrder";

   procedure spi_setClockDivider (divider : Unsigned_Short)  -- bcm2835.h:1833
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_setClockDivider";

   procedure spi_set_speed_hz (speed_hz : Unsigned)  -- bcm2835.h:1839
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_set_speed_hz";

   procedure spi_setDataMode (mode : bcm2835SPIMode)  -- bcm2835.h:1846
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_setDataMode";

   procedure spi_chipSelect (cs : unsigned_Char)  -- bcm2835.h:1854
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_chipSelect";

   procedure spi_setChipSelectPolarity (cs : unsigned_Char; active : unsigned_Char)  -- bcm2835.h:1864
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_setChipSelectPolarity";

   function spi_transfer (value : unsigned_Char) return unsigned_Char  -- bcm2835.h:1876
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_transfer";

   procedure spi_transfernb
     (tbuf : Interfaces.C.Strings.chars_ptr;
      rbuf : Interfaces.C.Strings.chars_ptr;
      len  : Unsigned)  -- bcm2835.h:1889
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_transfernb";

   procedure spi_transfern (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1898
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_transfern";

   procedure spi_writenb (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1906
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_writenb";

   procedure spi_write (data : Unsigned_Short)  -- bcm2835.h:1916
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_spi_write";

   function aux_spi_begin return int  -- bcm2835.h:1923
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_begin";

   procedure aux_spi_end  -- bcm2835.h:1929
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_end";

   procedure aux_spi_setClockDivider (divider : Unsigned_Short)  -- bcm2835.h:1934
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_setClockDivider";

   function aux_spi_CalcClockDivider (speed_hz : Unsigned) return Unsigned_Short  -- bcm2835.h:1941
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_CalcClockDivider";

   procedure aux_spi_write (data : Unsigned_Short)  -- bcm2835.h:1949
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_write";

   procedure aux_spi_writenb (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1956
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_writenb";

   procedure aux_spi_transfern (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned)  -- bcm2835.h:1965
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_transfern";

   procedure aux_spi_transfernb
     (tbuf : Interfaces.C.Strings.chars_ptr;
      rbuf : Interfaces.C.Strings.chars_ptr;
      len  : Unsigned)  -- bcm2835.h:1975
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_transfernb";

   function aux_spi_transfer (value : unsigned_Char) return unsigned_Char  -- bcm2835.h:1984
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_aux_spi_transfer";

   function i2c_begin return int  -- bcm2835.h:2002
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_begin";

   procedure i2c_end  -- bcm2835.h:2008
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_end";

   procedure i2c_setSlaveAddress (addr : unsigned_Char)  -- bcm2835.h:2013
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_setSlaveAddress";

   procedure i2c_setClockDivider (divider : Unsigned_Short)  -- bcm2835.h:2019
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_setClockDivider";

   procedure i2c_set_baudrate (baudrate : Unsigned)  -- bcm2835.h:2027
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_set_baudrate";

   function i2c_write (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned) return unsigned_Char  -- bcm2835.h:2035
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_write";

   function i2c_read (buf : Interfaces.C.Strings.chars_ptr; len : Unsigned) return unsigned_Char  -- bcm2835.h:2043
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_read";

   function i2c_read_register_rs
     (regaddr : Interfaces.C.Strings.chars_ptr;
      buf     : Interfaces.C.Strings.chars_ptr;
      len     : Unsigned) return unsigned_Char  -- bcm2835.h:2059
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_read_register_rs";

   function i2c_write_read_rs
     (cmds     : Interfaces.C.Strings.chars_ptr;
      cmds_len : Unsigned;
      buf      : Interfaces.C.Strings.chars_ptr;
      buf_len  : Unsigned) return unsigned_Char  -- bcm2835.h:2071
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_i2c_write_read_rs";

   function smi_begin return int  -- bcm2835.h:2089
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_smi_begin";

   procedure smi_end  -- bcm2835.h:2095
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_smi_end";

   procedure smi_set_timing
     (smichannel   : Unsigned;
      readchannel  : Unsigned;
      setupcycles  : Unsigned;
      strobecycles : Unsigned;
      holdcycles   : Unsigned;
      pacecycles   : Unsigned)  -- bcm2835.h:2110
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_smi_set_timing";

   procedure smi_write
     (smichannel : Unsigned;
      data       : unsigned_Char;
      address    : Unsigned)  -- bcm2835.h:2121
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_smi_write";

   function smi_read (smichannel : Unsigned; address : Unsigned) return Unsigned  -- bcm2835.h:2130
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_smi_read";

   function st_read return Interfaces.Unsigned_64  -- bcm2835.h:2143
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_st_read";

   procedure st_delay (offset_micros : Interfaces.Unsigned_64; micros : Interfaces.Unsigned_64)  -- bcm2835.h:2149
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_st_delay";

   procedure pwm_set_clock (divisor : Unsigned)  -- bcm2835.h:2166
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_pwm_set_clock";

   procedure pwm_set_mode
     (channel   : unsigned_Char;
      markspace : unsigned_Char;
      enabled   : unsigned_Char)  -- bcm2835.h:2174
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_pwm_set_mode";

   procedure pwm_set_range (channel : unsigned_Char; c_range : Unsigned)  -- bcm2835.h:2181
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_pwm_set_range";

   procedure pwm_set_data (channel : unsigned_Char; data : Unsigned)  -- bcm2835.h:2189
     with Import => True, 
     Convention => C, 
     External_Name => "bcm2835_pwm_set_data";

end Bcm2835;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
