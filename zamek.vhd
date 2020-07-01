----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:29 01/03/2018 
-- Design Name: 
-- Module Name:    zamek - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zamek is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           D0_Rdy : in  STD_LOGIC;
           F0 : in STD_LOGIC;
           D0   :	IN	std_logic_vector(7 downto 0);
           Y : out  STD_LOGIC;
           WE : out STD_LOGIC;
           DnI: out STD_LOGIC;
           DI : out STD_LOGIC_VECTOR(7 downto 0));
end zamek;

architecture Behavioral of zamek is
type state_type is (a,b,c,d,e,f,g,h,i,j,k,l,m);
signal state, next_state : state_type;

begin
   
	process_1 : process(Clk, D0_Rdy)
	begin
		if rising_edge(Clk) then
			if Rst = '1' then
				state <= a;
			else 
				if D0_Rdy = '1' then
               if F0 = '0' then
                  state <= next_state;
               end if;
            end if;
			end if;
		end if;
	end process process_1;

-- poprawne odpowiedzi
-- 1 2 3 4 1 2 3 4 1 2 3
--1 = 16
--2 = 1E
--3 = 26
--4 = 25
--ko³a ratunkowe
--Q = 15 --> pomiñ pytanie 
--W = 1D
--E = 24
--R = 2D
--0 = 45 --> zagraj ponownie

	process_2 : process(state,D0)
	variable CHANCE : boolean := false;
	variable SKIP : boolean := false;
	begin
		next_state <= state;
		
		case state is
			when a =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= b;
					SKIP := true;
				elsif D0 = X"16" then next_state <= b;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= a;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when b =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= c;
					SKIP := true;
				elsif D0 = X"1E" then next_state <= c;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= b;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when c =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= d;
					SKIP := true;
				elsif D0 = X"26" then next_state <= d;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= c;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when d =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= e;
					SKIP := true;
				elsif D0 = X"25" then next_state <= e;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= d;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;	
			when e =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= f;
					SKIP := true;
				elsif D0 = X"16" then next_state <= f;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= e;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when f =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= g;
					SKIP := true;
				elsif D0 = X"1E" then next_state <= g;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= f;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when g =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= h;
					SKIP := true;
				elsif D0 = X"26" then next_state <= h;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= g;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when h=>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= i;
					SKIP := true;
				elsif D0 = X"25" then next_state <= i;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= h;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when i =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= j;
					SKIP := true;
				elsif D0 = X"16" then next_state <= j;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= i;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when j =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= k;
					SKIP := true;
				elsif D0 = X"1E" then next_state <= k;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= j;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when k =>
				if (SKIP = false) AND (D0 = X"15") then 
					next_state <= l;
					SKIP := true;
				elsif D0 = X"26" then next_state <= l;
				elsif CHANCE = false then 
					CHANCE := true;
					next_state <= k;
				else 
					CHANCE := false;
					SKIP := false;
					next_state <= m;
					
				end if;
			when l =>
				if D0 = X"45" then 
					CHANCE := false;
					SKIP := false;
					next_state <= a;
					
				else
					next_state <= l;
				end if;
			when m =>
				if D0 = X"45" then 
					CHANCE := false;
					SKIP := false;
					next_state <= a;
					
				else
					next_state <= m;
				end if;
		end case;
	end process process_2;
 
 
   process_3 : process(state,next_state,D0_Rdy,F0)
	begin
	
      case state is
         when a =>
            if next_state = b then
               DI <= X"1C";
					DI <= X"42";
					DI <= X"23";
					DI <= X"29";
					DI <= X"42";
					DI <= X"44";
					DI <= X"4B";
					DI <= X"44";
					DI <= X"2D";
					DI <= X"29";
					DI <= X"3A";
					DI <= X"29";
					DI <= X"2C";
					DI <= X"2C";
					DI <= X"2D";
					DI <= X"1C";
					DI <= X"1D";
					DI <= X"1C";
               DnI <= '1';
               WE <= '1';
					
					
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"1A"; 
					DI <= X"43";
					DI <= X"24";
					DI <= X"4B";
					DI <= X"44";
					DI <= X"31";
					DI <= X"35";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"32"; 
					DI <= X"43";
					DI <= X"1C";
					DI <= X"4B";
					DI <= X"35";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"21"; 
					DI <= X"1A";
					DI <= X"2D";
					DI <= X"31";
					DI <= X"35";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when b =>
            if next_state = c then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when c =>
            if next_state = d then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when d =>
            if next_state = e then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when e =>
            if next_state = f then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when f =>
            if next_state = g then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when g =>
            if next_state = h then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when h =>
            if next_state = i then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;         
			when i =>
            if next_state = j then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when j =>
            if next_state = k then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
			when k =>
            if next_state = l then
               DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"23"; 
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
					DI <= X"24"; 
					DI <= X"25";
					DI <= X"26";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
					DI <= X"23";
               DnI <= '1';
               WE <= '1';
					-------------
					DI <= X"01" after 10000 ms; --clear
               DnI <= '0';
               WE <= '1';
					-------------
            else WE <= '0';
            end if;
		-------------------------------------------
         when l =>
            if (next_state = a) AND D0_Rdy = '1' AND F0 = '0' then
               DI <= X"01"; --clear
               DnI <= '0';
               WE <= '1';
            else WE <= '0';
            end if;
         when others =>
            WE <= '0';
            DnI <= '1';
            DI <= X"00";
      end case;
	end process process_3;

   y <= '1' when state = l
	else '0';

end Behavioral;

