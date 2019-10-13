verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -2 "25" "1366" "692"
verdiDockWidgetHide -dock widgetDock_WelcomePage
verdiWindowResize -win $_Verdi_1 -2 "25" "1366" "692"
debImport "-f" "/home/IC/ic_study/ip_lib/vc/complex_mult.f" -path \
          {/home/IC/ic_study/ip_lib/vc}
debReload
srcHBSelect "tb_complex_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult" -delim "."
simSetDumpUnfinshTrans off
simSetInteractiveFsdbFile inter.fsdb
simSetSimMode on
srcSetPreference -font "Courier 14"
wvCreateWindow
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 0 28 1362 182
wvResizeWindow -win $_nWave3 -2 25 1366 692
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb}
srcHBSelect "tb_complex_mult.u_complex_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult.u_complex_mult" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {41 44 3 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {41 44 3 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave3 167.720170 -snap {("G1" 5)}
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvResizeWindow -win $_nWave3 0 25 1366 692
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "suba\[SUBA_WIDTH - 1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUBA_WIDTH" -win $_nTrace1
srcTraceDriver "tb_complex_mult.u_complex_mult.SUBA_WIDTH" -win $_nTrace1
nsMsgSwitchTab -tab trace
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUBA_WIDTH" -win $_nTrace1
srcAction -pos 42 2 8 -win $_nTrace1 -name "suba\[SUBA_WIDTH - 1:0\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUBA_WIDTH" -win $_nTrace1
srcAction -pos 42 2 10 -win $_nTrace1 -name "suba\[SUBA_WIDTH - 1:0\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUBA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "product_b" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_complex_mult.u_complex_mult.u0_signed_mult" -win $_nTrace1
srcHBSelect "tb_complex_mult.u_complex_mult" -win $_nTrace1
srcHBSelect "tb_complex_mult.u_complex_mult" -win $_nTrace1
srcHBSelect "tb_complex_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult" -delim "."
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvUnknownSaveResult -win $_nWave3 -clear
wvSelectSignal -win $_nWave3 {( "G1" 2 )} 
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvSelectGroup -win $_nWave3 {G2}
srcDeselectAll -win $_nTrace1
debReload
srcHBSelect "tb_complex_mult.u_complex_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult.u_complex_mult" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave3 223.545656 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 21 3 1 6 1} -backward
srcDeselectAll -win $_nTrace1
srcSelect -signal "PRODUCT_A_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {23 29 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {33 44 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvResizeWindow -win $_nWave3 0 25 1366 692
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G3" 0)}
wvSetPosition -win $_nWave3 {("G2" 16)}
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G3" 0)}
wvSetPosition -win $_nWave3 {("G2" 16)}
wvSelectGroup -win $_nWave3 {G1}
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSetCursor -win $_nWave3 33.463393 -snap {("G2" 5)}
wvZoom -win $_nWave3 0.000000 283.819151
wvSetCursor -win $_nWave3 33.624097 -snap {("G2" 7)}
wvSetCursor -win $_nWave3 13.502590 -snap {("G2" 8)}
wvSetCursor -win $_nWave3 29.123234 -snap {("G2" 10)}
wvSetCursor -win $_nWave3 29.387990 -snap {("G2" 13)}
wvSetCursor -win $_nWave3 29.123234 -snap {("G2" 7)}
wvSetCursor -win $_nWave3 75.455651 -snap {("G2" 6)}
wvSetCursor -win $_nWave3 75.455651 -snap {("G2" 2)}
wvSetCursor -win $_nWave3 77.044191 -snap {("G2" 5)}
wvSelectSignal -win $_nWave3 {( "G2" 5 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 5 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 8 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 8 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 13 )} 
wvSelectSignal -win $_nWave3 {( "G2" 13 14 )} 
wvSelectSignal -win $_nWave3 {( "G2" 13 14 15 )} 
wvSelectSignal -win $_nWave3 {( "G2" 13 14 15 16 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 12)}
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 3 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 3 4 )} 
wvSelectSignal -win $_nWave3 {( "G2" 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 4 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 3 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 3 4 )} 
wvSelectSignal -win $_nWave3 {( "G2" 3 4 5 )} 
wvSelectSignal -win $_nWave3 {( "G2" 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 3 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 3 4 )} 
wvSetPosition -win $_nWave3 {("G2" 3)}
wvSetPosition -win $_nWave3 {("G2" 5)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 7)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 5)}
wvSetPosition -win $_nWave3 {("G2" 4)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 4)}
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 2)}
wvSetPosition -win $_nWave3 {("G2" 3)}
wvSetPosition -win $_nWave3 {("G2" 4)}
wvSetPosition -win $_nWave3 {("G2" 5)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 7)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 5)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 7)}
wvSetPosition -win $_nWave3 {("G2" 8)}
wvSetPosition -win $_nWave3 {("G2" 7)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 5)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetCursor -win $_nWave3 82.339325 -snap {("G2" 10)}
wvSetCursor -win $_nWave3 72.808084 -snap {("G2" 4)}
wvSelectSignal -win $_nWave3 {( "G2" 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 5 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSetCursor -win $_nWave3 79.956515 -snap {("G2" 9)}
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
wvSelectAll -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSetCursor -win $_nWave3 74.926138 -snap {("G2" 9)}
wvSetCursor -win $_nWave3 77.308948 -snap {("G2" 9)}
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectAll -win $_nWave3
wvSelectGroup -win $_nWave3 {G3}
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "suba\[SUBA_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dinb_q\[DINB_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dinb_q\[DINB_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "suba\[SUBA_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dinb_q\[DINB_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "product_c\[PRODUCT_C_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "product_c\[PRODUCT_C_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "product_c\[PRODUCT_C_WIDTH-1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 76.249921 -snap {("G2" 2)}
wvSetCursor -win $_nWave3 74.661381 -snap {("G2" 2)}
wvSetCursor -win $_nWave3 65.394898 -snap {("G2" 2)}
wvSetCursor -win $_nWave3 73.072841 -snap {("G2" 2)}
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
debReload
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectSignal -win $_nWave3 {( "G2" 2 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectSignal -win $_nWave3 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave3 {("G2" 2)}
wvSetPosition -win $_nWave3 {("G2" 3)}
wvSetPosition -win $_nWave3 {("G2" 4)}
wvSetPosition -win $_nWave3 {("G2" 5)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 7)}
wvSetPosition -win $_nWave3 {("G2" 8)}
wvSetPosition -win $_nWave3 {("G2" 9)}
wvSetPosition -win $_nWave3 {("G2" 10)}
wvSetPosition -win $_nWave3 {("G2" 11)}
wvSetPosition -win $_nWave3 {("G2" 12)}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvSetPosition -win $_nWave3 {("G2" 12)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 12)}
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSetCursor -win $_nWave3 65.924411 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
debReload
wvSetCursor -win $_nWave3 35.742151 -snap {("G2" 11)}
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSelectAll -win $_nWave3
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {23 29 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {34 40 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvResizeWindow -win $_nWave3 0 25 1366 692
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectSignal -win $_nWave3 {( "G2" 11 )} 
wvZoom -win $_nWave3 46.609539 59.321231
wvSetCursor -win $_nWave3 49.965522 -snap {("G2" 10)}
wvZoom -win $_nWave3 49.844803 50.448397
wvSetCursor -win $_nWave3 50.238915 -snap {("G3" 0)}
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
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave3 57.264957 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G2" 8 )} 
srcHBSelect "tb_complex_mult.u_complex_mult.u0_signed_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult.u_complex_mult.u0_signed_mult" -delim \
           "."
srcHBSelect "tb_complex_mult.u_complex_mult.u2_signed_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult.u_complex_mult.u2_signed_mult" -delim \
           "."
srcHBSelect "tb_complex_mult.u_complex_mult.u2_signed_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult.u_complex_mult.u2_signed_mult" -delim \
           "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {12 16 2 1 2 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {16 17 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {16 17 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave3 {( "G2" 13 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 13 14 )} 
wvSelectSignal -win $_nWave3 {( "G2" 13 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSetPosition -win $_nWave3 {("G2" 12)}
wvSetPosition -win $_nWave3 {("G2" 13)}
wvSetPosition -win $_nWave3 {("G2" 14)}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvSetPosition -win $_nWave3 {("G2" 14)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 14)}
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 13 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 13 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 13 )} 
wvSelectSignal -win $_nWave3 {( "G2" 12 13 14 )} 
wvSetPosition -win $_nWave3 {("G2" 13)}
wvSetPosition -win $_nWave3 {("G2" 14)}
wvSetPosition -win $_nWave3 {("G2" 13)}
wvSetPosition -win $_nWave3 {("G2" 12)}
wvSetPosition -win $_nWave3 {("G2" 11)}
wvSetPosition -win $_nWave3 {("G2" 10)}
wvSetPosition -win $_nWave3 {("G2" 9)}
wvSetPosition -win $_nWave3 {("G2" 8)}
wvSetPosition -win $_nWave3 {("G2" 9)}
wvSetPosition -win $_nWave3 {("G2" 10)}
wvSetPosition -win $_nWave3 {("G2" 11)}
wvSetPosition -win $_nWave3 {("G2" 12)}
wvSetPosition -win $_nWave3 {("G2" 13)}
wvSetPosition -win $_nWave3 {("G2" 14)}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G3" 3)}
wvSetPosition -win $_nWave3 {("G3" 3)}
wvSetCursor -win $_nWave3 39.316239 -snap {("G3" 2)}
wvSetCursor -win $_nWave3 99.145299 -snap {("G3" 1)}
wvSelectSignal -win $_nWave3 {( "G3" 1 )} 
wvSelectSignal -win $_nWave3 {( "G3" 2 )} 
wvSelectSignal -win $_nWave3 {( "G3" 2 )} 
wvSetCursor -win $_nWave3 134.615385 -snap {("G3" 2)}
wvSelectSignal -win $_nWave3 {( "G3" 3 )} 
wvSelectSignal -win $_nWave3 {( "G3" 2 )} 
wvSelectSignal -win $_nWave3 {( "G3" 1 )} 
wvSelectSignal -win $_nWave3 {( "G3" 3 )} 
srcHBSelect "tb_complex_mult.u_complex_mult.u1_signed_mult" -win $_nTrace1
srcHBSelect "tb_complex_mult.u_complex_mult.u2_signed_mult" -win $_nTrace1
srcHBSelect "tb_complex_mult.u_complex_mult.u1_signed_mult" -win $_nTrace1
srcHBSelect "tb_complex_mult.u_complex_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult.u_complex_mult" -delim "."
srcHBSelect "tb_complex_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult" -delim "."
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "546"
wvResizeWindow -win $_nWave3 0 25 1366 546
verdiWindowResize -win $_Verdi_1 "0" "25" "1280" "580"
wvResizeWindow -win $_nWave3 0 25 1280 580
verdiWindowResize -win $_Verdi_1 "0" "25" "1280" "530"
wvResizeWindow -win $_nWave3 0 25 1280 530
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "546"
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "530"
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "546"
wvResizeWindow -win $_nWave3 0 25 1366 546
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "692"
wvResizeWindow -win $_nWave3 0 25 1366 692
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 5.128205 -snap {("G2" 6)}
wvSelectSignal -win $_nWave3 {( "G2" 5 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 9 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 4 )} 
wvSelectSignal -win $_nWave3 {( "G2" 10 )} 
wvSelectGroup -win $_nWave3 {G3}
wvSelectGroup -win $_nWave3 {G3}
wvSelectSignal -win $_nWave3 {( "G3" 1 )} 
wvSelectSignal -win $_nWave3 {( "G3" 2 )} 
wvSelectSignal -win $_nWave3 {( "G3" 3 )} 
wvSelectSignal -win $_nWave3 {( "G3" 2 )} 
wvSetCursor -win $_nWave3 17.094017 -snap {("G4" 0)}
srcHBSelect "tb_complex_mult.u_complex_mult" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_complex_mult.u_complex_mult" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINB_WIDTH" -win $_nTrace1
srcAction -pos 8 2 5 -win $_nTrace1 -name "DINB_WIDTH" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINB_WIDTH" -win $_nTrace1
srcAction -pos 8 2 5 -win $_nTrace1 -name "DINB_WIDTH" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINB_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINA_WIDTH" -win $_nTrace1
srcAction -pos 7 2 5 -win $_nTrace1 -name "DINA_WIDTH" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINB_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMB_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMB_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINB_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINB_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUMB_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUBA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DINA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "SUBA_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "MULT_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "MID_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "MULT_WIDTH" -win $_nTrace1
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "sumb\[SUMB_WIDTH - 1:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sumb\[SUMB_WIDTH - 1:0\]" -win $_nTrace1
srcAction -pos 40 2 1 -win $_nTrace1 -name "sumb\[SUMB_WIDTH - 1:0\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sumb\[SUMB_WIDTH - 1:0\]" -win $_nTrace1
srcAction -pos 40 2 2 -win $_nTrace1 -name "sumb\[SUMB_WIDTH - 1:0\]" -ctrlKey \
          off
srcTraceLoad "tb_complex_mult.u_complex_mult.sumb\[8:0\]" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "C_WIDTH" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "multb" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "multa" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "product" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "product_a" -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "546"
wvResizeWindow -win $_nWave3 0 25 1366 546
verdiWindowResize -win $_Verdi_1 "0" "25" "1280" "530"
wvResizeWindow -win $_nWave3 0 25 1280 530
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "546"
wvResizeWindow -win $_nWave3 0 25 1366 546
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "692"
wvResizeWindow -win $_nWave3 0 25 1366 692
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvConvertFile -win $_nWave3 -o \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump.fsdb" \
           "/home/IC/ic_study/ip_lib/work/tb_complex_mult.dump"
wvReloadFile -win $_nWave3
wvUnknownSaveResult -win $_nWave3 -clear
wvSelectSignal -win $_nWave3 {( "G2" 7 )} 
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
verdiWindowResize -win $_Verdi_1 "0" "25" "1280" "530"
wvResizeWindow -win $_nWave3 0 25 1280 530
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "546"
wvResizeWindow -win $_nWave3 0 25 1366 546
verdiWindowResize -win $_Verdi_1 "0" "25" "1280" "530"
wvResizeWindow -win $_nWave3 0 25 1280 530
verdiWindowResize -win $_Verdi_1 "0" "25" "1366" "692"
wvResizeWindow -win $_nWave3 0 25 1366 692
wvTpfCloseForm -win $_nWave3
wvGetSignalClose -win $_nWave3
wvCloseWindow -win $_nWave3
