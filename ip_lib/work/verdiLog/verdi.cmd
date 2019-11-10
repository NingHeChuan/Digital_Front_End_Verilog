verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -2 "25" "1920" "1004"
verdiSetPrefEnv -bDisplayWelcome "off"
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -2 "25" "1920" "1004"
debImport "-f" "/home/IC/Digital_Front_End_Verilog/ip_lib/vc/ram.f" -path \
          {/home/IC/Digital_Front_End_Verilog/ip_lib/vc}
wvCreateWindow
verdiDockWidgetMaximize -dock windowDock_nWave_2
verdiDockWidgetRestore -dock windowDock_nWave_2
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvConvertFile -win $_nWave2 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump.fsdb}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 0 28 1916 182
wvResizeWindow -win $_nWave2 -2 25 1920 1004
srcHBSelect "tb_ram.u_sram" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_ram.u_sram" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {10 17 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvResizeWindow -win $_nWave2 -2 25 1920 1004
wvSetCursor -win $_nWave2 444.120144 -snap {("G1" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 2061.019856 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1010.303851 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 1576.074007 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 2343.904934 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 3885.339952 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 3059.777377 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1778.134777 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 3625.547533 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 5149.663057 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 4526.161252 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 3377.301444 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 1962.876053 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 2291.946450 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1512.569194 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 2378.543923 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 2759.572804 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 1662.671480 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 2898.128761 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 5773.164862 -snap {("G1" 5)}
srcHBSelect "tb_ram.u_dp_sram" -win $_nTrace1
srcHBSelect "tb_ram.u_dp_sram" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_ram.u_dp_sram" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 21 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {11 21 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 13 14 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetCursor -win $_nWave2 1310.508424 -snap {("G2" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1212.364621 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetCursor -win $_nWave2 2395.863418 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 288.658243 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 127.009627 -snap {("G2" 5)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 184.741276 -snap {("G2" 8)}
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_ram.u_ture_dp_sram" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_ram.u_ture_dp_sram" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {10 25 1 1 1 1} -backward
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSelectGroup -win $_nWave2 {G3}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 8)}
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 1229.684116 -snap {("G2" 12)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3706.371841 -snap {("G2" 12)}
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 21 )} 
wvSetCursor -win $_nWave2 3523.916968 -snap {("G2" 17)}
wvSetCursor -win $_nWave2 2700.812274 -snap {("G2" 14)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 1772.361613
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvResizeWindow -win $_nWave2 -2 25 1920 1004
wvResizeWindow -win $_nWave2 -2 25 1920 1004
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 19 20 21 )} \
           
wvSelectSignal -win $_nWave2 {( "G2" 15 16 17 18 19 20 21 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 10 11 12 13 14 15 16 17 18 19 20 21 )} \
           
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetCursor -win $_nWave2 611.994352 -snap {("G3" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectGroup -win $_nWave2 {G3}
wvSetCursor -win $_nWave2 75.055911 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 1703.191830 -snap {("G3" 7)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvConvertFile -win $_nWave2 -o \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump.fsdb" \
           "/home/IC/Digital_Front_End_Verilog/ip_lib/work/tb_ram.dump"
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetCursor -win $_nWave2 1679.560872 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 2719.842520 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 4190.184737 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 2748.900666 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 5358.322229 -snap {("G3" 9)}
wvSetCursor -win $_nWave2 5329.264082 -snap {("G3" 9)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} {( "G3" 10 11 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 5305.916869 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 5298.724258 -snap {("G3" 9)}
wvSetCursor -win $_nWave2 5305.197608 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 5299.443519 -snap {("G3" 9)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSetCursor -win $_nWave2 2708.219261 -snap {("G3" 8)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSetCursor -win $_nWave2 7932.874016 -snap {("G3" 12)}
wvSetCursor -win $_nWave2 7886.380981 -snap {("G3" 10)}
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
