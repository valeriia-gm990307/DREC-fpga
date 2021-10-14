set_time_format -unit ns -decimal_places 3
create_clock -name {sclk} -period 20.000 -waveform {0.000 10.000} [get_ports sclk]
create_generated_clock -divide_by 16 -source [get_ports sclk] -name clk_count [get_registers clk_count]
set_clock_uncertainty -rise_from [get_ports sclk] -rise_to [get_ports sclk] 0.020
set_clock_uncertainty -rise_from [get_ports sclk] -fall_to [get_ports sclk] 0.020
set_clock_uncertainty -fall_from [get_ports sclk] -rise_to [get_ports sclk] 0.020
set_clock_uncertainty -fall_from [get_ports sclk] -fall_to [get_ports sclk] 0.020
set_false_path -to [get_ports indikators]
set_false_path -to [get_ports segments]
set_false_path -from [get_clocks sclk] -to [get_clocks clk_count]
set_false_path -to [get_clocks sclk] -from [get_clocks clk_count]
