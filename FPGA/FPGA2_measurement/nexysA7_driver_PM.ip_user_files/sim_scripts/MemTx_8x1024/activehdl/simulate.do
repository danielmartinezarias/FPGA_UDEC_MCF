onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+MemTx_8x1024 -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.MemTx_8x1024 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {MemTx_8x1024.udo}

run -all

endsim

quit -force
