--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:44:43 01/08/2018
-- Design Name:   
-- Module Name:   F:/gitRepos/DigitalAndEmbeddedSystems/Lab6.2/test.vhd
-- Project Name:  Lab6.2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zamek
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zamek
    PORT(
         Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           D0_Rdy : in  STD_LOGIC;
           F0 : in STD_LOGIC;
           D0   :	IN	std_logic_vector(7 downto 0);
           Y : out  STD_LOGIC;
           WE : out STD_LOGIC;
           DnI: out STD_LOGIC;
           DI : out STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal D0_Rdy : std_logic := '0';
   signal F0 : std_logic := '0';
   signal D0 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zamek PORT MAP (
          Clk => Clk,
          Rst => Rst,
          D0_Rdy => D0_Rdy,
          F0 => F0,
          D0 => D0,
          Y => Y
        );

   -- Clock process definitions
   Clk <= not Clk after Clk_period/2;
 

   -- Stimulus process
   process
      type typeByteArray is array ( NATURAL range <> )
         of STD_LOGIC_VECTOR( 7 downto 0 );
      variable arrBytes : typeByteArray( 0 to 22 )
			:= ( X"16", X"1E", X"26", X"25", X"16", X"20", X"15", X"20",X"45",X"45",X"16",X"1E", X"26", X"25", X"16", X"26", X"1E", X"26", X"15", X"16", X"1E", X"26", X"45");
   
   begin
      wait for 2.5 ns;
      for i in arrBytes'RANGE loop
         wait for 7.5 ns;
         D0 <= arrBytes(i);
         D0_Rdy <= '1';
         F0 <= '0';
         wait for 10 ns;
         D0_Rdy <= '0';
         wait for 22.5 ns;
         wait for 7.5 ns;
         D0_Rdy <= '1';
         F0 <= '1';
         wait for 10 ns;
         D0_Rdy <= '0';
         wait for 62.5 ns;
      end loop;
      wait; --forever
   end process;

END;
