library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_2bit is
    Port ( A, B : in  STD_LOGIC_VECTOR(1 downto 0);
           OP : in  STD_LOGIC_VECTOR(1 downto 0);
           O : out  STD_LOGIC_VECTOR(3 downto 0));
end ALU_2bit;

architecture Behavioral of ALU_2bit is
    signal result : STD_LOGIC_VECTOR(2 downto 0);
    signal carry : STD_LOGIC;
    signal overflow : STD_LOGIC;
begin
    process (A, B, OP)
    begin
        case OP is
            when "00" =>  -- Addition
                result <= ("0" & A) + ("0" & B);
                carry <= result(2);
                overflow <= '0' when carry = A(1) and carry = B(1) else '1';
                
            when "01" =>  -- Subtraction
                result <= ("0" & A) - ("0" & B);
                carry <= not result(2);
                overflow <= '0' when carry = A(1) and carry /= B(1) else '1';
                
            when "10" =>  -- AND
                result <= A and B;
                overflow <= '0';
                
            when "11" =>  -- OR
                result <= A or B;
                overflow <= '0';
                
            when others =>
                result <= "000";
                carry <= '0';
                overflow <= '0';
        end case;
    end process;

    O <= result & overflow;
    
end Behavioral;
