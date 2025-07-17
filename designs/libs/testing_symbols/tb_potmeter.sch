v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -50 -70 -50 -40 {lab=#net1}
N -50 -70 60 -70 {lab=#net1}
N 60 -70 60 -50 {lab=#net1}
N -50 20 -50 50 {lab=GND}
N -50 50 60 50 {lab=GND}
N 60 30 60 50 {lab=GND}
C {vsource.sym} -50 -10 0 0 {name=V1 value=3 savecurrent=false}
C {gnd.sym} 0 50 0 0 {name=l1 lab=GND}
C {libs/core_analog/ota_5t/ota_5t.sym} 210 -100 0 0 {name=x1}
C {libs/testing_symbols/potmeter.sym} 20 0 0 0 {}
