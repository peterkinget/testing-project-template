v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 467.5 90 1643.75 1235 {flags=graph
y1=0
ypos1=2.0096028
ypos2=6.009603
divy=5
subdivy=1
unity=1
x1=0
x2=1.1e-06
divx=5
subdivx=1
ylabmag=0.5
dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=2.5
rainbow=0
autoload=1
digital=1
sim_type=tran
rawfile=$netlist_dir/tb_swmatrix.raw
color="4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 6 6 6 6 6 6"
node="clock_in
phi_1
phi_2
data_in
xswmatrix.xswmatrix_row[1].q[1]
xswmatrix.xswmatrix_row[1].q[2]
xswmatrix.xswmatrix_row[1].q[3]
xswmatrix.xswmatrix_row[1].q[4]
xswmatrix.xswmatrix_row[1].q[5]
xswmatrix.xswmatrix_row[1].q[6]
xswmatrix.xswmatrix_row[1].q[7]
xswmatrix.xswmatrix_row[1].q[8]
xswmatrix.xswmatrix_row[1].q[9]
xswmatrix.d_out_row[1]
xswmatrix.xswmatrix_row[5].q[1]
xswmatrix.xswmatrix_row[5].q[2]
xswmatrix.xswmatrix_row[5].q[3]
xswmatrix.xswmatrix_row[5].q[4]
xswmatrix.xswmatrix_row[5].q[5]
xswmatrix.xswmatrix_row[5].q[6]
xswmatrix.xswmatrix_row[5].q[7]
xswmatrix.xswmatrix_row[5].q[8]
xswmatrix.xswmatrix_row[5].q[9]
net1"
hilight_wave=22
xlabmag=0.5
mode=Line
y2=2.7
legend=0}
T {Testing a Shift Register with 10 registers
- clock and data read from a file (see code block)
- typically we use 11 clock pulses and drive in a leading 0 followed by the 10 data bits
- the leading 0 makes sure all registers are first set to 0
- the last data bit appears at xsr.q[1] and the first at xsr.q[10] which is out_sr} -725 842.5 0 0 0.4 0.4 {}
N -217.5 42.5 -217.5 72.5 {lab=GND}
N -217.5 -67.5 -217.5 -17.5 {lab=VSSd}
N -217.5 -185 -217.5 -125 {lab=VDDd}
N 675 -165 713.75 -165 {lab=data_in}
N 616.25 -126.25 616.25 -125 {lab=PHI_2}
N 616.25 -146.25 616.25 -145 {lab=PHI_1}
N 571.25 -125 616.25 -125 {lab=PHI_2}
N 571.25 -145 616.25 -145 {lab=PHI_1}
N 616.25 -145 713.75 -145 {lab=PHI_1}
N 616.25 -125 713.75 -125 {lab=PHI_2}
N 271.25 -145 271.25 -141.25 {lab=clock_in}
N 1063.125 -165.625 1063.125 -165 {lab=D_out}
N -85 -182.5 5 -182.5 {lab=data}
N 75 -182.5 145 -182.5 {lab=datab}
N 225 -182.5 675 -182.5 {lab=data_in}
N 675 -182.5 675 -165 {lab=data_in}
N -85 -110 5 -110 {lab=clock}
N 75 -110 145 -110 {lab=clockb}
N 225 -145 225 -110 {lab=clock_in}
N 225 -145 271.25 -145 {lab=clock_in}
N 1063.125 -145.625 1063.125 -145 {lab=BUS[1:10]}
N 1063.125 -125.625 1063.125 -125 {lab=PIN[1:5]}
N 1012.5 -165 1063.125 -165 {lab=D_out}
N 1063.125 -145 1165 -145 {lab=BUS[1:10]}
N 1012.5 -145 1063.125 -145 {lab=BUS[1:10]}
N 1063.125 -125 1165 -125 {lab=PIN[1:5]}
N 1012.5 -125 1063.125 -125 {lab=PIN[1:5]}
N 1063.125 -165 1165 -165 {lab=D_out}
C {devices/vsource.sym} -217.5 12.5 0 0 {name=V1 value=0 savecurrent=false}
C {devices/gnd.sym} -217.5 72.5 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -217.5 -96.25 0 0 {name=V2 value=\{VDD\} savecurrent=false}
C {devices/lab_wire.sym} -217.5 -37.5 0 0 {name=p2 sig_type=std_logic lab=VSSd}
C {devices/lab_wire.sym} -217.5 -157.5 0 0 {name=p3 sig_type=std_logic lab=VDDd}
C {devices/code_shown.sym} -747.5 261.25 0 0 {name=Simulation only_toplevel=false value="
.param VDD = 3.3

.global VDDd VSSd

* clock
abit [ bit_node ]  input_vector
.model input_vector d_source(input_file=\\"/foss/designs/libs/tb_swmatrix/data_source/random.txt\\")
* data
aclock [ clock_node ] clock_vector
.model clock_vector d_source(input_file=\\"/foss/designs/libs/tb_swmatrix/data_source/random_clk.txt\\")
* convert digital signals to analog
aconvert [ bit_node clock_node ] [ data clock ] dac_in
.model dac_in dac_bridge (out_low=0V out_high=3.3V t_rise=0.2ns t_fall=0.2ns)

.control

    save all
    TRAN 0.2n 1100n
    write tb_swmatrix.raw

.endc
"}
C {devices/code_shown.sym} -757.5 122.5 0 0 {name=Models only_toplevel=false
format="tcleval( @value )"
value="
.include /foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/spice/gf180mcu_fd_sc_mcu9t5v0.spice
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {launcher.sym} 540 40 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_swmatrix.raw tran"
}
C {title.sym} -630 1150 0 0 {name=l2 author="Peter Kinget"}
C {lab_wire.sym} 702.5 -145 0 0 {name=p6 sig_type=std_logic lab=PHI_1}
C {lab_wire.sym} 697.5 -125 0 0 {name=p17 sig_type=std_logic lab=PHI_2}
C {libs/core_swmatrix/NO_ClkGen.sym} 421.25 -135 0 0 {name=xNO_ClkGen}
C {lab_wire.sym} 1068.75 -165 0 1 {name=p20 sig_type=std_logic lab=D_out}
C {lab_wire.sym} -35 -182.5 0 0 {name=p22 sig_type=std_logic lab=data
}
C {libs/gf180mcu_fd_sc_mcu9t5v0_symbols/inv_2.sym} 35 -182.5 0 0 {name=x3 VGND=VSSd VNB=VDDd VPB=VSSd VPWR=VDDd prefix=gf180mcu_fd_sc_mcu9t5v0__ }
C {lab_wire.sym} 132.5 -182.5 0 0 {name=p23 sig_type=std_logic lab=datab

}
C {libs/gf180mcu_fd_sc_mcu9t5v0_symbols/inv_2.sym} 185 -182.5 0 0 {name=x1 VGND=VSSd VNB=VDDd VPB=VSSd VPWR=VDDd prefix=gf180mcu_fd_sc_mcu9t5v0__ }
C {lab_wire.sym} -35 -110 0 0 {name=p1 sig_type=std_logic lab=clock}
C {libs/gf180mcu_fd_sc_mcu9t5v0_symbols/inv_2.sym} 35 -110 0 0 {name=x4 VGND=VSSd VNB=VDDd VPB=VSSd VPWR=VDDd prefix=gf180mcu_fd_sc_mcu9t5v0__ }
C {lab_wire.sym} 132.5 -110 0 0 {name=p4 sig_type=std_logic lab=clockb

}
C {libs/gf180mcu_fd_sc_mcu9t5v0_symbols/inv_2.sym} 185 -110 0 0 {name=x5 VGND=VSSd VNB=VDDd VPB=VSSd VPWR=VDDd prefix=gf180mcu_fd_sc_mcu9t5v0__ }
C {lab_wire.sym} 347.5 -182.5 0 0 {name=p5 sig_type=std_logic lab=data_in}
C {lab_wire.sym} 250 -145 0 0 {name=p7 sig_type=std_logic lab=clock_in}
C {core_swmatrix/swmatrix_30_by_10.sym} 862.5 -145 0 0 {name=xSWMATRIX}
C {lab_wire.sym} 1068.75 -145 0 1 {name=p8 sig_type=std_logic lab=BUS[1:10]}
C {lab_wire.sym} 1068.75 -125 0 1 {name=p9 sig_type=std_logic lab=PIN[1:5]}
C {noconn.sym} 1165 -165 0 1 {name=l3}
C {noconn.sym} 1165 -145 0 1 {name=l4}
C {noconn.sym} 1165 -125 0 1 {name=l5}
