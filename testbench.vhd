library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is

end entity testbench;

architecture RTL of testbench is
    signal clkT:         std_logic;
    signal reset_aT:     std_logic;
    signal startT:       std_logic;
    signal countT:       std_logic_vector(1 downto 0); 
    
    signal input_selT:   std_logic_vector(1 downto 0);
    signal shift_selT:   std_logic_vector(1 downto 0);
    signal state_outT:   std_logic_vector(2 downto 0);
    signal doneT:        std_logic;
    signal clk_enaT:     std_logic;
    signal sclr_nT:      std_logic;

begin
    dut:entity work.mult_control
        --generic map(
        --    SIZE => 4
        --)

        port map(
            --esqerda nbits >> direita testbench
            clk =>          clkT,
            reset_a =>      reset_aT,
            start=>         startT,
            count =>        countT,
            input_sel =>    input_selT,
            shift_sel =>    shift_selT,
            state_out =>    state_outT,
            done =>         doneT,
            clk_ena =>      clk_enaT,
            sclr_n =>       sclr_nT
        );
    
    --maquininha que faz o clock - PADRÃO
    --instância de clock dentro do dut
    
    clock_driver : process
        constant period : time := 10 ns;
    begin
        clkT <= '1';
        wait for period / 2;
        clkT <= '0';
        wait for period / 2;
    end process clock_driver;   
       
    process
    begin
        --inicializa tudo em 0
        reset_aT <= '0';
        --inicialização do count
        countT <= "00";
        startT <= '0';
        wait for 8 ns;
        startT <= '1'; 
        wait for 3 ns;
        startT <= '0';
--        wait;   
--    end process;   
       
--    process
--    begin         
        
        countT <= "00";
        wait for 10 ns;          
        countT   <= "01";
        wait for 10 ns;        
        countT   <= "10";
        wait for 10 ns;        
        countT   <= "11";
        wait for 10 ns;       
        countT   <= "00";      
        wait;
    end process;
end architecture RTL;
