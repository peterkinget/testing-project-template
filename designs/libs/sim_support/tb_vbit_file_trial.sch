v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 -250 -280 550 120 {flags=graph
y1=0
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/tb_vbit_file.raw
autoload=1
sim_type=tran
y2=3.3
color=4
node=bit_out}
N 50 -430 100 -430 {lab=bit_out}
N 100 -370 100 -330 {lab=GND}
C {res.sym} 100 -400 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 100 -330 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} -585 -461.25 0 0 {name=Simulation only_toplevel=false value="
.param Cload = 20f
.param VDD = 1
.param Tbit = 10n
.param Tdelay_DATA = \{Tbit/3\}
.param file_name = \\"/foss/designs/simulations/source.text\\"

.control

save all

TRAN 0.2n 250n
write tb_vbit_file.raw

.endc
"}
C {sim_support/vbit_file.sym} -100 -470 0 0 {name=x1 OUT_HIGH=\{VDD\} T_BIT=\{Tbit\} file_name=\{file_name\}}
C {lab_wire.sym} 90 -430 0 0 {name=p1 sig_type=std_logic lab=bit_out}
