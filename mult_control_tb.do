# ============================================================================
# Name        : tb.do
# Author      : Letícia de Oliveira Nunes
# Version     : 0.1
# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
# Description : FSM multiplicador 8x8
# ============================================================================

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivos. Ordem é importante
vcom mult_control.vhd 
vcom testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
#toplevel
vsim -t ns work.testbench 

#Mostra forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix dec -label clock    /clkT
add wave -radix dec -label reset    /reset_aT
add wave -radix dec -label start    /startT
add wave -radix dec -label count    /countT
add wave -radix dec -label input    /input_selT
add wave -radix dec -label shift    /shift_selT
add wave -radix dec -label stateout /state_outT
add wave -radix dec -label done     /doneT
add wave -radix dec -label clk_ena  /clk_enaT
add wave -radix dec -label sclr_n   /sclr_nT
#pegar o sinal de dentro do componente
add wave -radix dec -label state   /dut/state


#Como mostrar sinais internos do processo

#Simula até um 100ns
run 100ns

wave zoomfull
#write wave wave.ps