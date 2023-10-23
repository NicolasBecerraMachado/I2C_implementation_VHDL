----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2023 21:21:05
-- Design Name: 
-- Module Name: tst_I2C_reader - Behavioral
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

entity tst_I2C_reader is
--  Port ( );
end tst_I2C_reader;

architecture Behavioral of tst_I2C_reader is

-----------------------------------------------------------------------------
  -- Declare the Component Under Test
  -----------------------------------------------------------------------------
  component I2C_reader_v1 is
    Port ( Clk : in STD_LOGIC;
           SP : in STD_LOGIC;
           Data : out STD_LOGIC_VECTOR (7 downto 0);
           toggleO : out std_logic;
           InBufferO : out std_logic_vector(16 downto 0);
           Ready : out STD_LOGIC);
  end component I2C_reader_v1;
   
  signal clk : std_logic := '0';
  signal SP : std_logic := '0';
  signal Data : std_logic_vector(7 downto 0) := (others => '0');
  signal Ready : std_logic := '0';
  signal toggleO : std_logic;
  signal InBufferO : std_logic_vector(16 downto 0);

begin

      I2C_reader : component I2C_reader_v1 port map (clk => clk,SP => SP,Data => Data,Ready => Ready,toggleO => toggleO,InBufferO => InBufferO);
      clk <= not clk after 5 us;
      SP <= not SP after 40 us;
      
      stimulus:
      process begin
            wait;
      end process stimulus;
end Behavioral;
