set_property SRC_FILE_INFO {cfile:/home/enzcu445/TSEA83/2048/projekt_skal_mikro/Basys3.xdc rfile:../Basys3.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
## This file is a general .xdc for the Basys3 rev B board
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
## To use it in a project:
set_property src_info {type:XDC file:1 line:3 export:INPUT save:INPUT read:READ} [current_design]
## - uncomment the lines corresponding to used pins
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
## Clock signal
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports clk]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
## Switches
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {sw[0]}]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {sw[1]}]
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {sw[2]}]
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports {sw[3]}]
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports {sw[4]}]
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports {sw[5]}]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports {sw[6]}]
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports {sw[7]}]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports {sw[8]}]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports {sw[9]}]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports {sw[10]}]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports {sw[11]}]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports {sw[12]}]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports {sw[13]}]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports {sw[14]}]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports {sw[15]}]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
## LEDs
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports {led[0]}]
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports {led[1]}]
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports {led[2]}]
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports {led[3]}]
set_property src_info {type:XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports {led[4]}]
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports {led[5]}]
set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports {led[6]}]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports {led[7]}]
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports {led[8]}]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports {led[9]}]
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports {led[10]}]
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports {led[11]}]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports {led[12]}]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports {led[13]}]
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports {led[14]}]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports {led[15]}]
set_property src_info {type:XDC file:1 line:47 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:49 export:INPUT save:INPUT read:READ} [current_design]
##7 Segment Display
set_property src_info {type:XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports {seg[0]}];# CA
set_property src_info {type:XDC file:1 line:51 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports {seg[1]}];# CB
set_property src_info {type:XDC file:1 line:52 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports {seg[2]}];# CC
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports {seg[3]}];# CD
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports {seg[4]}];# CE
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports {seg[5]}];# CF
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports {seg[6]}];# CG
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports dp];# DP
set_property src_info {type:XDC file:1 line:58 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {an[0]}]
set_property src_info {type:XDC file:1 line:59 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports {an[1]}]
set_property src_info {type:XDC file:1 line:60 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports {an[2]}]
set_property src_info {type:XDC file:1 line:61 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports {an[3]}]
set_property src_info {type:XDC file:1 line:62 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:64 export:INPUT save:INPUT read:READ} [current_design]
##Buttons
set_property src_info {type:XDC file:1 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports btnC]
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports btnU]
set_property src_info {type:XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports btnL]
set_property src_info {type:XDC file:1 line:68 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports btnR]
set_property src_info {type:XDC file:1 line:69 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports btnD]
set_property src_info {type:XDC file:1 line:70 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:71 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:72 export:INPUT save:INPUT read:READ} [current_design]
##Pmod Header JA
set_property src_info {type:XDC file:1 line:73 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN J1   IOSTANDARD LVCMOS33 } [get_ports {JA[0]}];#Sch name = JA1
set_property src_info {type:XDC file:1 line:74 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN L2   IOSTANDARD LVCMOS33 } [get_ports {JA[1]}];#Sch name = JA2
set_property src_info {type:XDC file:1 line:75 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN J2   IOSTANDARD LVCMOS33 } [get_ports {JA[2]}];#Sch name = JA3
set_property src_info {type:XDC file:1 line:76 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports {JA[3]}];#Sch name = JA4
set_property src_info {type:XDC file:1 line:77 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports {JA[4]}];#Sch name = JA7
set_property src_info {type:XDC file:1 line:78 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports {JA[5]}];#Sch name = JA8
set_property src_info {type:XDC file:1 line:79 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports {JA[6]}];#Sch name = JA9
set_property src_info {type:XDC file:1 line:80 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN G3   IOSTANDARD LVCMOS33 } [get_ports {JA[7]}];#Sch name = JA10
set_property src_info {type:XDC file:1 line:81 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:82 export:INPUT save:INPUT read:READ} [current_design]
##Pmod Header JB
set_property src_info {type:XDC file:1 line:83 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports {JB[0]}];#Sch name = JB1
set_property src_info {type:XDC file:1 line:84 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports {JB[1]}];#Sch name = JB2
set_property src_info {type:XDC file:1 line:85 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports {JB[2]}];#Sch name = JB3
set_property src_info {type:XDC file:1 line:86 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports {JB[3]}];#Sch name = JB4
set_property src_info {type:XDC file:1 line:87 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports {JB[4]}];#Sch name = JB7
set_property src_info {type:XDC file:1 line:88 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports {JB[5]}];#Sch name = JB8
set_property src_info {type:XDC file:1 line:89 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports {JB[6]}];#Sch name = JB9
set_property src_info {type:XDC file:1 line:90 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports {JB[7]}];#Sch name = JB10
set_property src_info {type:XDC file:1 line:91 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:92 export:INPUT save:INPUT read:READ} [current_design]
##Pmod Header JC
set_property src_info {type:XDC file:1 line:93 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports {JC[0]}];#Sch name = JC1
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports {JC[1]}];#Sch name = JC2
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports {JC[2]}];#Sch name = JC3
set_property src_info {type:XDC file:1 line:96 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports {JC[3]}];#Sch name = JC4
set_property src_info {type:XDC file:1 line:97 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports {JC[4]}];#Sch name = JC7
set_property src_info {type:XDC file:1 line:98 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports {JC[5]}];#Sch name = JC8
set_property src_info {type:XDC file:1 line:99 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports {JC[6]}];#Sch name = JC9
set_property src_info {type:XDC file:1 line:100 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports {JC[7]}];#Sch name = JC10
set_property src_info {type:XDC file:1 line:101 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:102 export:INPUT save:INPUT read:READ} [current_design]
##Pmod Header JXADC
set_property src_info {type:XDC file:1 line:103 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN J3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[0]}];#Sch name = XA1_P
set_property src_info {type:XDC file:1 line:104 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN L3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[1]}];#Sch name = XA2_P
set_property src_info {type:XDC file:1 line:105 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN M2   IOSTANDARD LVCMOS33 } [get_ports {JXADC[2]}];#Sch name = XA3_P
set_property src_info {type:XDC file:1 line:106 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS33 } [get_ports {JXADC[3]}];#Sch name = XA4_P
set_property src_info {type:XDC file:1 line:107 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN K3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[4]}];#Sch name = XA1_N
set_property src_info {type:XDC file:1 line:108 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN M3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[5]}];#Sch name = XA2_N
set_property src_info {type:XDC file:1 line:109 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN M1   IOSTANDARD LVCMOS33 } [get_ports {JXADC[6]}];#Sch name = XA3_N
set_property src_info {type:XDC file:1 line:110 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS33 } [get_ports {JXADC[7]}];#Sch name = XA4_N
set_property src_info {type:XDC file:1 line:111 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:112 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:113 export:INPUT save:INPUT read:READ} [current_design]
##VGA Connector
set_property src_info {type:XDC file:1 line:114 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS33} [get_ports {vgaRed[0]}]
set_property src_info {type:XDC file:1 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H19 IOSTANDARD LVCMOS33} [get_ports {vgaRed[1]}]
set_property src_info {type:XDC file:1 line:116 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports {vgaRed[2]}]
set_property src_info {type:XDC file:1 line:117 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS33} [get_ports {vgaRed[3]}]
set_property src_info {type:XDC file:1 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports {vgaBlue[0]}]
set_property src_info {type:XDC file:1 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {vgaBlue[1]}]
set_property src_info {type:XDC file:1 line:120 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {vgaBlue[2]}]
set_property src_info {type:XDC file:1 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {vgaBlue[3]}]
set_property src_info {type:XDC file:1 line:122 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {vgaGreen[0]}]
set_property src_info {type:XDC file:1 line:123 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {vgaGreen[1]}]
set_property src_info {type:XDC file:1 line:124 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {vgaGreen[2]}]
set_property src_info {type:XDC file:1 line:125 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports {vgaGreen[3]}]
set_property src_info {type:XDC file:1 line:126 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports Hsync]
set_property src_info {type:XDC file:1 line:127 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN R19 IOSTANDARD LVCMOS33} [get_ports Vsync]
set_property src_info {type:XDC file:1 line:128 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:129 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:130 export:INPUT save:INPUT read:READ} [current_design]
##USB-RS232 Interface
set_property src_info {type:XDC file:1 line:131 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports RsRx]
set_property src_info {type:XDC file:1 line:132 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports RsTx]
set_property src_info {type:XDC file:1 line:133 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:134 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:135 export:INPUT save:INPUT read:READ} [current_design]
##USB HID (PS/2)
set_property src_info {type:XDC file:1 line:136 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN C17 [get_ports PS2Clk]
set_property src_info {type:XDC file:1 line:136 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
set_property src_info {type:XDC file:1 line:136 export:INPUT save:INPUT read:READ} [current_design]
set_property PULLTYPE PULLUP [get_ports PS2Clk]
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN B17 [get_ports PS2Data]
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property PULLTYPE PULLUP [get_ports PS2Data]
set_property src_info {type:XDC file:1 line:138 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:139 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:140 export:INPUT save:INPUT read:READ} [current_design]
##Quad SPI Flash
set_property src_info {type:XDC file:1 line:141 export:INPUT save:INPUT read:READ} [current_design]
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
set_property src_info {type:XDC file:1 line:142 export:INPUT save:INPUT read:READ} [current_design]
##STARTUPE2 primitive.
set_property src_info {type:XDC file:1 line:143 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[0]}]
set_property src_info {type:XDC file:1 line:144 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[1]}]
set_property src_info {type:XDC file:1 line:145 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[2]}]
set_property src_info {type:XDC file:1 line:146 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[3]}]
set_property src_info {type:XDC file:1 line:147 export:INPUT save:INPUT read:READ} [current_design]
#set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports QspiCSn]
set_property src_info {type:XDC file:1 line:148 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:149 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:150 export:INPUT save:INPUT read:READ} [current_design]
## Configuration options, can be used for all designs
set_property src_info {type:XDC file:1 line:151 export:INPUT save:INPUT read:READ} [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property src_info {type:XDC file:1 line:152 export:INPUT save:INPUT read:READ} [current_design]
set_property CFGBVS VCCO [current_design]
set_property src_info {type:XDC file:1 line:153 export:INPUT save:INPUT read:READ} [current_design]

set_property src_info {type:XDC file:1 line:154 export:INPUT save:INPUT read:READ} [current_design]
## SPI configuration mode options for QSPI boot, can be used for all designs
set_property src_info {type:XDC file:1 line:155 export:INPUT save:INPUT read:READ} [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property src_info {type:XDC file:1 line:156 export:INPUT save:INPUT read:READ} [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property src_info {type:XDC file:1 line:157 export:INPUT save:INPUT read:READ} [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property src_info {type:XDC file:1 line:158 export:INPUT save:INPUT read:READ} [current_design]

