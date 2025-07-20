v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -130 -10 0 -10 {lab=D_in,D_out_row[1:4]}
N -170 30 0 30 {lab=PHI_2}
N -170 10 0 10 {lab=PHI_1}
N 300 10 360 10 {lab=BUS[1:10]}
N 300 30 360 30 {lab=PIN[1:5]}
N 300 -10 360 -10 {lab=D_out_row[1:4],D_out}
C {iopin.sym} -260 130 0 0 {name=p1 lab=PIN[1:5]

}
C {iopin.sym} -260 100 0 0 {name=p2 lab=BUS[1:10]

}
C {core_swmatrix/swmatrix_row_10.sym} 150 10 0 0 {name=xswmatrix_row[1:5]}
C {ipin.sym} -170 10 0 0 {name=p3 lab=PHI_1
}
C {ipin.sym} -170 30 0 0 {name=p4 lab=PHI_2
}
C {ipin.sym} -170 -10 0 0 {name=p5 lab=D_in
}
C {lab_wire.sym} 360 -10 0 1 {name=p6 sig_type=std_logic lab=D_out_row[1:4],D_out}
C {lab_wire.sym} -10 -10 0 0 {name=p7 sig_type=std_logic lab=D_in,D_out_row[1:4]}
C {lab_wire.sym} 360 10 0 1 {name=p8 sig_type=std_logic lab=BUS[1:10]}
C {lab_wire.sym} 360 30 0 1 {name=p9 sig_type=std_logic lab=PIN[1:5]
}
C {opin.sym} 540 -10 0 0 {name=p10 lab=D_out
}
