// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Jun 13 15:50:27 2024
// Host        : donaufeld running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ MemTx_8x1024_sim_netlist.v
// Design      : MemTx_8x1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MemTx_8x1024,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19072)
`pragma protect data_block
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
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
