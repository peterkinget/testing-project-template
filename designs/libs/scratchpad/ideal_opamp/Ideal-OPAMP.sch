v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 210 -300 210 -240 {lab=Vplus}
N 210 -180 210 -120 {lab=Vminus}
N 310 -300 310 -240 {lab=Vout}
N 310 -300 620 -300 {lab=Vout}
N 620 -300 620 -240 {lab=Vout}
N 310 -180 310 -120 {lab=VSS}
N 310 -120 620 -120 {lab=VSS}
N 620 -180 620 -120 {lab=VSS}
N 620 -300 740 -300 {lab=Vout}
N 620 -120 740 -120 {lab=VSS}
N 90 -300 210 -300 {lab=Vplus}
N 90 -120 210 -120 {lab=Vminus}
C {bsource.sym} 310 -210 0 0 {name=B2 VAR=V FUNC="VDD/(1 + exp(-A * V(Vplus,Vminus)))"
}
C {res.sym} 210 -210 0 0 {name=R1
value=1e10
footprint=1206
device=resistor
m=1}
C {res.sym} 620 -210 0 0 {name=R2
value=1e10
footprint=1206
device=resistor
m=1}
C {ipin.sym} 90 -300 0 0 {name=p1 lab=Vplus}
C {ipin.sym} 90 -120 0 0 {name=p2 lab=Vminus}
C {ipin.sym} 740 -120 0 1 {name=p3 lab=VSS}
C {ipin.sym} 210 -360 0 1 {name=p4 lab=VDD}
C {iopin.sym} 740 -300 0 0 {name=p5 lab=Vout}
C {title.sym} 160 -30 0 0 {name=l1 author="Nithin Purushothama"}
