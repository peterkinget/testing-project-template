v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -420 210 -420 240 {lab=GND}
N -420 100 -420 150 {lab=vssa}
N -420 -20 -420 40 {lab=vdda}
N -70 90 -10 90 {lab=A1}
N -70 130 -10 130 {lab=A2}
N 210 110 290 110 {lab=out}
N -70 205 -10 205 {lab=vdda}
N -70 235 -10 235 {lab=vdda}
N -70 290 -10 290 {lab=vssa}
N -70 265 -10 265 {lab=vssa}
N -280 100 -280 215 {lab=vssa}
N -280 215 -230 215 {lab=vssa}
N -230 190 -230 215 {lab=vssa}
N -230 130 -70 130 {lab=A2}
N -280 40 -70 40 {lab=A1}
N -70 40 -70 90 {lab=A1}
C {devices/vsource.sym} -420 180 0 0 {name=V1 value=0 savecurrent=false}
C {devices/gnd.sym} -420 240 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -420 70 0 0 {name=V2 value=3.3 savecurrent=false}
C {devices/lab_wire.sym} -420 130 0 0 {name=p2 sig_type=std_logic lab=vssa}
C {devices/lab_wire.sym} -420 10 0 0 {name=p3 sig_type=std_logic lab=vdda}
C {devices/code_shown.sym} -740 120 0 0 {name=Simulation only_toplevel=false value="
.control
save all

OP
*show all > op.log
show all

* DC V3 0 3.3 0.01
TRAN 0.1n 1u
write nand.raw
plot A1 A2 out
.endc
"}
C {devices/code_shown.sym} -740 -130 0 0 {name=Models only_toplevel=false
format="tcleval( @value )"
value="
.include /foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/spice/gf180mcu_fd_sc_mcu9t5v0.spice
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 270 110 0 0 {name=p6 sig_type=std_logic lab=out}
C {libs/gf180mcu_fd_sc_mcu9t5v0_symbols/nand2_1.sym} 5 300 0 0 {name=x1 prefix1=gf180mcu_fd_sc_mcu prefix2=9t5v0}
C {lab_wire.sym} -50 205 0 0 {name=p9 sig_type=std_logic lab=vdda}
C {lab_wire.sym} -50 235 0 0 {name=p10 sig_type=std_logic lab=vdda}
C {lab_wire.sym} -50 290 0 0 {name=p11 sig_type=std_logic lab=vssa}
C {lab_wire.sym} -50 265 0 0 {name=p12 sig_type=std_logic lab=vssa}
C {devices/vsource.sym} -280 70 0 0 {name=VDATA value="pulse 0 3.3 0 0.2n 0.2n 100n 200n"}
C {devices/vsource.sym} -230 160 0 0 {name=VDATA1 value="pulse 0 3.3 0 0.2n 0.2n 200n 400n"}
C {devices/lab_wire.sym} -245 215 0 0 {name=p1 sig_type=std_logic lab=vssa}
C {devices/lab_wire.sym} -160 40 0 0 {name=p4 sig_type=std_logic lab=A1}
C {devices/lab_wire.sym} -125 130 0 0 {name=p5 sig_type=std_logic lab=A2}
