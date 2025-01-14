#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Dec  6 22:44:45 2019                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.13-s098_1 (64bit) 02/08/2018 11:26 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.13-s098_1 NR180117-1602/17_13-UB (database version 2.30, 414.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.13-s036 (64bit) 02/08/2018 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.13-s031_1 () Feb  1 2018 09:16:44 ( )
#@(#)CDS: SYNTECH 17.13-s011_1 () Jan 14 2018 01:24:42 ( )
#@(#)CDS: CPE v17.13-s062
#@(#)CDS: IQRC/TQRC 16.1.1-s220 (64bit) Fri Aug  4 09:53:48 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
setMultiCpuUsage -localCpu 4
setLibraryUnit -time 1ns
setLibraryUnit -cap 1pf
set defHierChar /
set init_verilog ../syn/outputs/NYQ.v
set init_design_settop 0
set init_lef_file {/work/local/ece5746/saed90nm_tech.lef  /work/global/brg/install/adk-pkgs/saed-90nm/pkgs/SAED_EDK90nm_01252011/SAED_EDK90nm/Digital_Standard_cell_Library/lef/saed90nm.lef  }
setImportMode -treatUndefinedCellAsBbox 0 -keepEmptyModule 1
set init_import_mode {-treatUndefinedCellAsBbox 0 -keepEmptyModule 1}
set init_mmmc_file ./src/chip_mmmc.view.tcl
init_design
all_constraint_modes -active
set_interactive_constraint_modes [all_constraint_modes -active]
floorPlan -site unit -d 1500 1500 14.08 14.08 14.08 14.08
setPinAssignMode -pinEditInBatch True
editPin -cell NYQ -fixOverlap 1 -spreadDirection clockwise -edge 2 -layer 3 -spreadType start -unit TRACK -spacing 50 -offsetStart 15 -pin {WrEn_SI Rst_RBI Clk_CI Addr_DI* PAR_In_DI*}
editPin -cell NYQ -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 3 -spreadType start -unit TRACK -spacing 14 -offsetStart 15 -pin NYQ_In_DI*
editPin -cell NYQ -fixOverlap 1 -spreadDirection clockwise -edge 3 -layer 3 -spreadType start -unit TRACK -spacing 14 -offsetStart 15 -pin NYQ_Out_DO*
editPin -cell NYQ -fixOverlap 1 -spreadDirection counterclockwise -edge 1 -layer 3 -spreadType start -unit TRACK -spacing 14 -offsetStart 15 -pin NYQ_Valid_DO
setPinAssignMode -pinEditInBatch False
read_power_intent -cpf src/chip.cpf
commit_power_intent
setEndCapMode -rightEdge DCAP -leftEdge DCAP
addEndCap -powerDomain PD_CORE
deleteAllPowerPreroutes
clearDrc
addRing -width 4.48 -spacing 2.24 -offset 1.92 -layer {bottom M7 top M7 right M8 left M8} -nets {VDD VSS} -type core_rings -follow core -threshold 0
addRing -width 4.48 -spacing 2.24 -offset 1.92 -layer {bottom M5 top M5 right M6 left M6} -nets {VDD VSS} -type core_rings -follow core -threshold 0
addRing -width 4.48 -spacing 2.24 -offset 1.92 -layer {bottom M3 top M3 right M4 left M4} -nets {VDD VSS} -type core_rings -follow core -threshold 0
addRing -width 4.48 -spacing 2.24 -offset 1.92 -layer {bottom M1 top M1 right M2 left M2} -nets {VDD VSS} -type core_rings -follow core -threshold 0
sroute -connect { corePin } -allowLayerChange 1 -allowJogging 1 -crossoverViaLayerRange {M2 M4} -targetViaLayerRange {M2 M4} -nets {VDD VSS} -corePinWidth 0.160 -corePinLayer M1
addStripe -nets {VDD VSS} -layer M7 -direction horizontal -width 0.64 -spacing 2.24 -set_to_set_distance 5.76 -start_from top -start_offset 1.12 -switch_layer_over_obs false -max_same_layer_jog_length 2
addStripe -nets {VDD VSS} -layer M8 -direction vertical -width 3.2 -spacing 8.6 -set_to_set_distance 23.04 -start_from left -start_offset 5.6 -switch_layer_over_obs false -max_same_layer_jog_length 2
setRouteMode -earlyGlobalMinRouteLayer 2
setRouteMode -earlyGlobalMaxRouteLayer 9
setPlaceMode -place_global_cong_effort high -place_global_timing_effort medium -place_global_clock_gate_aware true -place_global_clock_power_driven true -place_detail_legalization_inst_gap 1 -place_global_reorder_scan false
setAnalysisMode -analysisType onChipVariation -cppr both
place_opt_design -out_dir reports/01_placed_opt_design_prects
setTieHiLoMode -cell {TIEH TIEL} -maxDistance 20 -maxFanout 10
addTieHiLo -prefix TIEHILOW
checkPlace
timeDesign -preCTS -expandedViews -outDir reports/01_timedesign_prects
saveDesign save/NYQ_placed.enc
update_constraint_mode -name func_mode \
                       -sdc_files [list src/constraints/constraints_mode0.sdc \
                                        src/constraints/latencies_mode0_postcts.sdc \
                                  ]
