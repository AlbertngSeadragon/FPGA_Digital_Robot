set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property PACKAGE_PIN Y9 [get_ports {clk}]
create_clock -period 10 [get_ports clk]

#------
# Adrunio Receive Data JC1 - JC2
#-----
#set_property PACKAGE_PIN AB7 [get_ports fromArduinoData}];
#set_property IOSTANDARD LVCMOS33 [get_ports fromArduinoData];
set_property PACKAGE_PIN AA4 [get_ports {fromArduinoData[3]}];
set_property PACKAGE_PIN Y4 [get_ports {fromArduinoData[2]}];
set_property PACKAGE_PIN AB6 [get_ports {fromArduinoData[1]}];
set_property PACKAGE_PIN AB7 [get_ports {fromArduinoData[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports fromArduinoData];

#------
# JetsonNano Receive Data JC3 - JC4
#-----
set_property PACKAGE_PIN U4 [get_ports {fromJetsonNanoData[3]}];
set_property PACKAGE_PIN T4 [get_ports {fromJetsonNanoData[2]}];
set_property PACKAGE_PIN T6 [get_ports {fromJetsonNanoData[1]}];
set_property PACKAGE_PIN R6 [get_ports {fromJetsonNanoData[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports fromJetsonNanoData];

#------
# TO Adrunio Nano Data JE1
#-----
set_property PACKAGE_PIN U6 [get_ports {toArduinoNanoData}];
set_property IOSTANDARD LVCMOS33 [get_ports toArduinoNanoData];

# ----------------------------------------------------------------------------
# VGA Output - Bank 33
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN Y21  [get_ports {blue[0]}];  # "VGA-B0"
set_property PACKAGE_PIN Y20  [get_ports {blue[1]}];  # "VGA-B1"
set_property PACKAGE_PIN AB20 [get_ports {blue[2]}];  # "VGA-B2"
set_property PACKAGE_PIN AB19 [get_ports {blue[3]}];  # "VGA-B3"
set_property PACKAGE_PIN AB22 [get_ports {green[0]}];  # "VGA-G0"
set_property PACKAGE_PIN AA22 [get_ports {green[1]}];  # "VGA-G1"
set_property PACKAGE_PIN AB21 [get_ports {green[2]}];  # "VGA-G2"
set_property PACKAGE_PIN AA21 [get_ports {green[3]}];  # "VGA-G3"
set_property PACKAGE_PIN V20  [get_ports {red[0]}];  # "VGA-R0"
set_property PACKAGE_PIN U20  [get_ports {red[1]}];  # "VGA-R1"
set_property PACKAGE_PIN V19  [get_ports {red[2]}];  # "VGA-R2"
set_property PACKAGE_PIN V18  [get_ports {red[3]}];  # "VGA-R3"
set_property PACKAGE_PIN AA19 [get_ports {hsync}];  # "VGA-HS"
set_property PACKAGE_PIN Y19  [get_ports {vsync}];  # "VGA-VS"
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];


#------
# SSD Data JA1 - JB1 Below
#-----
# Light and ssd
# TODO: Step 4 - Complete the constraint file for pmod ssd
set_property PACKAGE_PIN AB11 [get_ports {ssd[6]}];
set_property PACKAGE_PIN AB10 [get_ports {ssd[5]}];
set_property PACKAGE_PIN AB9 [get_ports {ssd[4]}];
set_property PACKAGE_PIN AA8 [get_ports {ssd[3]}];
set_property PACKAGE_PIN V12 [get_ports {ssd[2]}];
set_property PACKAGE_PIN W10 [get_ports {ssd[1]}];
set_property PACKAGE_PIN V9 [get_ports {ssd[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports ssd];
#Digit Select (sel)
set_property IOSTANDARD LVCMOS33 [get_ports sel]
set_property PACKAGE_PIN V8 [get_ports sel]

#TODO: Step 7 - Complete the constraint file for pmod als
set_property PACKAGE_PIN V7 [get_ports {cs}];
set_property IOSTANDARD LVCMOS33 [get_ports cs];

set_property PACKAGE_PIN W6 [get_ports {mosi}];
set_property IOSTANDARD LVCMOS33 [get_ports mosi];

set_property PACKAGE_PIN V5 [get_ports {miso}];
set_property IOSTANDARD LVCMOS33 [get_ports miso];

set_property PACKAGE_PIN V4 [get_ports {sclk}];
set_property IOSTANDARD LVCMOS33 [get_ports sclk];

# Do not need to modify below
set_property PACKAGE_PIN F22 [get_ports {switch[0]}];
set_property PACKAGE_PIN G22 [get_ports {switch[1]}];
set_property PACKAGE_PIN H22 [get_ports {switch[2]}];
set_property PACKAGE_PIN F21 [get_ports {switch[3]}];
set_property PACKAGE_PIN H19 [get_ports {switch[4]}];
set_property PACKAGE_PIN H18 [get_ports {switch[5]}];
set_property PACKAGE_PIN H17 [get_ports {switch[6]}];
set_property PACKAGE_PIN M15 [get_ports {switch[7]}];
set_property IOSTANDARD LVCMOS33 [get_ports switch];