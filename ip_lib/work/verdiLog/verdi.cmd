verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiSetPrefEnv -bDisplayWelcome "off"
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -2 "25" "1920" "1004"
wvCreateWindow
wvCloseWindow -win $_nWave2
debImport "-f" "/home/IC/Digital_Front_End_Verilog/ip_lib/vc/dds.f" -path \
          {/home/IC/Digital_Front_End_Verilog/ip_lib/vc}
srcHBSelect "tb_dds_top.u_dds_top" -win $_nTrace1
wvCreateWindow
verdiDockWidgetFix -dock windowDock_nWave_3
verdiDockWidgetUnfix -dock windowDock_nWave_3
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 0 28 1916 368
wvResizeWindow -win $_nWave3 -2 25 1920 1004
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump.fsdb}
srcHBSelect "tb_dds_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_dds_top" -delim "."
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_dds_top.u_dds_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_dds_top.u_dds_top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 17 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {13 17 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 16 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 17 1 1 1 1} -backward
wvSetCursor -win $_nWave3 112.250156
wvSetCursor -win $_nWave3 111.653080
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
srcDeselectAll -win $_nTrace1
wvConvertFile -win $_nWave3 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump"
wvOpenFile -win $_nWave3 \
           {/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump.fsdb}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {11 17 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvSelectGroup -win $_nWave3 {G1}
wvSetCursor -win $_nWave3 4336.924393
wvSetCursor -win $_nWave3 3562.500000
wvSelectGroup -win $_nWave3 {G1}
wvSelectGroup -win $_nWave3 {G1}
wvSelectGroup -win $_nWave3 {G1}
wvSelectGroup -win $_nWave3 {G1}
wvSelectGroup -win $_nWave3 {G1}
wvSetCursor -win $_nWave3 3970.402925
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 18 2 1 7 1}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvTpfCloseForm -win $_nWave3
wvGetSignalClose -win $_nWave3
wvCloseWindow -win $_nWave3
wvCreateWindow
verdiWindowBeWindow -win $_nWave4
wvResizeWindow -win $_nWave4 0 28 1916 368
wvResizeWindow -win $_nWave4 -2 25 1920 1004
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/tb_ram"
wvSetPosition -win $_nWave4 {("G1" 4)}
wvSetPosition -win $_nWave4 {("G1" 4)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_ram/csen_n} \
{/tb_ram/dina\[7:0\]} \
{/tb_ram/dinb\[7:0\]} \
{/tb_ram/douta\[7:0\]} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave4 {("G1" 4)}
wvGetSignalClose -win $_nWave4
wvSetCursor -win $_nWave4 229.192308 -snap {("G2" 0)}
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvSetCursor -win $_nWave4 1309.670330 -snap {("G1" 4)}
wvResizeWindow -win $_nWave4 -2 25 1920 1004
wvTpfCloseForm -win $_nWave4
wvGetSignalClose -win $_nWave4
wvCloseWindow -win $_nWave4
wvCreateWindow
verdiWindowBeWindow -win $_nWave5
wvResizeWindow -win $_nWave5 0 28 1916 368
wvResizeWindow -win $_nWave5 -2 25 1920 1004
wvGetSignalOpen -win $_nWave5
wvGetSignalSetScope -win $_nWave5 "/tb_ram"
wvConvertFile -win $_nWave5 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvOpenFile -win $_nWave5 \
           {/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 18 1 1 1 1} -backward