update_constraint_mode -name hold_mode \
                       -sdc_files [list src/constraints/constraints_modeH.sdc \
                                        src/constraints/latencies_mode0_postcts.sdc \
                                  ]
update_constraint_mode -name test_mode \
                       -sdc_files [list src/constraints/constraints_modeT.sdc \
                                        src/constraints/latencies_mode0_postcts.sdc \
                                  ]                                                                    
set_analysis_view -update_timing
setNanoRouteMode -routeBottomRoutingLayer 2
setNanoRouteMode -routeTopRoutingLayer 9
set_ccopt_property buffer_cells {NBUFFX2 NBUFFX4 NBUFFX8 NBUFFX16 NBUFFX32}
set_ccopt_property inverter_cells {INVX1 INVX2 INVX4 INVX8 INVX16 INVX32}
set_ccopt_property clock_gating_cells {CGLPPRX2 CGLPPRX8}
set_ccopt_property source_max_capacitance 3pf
create_ccopt_clock_tree_spec -file scripts/ccopt.tcl
ccopt_check_and_flatten_ilms_no_restore
create_ccopt_clock_tree -name Clk_clk -source Clk_CI -no_skew_group
set_ccopt_property target_max_trans_sdc -delay_corner dc_max -early -clock_tree Clk_clk 0.200
set_ccopt_property target_max_trans_sdc -delay_corner dc_max -late -clock_tree Clk_clk 0.200
set_ccopt_property target_max_trans_sdc -delay_corner dc_typ -early -clock_tree Clk_clk 0.200
set_ccopt_property target_max_trans_sdc -delay_corner dc_typ -late -clock_tree Clk_clk 0.200
set_ccopt_property source_driver -clock_tree Clk_clk {INVX4/INP INVX4/ZN}
set_ccopt_property clock_period -pin Clk_CI 80
create_ccopt_skew_group -name Clk_clk/func_mode -sources Clk_CI -auto_sinks
set_ccopt_property include_source_latency -skew_group Clk_clk/func_mode true
set_ccopt_property extracted_from_clock_name -skew_group Clk_clk/func_mode Clk_clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group Clk_clk/func_mode func_mode
set_ccopt_property extracted_from_delay_corners -skew_group Clk_clk/func_mode {dc_max dc_typ}
create_ccopt_skew_group -name Clk_clk/test_mode -sources Clk_CI -auto_sinks
set_ccopt_property include_source_latency -skew_group Clk_clk/test_mode true
set_ccopt_property extracted_from_clock_name -skew_group Clk_clk/test_mode Clk_clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group Clk_clk/test_mode test_mode
set_ccopt_property extracted_from_delay_corners -skew_group Clk_clk/test_mode dc_max
create_ccopt_skew_group -name Clk_clk/hold_mode -sources Clk_CI -auto_sinks
set_ccopt_property include_source_latency -skew_group Clk_clk/hold_mode true
set_ccopt_property extracted_from_clock_name -skew_group Clk_clk/hold_mode Clk_clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group Clk_clk/hold_mode hold_mode
set_ccopt_property extracted_from_delay_corners -skew_group Clk_clk/hold_mode {dc_min dc_typ dc_max}
check_ccopt_clock_tree_convergence
get_ccopt_property auto_design_state_for_ilms
ccopt_design -outDir reports/02_timedesign_ccopt
report_ccopt_clock_trees -filename reports/clock_trees.rpt
report_ccopt_skew_groups -filename reports/skew_groups.rpt
timeDesign -postCTS -expandedViews -outDir reports/03_timedesign_postcts
timeDesign -hold -postCTS -expandedViews -outDir reports/03_timedesign_postcts
optDesign -postCTS -hold
optDesign -postCTS -hold
timeDesign -postCTS -expandedViews -outDir reports/04_timedesign_postctsOpt
timeDesign -hold -postCTS -expandedViews -outDir reports/04_timedesign_postctsOpt
saveDesign save/NYQ_cts.enc
addFiller -cell {SHFILL128 SHFILL64 SHFILL3 SHFILL2 SHFILL1} -prefix FILLCORE
setNanoRouteMode -routeBottomRoutingLayer 2
setNanoRouteMode -routeTopRoutingLayer 9
setNanoRouteMode -routeAntennaCellName ANTENNA
setNanoRouteMode -quiet -routeInsertAntennaDiode true
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
setNanoRouteMode -quiet -routeWithViaInPin false
routeDesign -globalDetail
deleteFiller -prefix FILLCORE
setExtractRCMode -engine postRoute
setExtractRCMode -effortLevel low
setDelayCalMode -siAware false
saveDesign save/NYQ_route.enc
update_constraint_mode -name func_mode \
                       -sdc_files [list src/constraints/constraints_mode0.sdc \
                                        src/constraints/latencies_mode0_postroute.sdc \
                                  ]
