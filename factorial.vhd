library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity factorial is
    generic(n            : natural :=29);
    Port   (ck           : in STD_LOGIC;
            wren         : in STD_LOGIC;
            reset        : in STD_LOGIC;
            synch        : in STD_LOGIC;
            slv_reg_addr : in std_logic_vector(1 downto 0);
            z            : out STD_LOGIC_VECTOR (n-1 downto 0));
end factorial;

architecture Behavioral of factorial is
signal clk      : std_logic;
signal factor   : natural := 1;
signal number   : natural := 1;
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            if reset = '0' then
                number  <= 1;
                factor  <= 1;
            else
                if wren = '1' and slv_reg_addr = "01" then
                    factor  <= factor * number;
                    number  <= number + 1;
                end if;
            end if;
         end if;
    end process;
    clk <= ck and synch;
    z   <= std_logic_vector( to_unsigned(factor, z'length) );
    
end Behavioral;