srcHBSelect "tb_dds_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_dds_top" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 14 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvResizeWindow -win $_nWave5 -2 25 1920 1004
wvSetCursor -win $_nWave5 5959131.815835 -snap {("G1" 2)}
wvSetCursor -win $_nWave5 17468435.420928 -snap {("G1" 2)}
wvSetCursor -win $_nWave5 46796711.612587 -snap {("G1" 2)}
wvSetCursor -win $_nWave5 49075203.189230 -snap {("G1" 4)}
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvDisplayGridCount -win $_nWave5 -off
wvGetSignalClose -win $_nWave5
wvReloadFile -win $_nWave5
wvSetCursor -win $_nWave5 4288.205279
wvUnknownSaveResult -win $_nWave5 -clear
wvSelectGroup -win $_nWave5 {G1}
wvSelectGroup -win $_nWave5 {G2}
wvSelectGroup -win $_nWave5 {G2}
wvCut -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 0)}
wvSelectGroup -win $_nWave5 {G1}
wvGetSignalOpen -win $_nWave5
wvGetSignalSetScope -win $_nWave5 "/tb_ram"
wvSetCursor -win $_nWave5 4282.577713
wvSetCursor -win $_nWave5 4462.659824
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 14 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvTpfCloseForm -win $_nWave5
wvGetSignalClose -win $_nWave5
wvCloseWindow -win $_nWave5
wvCreateWindow
verdiWindowBeWindow -win $_nWave6
wvResizeWindow -win $_nWave6 0 28 1916 368
wvResizeWindow -win $_nWave6 -2 25 1920 1004
wvGetSignalOpen -win $_nWave6
wvGetSignalSetScope -win $_nWave6 "/"
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvOpenFile -win $_nWave6 \
           {/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 14 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvResizeWindow -win $_nWave6 -2 25 1920 1004
wvSetCursor -win $_nWave6 20050895.787560 -snap {("G1" 2)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 11152224.634623 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvReloadFile -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 998658854.695259 -snap {("G1" 1)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 0.000000 36543983.326388
wvZoom -win $_nWave6 7249523.828940 13404779.910116
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_dds_top" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_dds_top" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_dds_top" -win $_nTrace1
srcAction -pos 26 0 4 -win $_nTrace1 -name "u_dds_top" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "addra" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvReloadFile -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomOut -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1" 5 6 )} 
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1" 5 6 )} 
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSetPosition -win $_nWave6 {("G1" 5)}
wvSetPosition -win $_nWave6 {("G2" 0)}
wvSetPosition -win $_nWave6 {("G1" 6)}
wvSetPosition -win $_nWave6 {("G2" 0)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G2" 1)}
wvSetPosition -win $_nWave6 {("G2" 1)}
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvReloadFile -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoom -win $_nWave6 0.000000 705683.206987
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvSelectGroup -win $_nWave6 {G2}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvSelectGroup -win $_nWave6 {G3}
wvSelectGroup -win $_nWave6 {G3}
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvBusWaveform -win $_nWave6 -analog {("G2" 1)}
wvSetPosition -win $_nWave6 {("G2" 1)}
wvSetCursor -win $_nWave6 141752.958609 -snap {("G2" 1)}
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvSetCursor -win $_nWave6 3024356.601372 -snap {("G3" 0)}
wvSetCursor -win $_nWave6 2350177.108983 -snap {("G3" 0)}
wvSelectGroup -win $_nWave6 {G1}
wvSelectGroup -win $_nWave6 {G1}
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvReloadFile -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomOut -win $_nWave6
wvResizeWindow -win $_nWave6 -2 25 1920 1004
wvResizeWindow -win $_nWave6 -2 25 1920 1004
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvReloadFile -win $_nWave6
wvZoom -win $_nWave6 7519983.517561 8018936.948737
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomIn -win $_nWave6
wvSetCursor -win $_nWave6 2648104.063995 -snap {("G2" 1)}
wvSetCursor -win $_nWave6 2443654.853172 -snap {("G2" 1)}
wvSetCursor -win $_nWave6 2482597.559995 -snap {("G2" 1)}
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvBusInvert -win $_nWave6 {("G2" 1)}
wvBusInvert -win $_nWave6 {("G2" 1)}
wvBusInvert -win $_nWave6 {("G2" 1)}
wvBusInvert -win $_nWave6 {("G2" 1)}
wvSetRadix -win $_nWave6 -format Bin {("G2" 1)}
wvSetRadix -win $_nWave6 -format Hex {("G2" 1)}
wvBusWaveform -win $_nWave6 -digital {("G2" 1)}
wvSetPosition -win $_nWave6 {("G2" 1)}
wvZoom -win $_nWave6 2521540.266819 2735725.154348
wvSetCursor -win $_nWave6 2621319.080277 -snap {("G2" 1)}
wvSetCursor -win $_nWave6 2621188.479735 -snap {("G2" 1)}
wvZoom -win $_nWave6 2617270.463500 2623278.088394
wvZoomOut -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSetRadix -win $_nWave6 -format UDec {("G1" 5)}
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvReloadFile -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G2" 1 )} 
wvBusWaveform -win $_nWave6 -analog {("G2" 1)}
wvSetPosition -win $_nWave6 {("G2" 1)}
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomOut -win $_nWave6
wvZoomIn -win $_nWave6
wvZoomIn -win $_nWave6
wvSetCursor -win $_nWave6 17876032.348577 -snap {("G3" 0)}
wvSelectSignal -win $_nWave6 {( "G1" 5 )} 
wvSelectSignal -win $_nWave6 {( "G1" 1 )} 
wvDisplayGridCount -win $_nWave6 -off
wvGetSignalClose -win $_nWave6
wvConvertFile -win $_nWave6 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_dds_top.dump"
wvReloadFile -win $_nWave6
