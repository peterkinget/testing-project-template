v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 30 -20 70 -20 {lab=OUT}
N -80 -20 -30 -20 {lab=bit_d}
C {opin.sym} 70 -20 0 0 {name=p1 lab=OUT}
C {dac_bridge.sym} 0 -20 0 0 {name=A1 dac_bridge_model= dac_buff}
C {lab_wire.sym} -60 -20 0 0 {name=p2 sig_type=std_logic lab=bit_d}
C {code_shown.sym} -110 -160 0 0 {name=s1 only_toplevel=false value="
asource [ bit_d ]  input_vector
.model input_vector d_source(input_file=\\"/foss/designs/libs/sim_support/bit_source.text\\")


* Ain [ bit_node ] [ bit ] dac_in
.model dac_buff dac_bridge (out_low=\{OUT_LOW\} out_high=\{OUT_HIGH\} t_rise=\{T_BIT/10\} t_fall=\{T_BIT/10\})"}
