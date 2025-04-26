set_property SRC_FILE_INFO {cfile:/home/enzcu445/TSEA83/2048/projekt_skal_mikro/Basys3.xdc rfile:../../../../Basys3.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]
