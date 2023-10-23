----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2023 20:46:08
-- Design Name: 
-- Module Name: I2C_reader_v1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity I2C_reader_v1 is
    Port ( Clk : in STD_LOGIC;
           SP : in STD_LOGIC;
           Data : out STD_LOGIC_VECTOR (7 downto 0);
           toggleO : out std_logic;
           InBufferO : out std_logic_vector(16 downto 0);
           Ready : out STD_LOGIC);
           
end I2C_reader_v1;

architecture Behavioral of I2C_reader_v1 is

signal InBuffer : std_logic_vector(16 downto 0) := (others => '1');
signal toggle : std_logic := '0';

begin

InBufferO <= InBuffer;
toggleO <= toggle;

process(clk)
    begin
    if(clk'event and clk = '1')then
        if (InBuffer(16) = '1') then
            if(toggle = '1') then
                InBuffer <= InBuffer(15 downto 0) & '0';
            else
                InBuffer(0) <= SP;
            end if;
            Ready <= '0';
        elsif(InBuffer(16) = '0') then
            if(toggle = '0') then
                Data <= InBuffer(15) & InBuffer(13) & InBuffer(11) & InBuffer(9) & InBuffer(7) & InBuffer(5) & InBuffer(3) & InBuffer(1);
                --Data <= (others => '1');
            else
                InBuffer <= (others => '1');
            end if;
            Ready <= '1';
        end if;
        toggle <= not toggle;
    end if;
end process;

end Behavioral;
