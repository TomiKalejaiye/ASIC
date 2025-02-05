onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /NYQ_TB/NYQ_In_D
add wave -noupdate /NYQ_TB/PAR_In_D
add wave -noupdate /NYQ_TB/NYQ_Out_D
add wave -noupdate /NYQ_TB/NYQ_Out_DE
add wave -noupdate /NYQ_TB/Clk_C
add wave -noupdate /NYQ_TB/Rst_RB
add wave -noupdate /NYQ_TB/WrEn_S
add wave -noupdate /NYQ_TB/Addr_D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3024 ps}
