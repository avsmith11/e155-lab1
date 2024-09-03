-L work
-reflib pmi_work
-reflib ovi_ice40up


"C:/Users/oaksh/Desktop/E155/lab1/fpga/src/lab1_as.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top lab1_as
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run 100 ns"
