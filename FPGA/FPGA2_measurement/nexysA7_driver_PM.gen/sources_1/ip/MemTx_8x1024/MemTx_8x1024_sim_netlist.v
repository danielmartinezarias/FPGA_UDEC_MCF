// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Jun 13 15:50:27 2024
// Host        : donaufeld running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/danie/Dropbox/physics/UdeC/experimento
//               decoy/FPGA/FPGA2_measurement/nexysA7_driver_PM/nexysA7_driver_PM.gen/sources_1/ip/MemTx_8x1024/MemTx_8x1024_sim_netlist.v}
// Design      : MemTx_8x1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MemTx_8x1024,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module MemTx_8x1024
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.35165 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "MemTx_8x1024.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MemTx_8x1024_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19040)
`pragma protect data_block
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
c6g=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
