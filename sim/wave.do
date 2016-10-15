onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_sat_cnt/sat_cnt_i/rst
add wave -noupdate /tb_sat_cnt/sat_cnt_i/clk
add wave -noupdate -radix unsigned /tb_sat_cnt/sat_cnt_i/data_out
add wave -noupdate /tb_sat_cnt/sat_cnt_i/en
add wave -noupdate /tb_sat_cnt/sat_cnt_i/sclr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {112500 ps} 0} {{Cursor 2} {218750 ps} 0} {{Cursor 3} {343750 ps} 0} {{Cursor 4} {481250 ps} 0} {{Cursor 5} {531250 ps} 0} {{Cursor 6} {731250 ps} 0}
quietly wave cursor active 5
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {69879 ps} {789553 ps}