update_constraint_mode -name hold_mode \
                       -sdc_files [list src/constraints/constraints_modeH.sdc \
                                        src/constraints/latencies_mode0_postroute.sdc \
                                  ]
update_constraint_mode -name test_mode \
                       -sdc_files [list src/constraints/constraints_modeT.sdc \
                                        src/constraints/latencies_mode0_postroute.sdc \
                                  ]                                                                                                      
set_analysis_view -update_timing
timeDesign -postRoute -expandedViews -outDir reports/05_timedesign_postroute
timeDesign -postRoute -hold -expandedViews -outDir reports/05_timedesign_postroute
optDesign -postRoute -setup -hold
optDesign -postRoute -hold
setNanoRouteMode -quiet -routeWithTimingDriven false
checkRoute
addFiller -cell {SHFILL128 SHFILL64 SHFILL3 SHFILL2 SHFILL1} -prefix FILLCORE
ecoRoute -target
checkFiller
timeDesign -postRoute -expandedViews -outDir reports/06_timedesign_postrouteOpt
timeDesign -postRoute -hold -expandedViews -outDir reports/06_timedesign_postrouteOpt
verify_drc -limit 100000
setNanoRouteMode -reset
setNanoRouteMode -routeWithECO true
setNanoRouteMode -drouteFixAntenna true
setNanoRouteMode -routeAntennaCellName ANTENNA
globalDetailRoute
verify_drc -limit 100000
ecoRoute -fix_drc
saveDesign save/NYQ_fixdrc.enc
setNanoRouteMode -droutePostRouteSpreadWire true
routeDesign -wireOpt
verify_drc -limit 100000
setNanoRouteMode -droutePostRouteSpreadWire true
routeDesign -wireOpt
saveDesign save/NYQ_postRouteOpt.enc
timeDesign -postRoute -expandedViews -outDir reports/07_timedesign_final
timeDesign -postRoute -hold -expandedViews -outDir reports/07_timedesign_final
deleteEmptyModule
update_constraint_mode -name func_mode \
                       -sdc_files [list src/constraints/constraints_mode0.sdc \
                                        src/constraints/latencies_mode0_signoff.sdc \
                                  ]
update_constraint_mode -name hold_mode \
                       -sdc_files [list src/constraints/constraints_modeH.sdc \
                                        src/constraints/latencies_mode0_signoff.sdc \
                                  ]
update_constraint_mode -name test_mode \
                       -sdc_files [list src/constraints/constraints_modeT.sdc \
                                        src/constraints/latencies_mode0_signoff.sdc \
                                  ]                                                                                                      
set_analysis_view -update_timing
timeDesign -postRoute -expandedViews -outDir reports/08_timedesign_final
timeDesign -postRoute -hold -expandedViews -outDir reports/08_timedesign_final
write_lef_abstract out/NYQ.lef -stripePin
set_global timing_recompute_sdf_in_setuphold_mode true
all_hold_analysis_views
all_setup_analysis_views
all_setup_analysis_views
write_sdf -precision 4 -min_period_edges posedge -recompute_parallel_arcs -nonegchecks \
          -min_view [lindex [all_hold_analysis_views]  0] \
          -typ_view [lindex [all_setup_analysis_views]  0] \
          -max_view [lindex [all_setup_analysis_views]  0] \
          out/${DESIGNNAME}.sdf.gz
saveNetlist out/NYQ.v -excludeLeafCell
saveDesign save/NYQ_final.enc
gui_select -rect {2192.460 390.766 2563.862 410.612}
gui_select -rect {-21.779 799.025 295.756 816.036}
gui_select -rect {335.448 1649.565 766.388 1658.071}
deselectAll
panPage -1 0
panPage 0 -1
panPage 0 1
zoomIn
zoomIn
zoomIn
zoomIn
zoomIn
