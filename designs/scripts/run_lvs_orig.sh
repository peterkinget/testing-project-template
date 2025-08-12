#!/bin/bash
#

echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null

#-------------------------------------------
# Extract layout for LVS from magic
#-------------------------------------------

echo PDK_ROOT is $PDK_ROOT
echo PDK is $PDK

magic -dnull -noconsole -rcfile $PDK_ROOT/$PDK/libs.tech/magic/$PDK.magicrc << EOF
gds read ShiftReg_row_10_2
load ShiftReg_row_10_2
select top cell
extract path extfiles
extract all
ext2spice lvs
ext2spice -p extfiles -o ShiftReg_row_10_2_layout.spice
quit -noprompt
EOF

#-------------------------------------------
# Run netgen for LVS
#-------------------------------------------

cat > run_lvs.tcl << EOF
# Tcl script to run LVS on ShiftReg_rwo_10_2

if {[catch {set PDK_ROOT \$::env(PDK_ROOT)}]} {set PDK_ROOT /usr/share/pdk}
if {[catch {set PDK \$::env(PDK)}]} {set PDK gf180mcuD}

set pdklib \${PDK_ROOT}/\${PDK}
set techlibs \${pdklib}/libs.tech
set reflibs \${pdklib}/libs.ref

set setupfile \${techlibs}/netgen/${PDK}_setup.tcl
set sclib \${reflibs}/gf180mcu_fd_sc_mcu9t5v0/spice/gf180mcu_fd_sc_mcu9t5v0.spice

set circuit1 [readnet spice ShiftReg_row_10_2_layout.spice]
set circuit2 [readnet spice \$sclib]

readnet spice ShiftReg_row_10_2.spice \$circuit2

lvs "\$circuit1 ShiftReg_row_10_2" "\$circuit2 ShiftReg_row_10_2" \
        \$setupfile ShiftReg_row_10_2_comp.out
EOF

netgen -batch source run_lvs.tcl | tee netgen.log

#-------------------------------------------
# Clean up
#-------------------------------------------

# rm -r extfiles
# rm run_lvs.tcl

echo "Done with LVS!"
exit 0

