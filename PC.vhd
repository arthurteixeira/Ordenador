library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is

	port(
		clk		   : in	std_logic;
		reset	      : in	std_logic;
		
		comp1 		: in std_logic;
		comp2 		: in std_logic;
		comp3 		: in std_logic;
		
		enReg1	   : out std_logic;
		enReg2	   : out std_logic;
		enReg3	   : out std_logic;
		enReg4	   : out std_logic;
		
		enComp1	   : out std_logic;
		enComp2	   : out std_logic;
		enComp3	   : out std_logic;
		
		selReg1	   : out std_logic_vector (1 downto 0);
		selReg2	   : out std_logic_vector (1 downto 0);
		selReg3	   : out std_logic_vector (1 downto 0);
		selReg4	   : out std_logic_vector (1 downto 0);
		
		selComp    : out std_logic
	);

end entity;

architecture rtl of PC is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);

	-- Register to hold the current state
	signal state   : state_type;
	signal cont    : std_logic_vector (1 downto 0);
	--signal c : std_logic_vector(3 downto 0);

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					state <= s1;
				when s1=>
					state <= s10;
				when s10=>
					state <= s2;
				when s2=>
					if comp1 = '0' then	
						state <= s3;
					else
						state <= s4;
					end if;
				when s3=>
					state <= s4;
				when s4=>
					if comp2 = '0' then	
						state <= s5;
					else
						state <= s6;
					end if;
				when s5=>
					state <= s6;
				when s6=>
					if comp3 = '0' then	
						state <= s7;
					else
						state <= s8;
					end if;
				when s7=>
					state <= s8;
				when s8=>
					if cont = "11"	then	
						state <= s9;
					elsif cont < "11" then  
						state <= s10;
					end if;
				when s9=>
					state <= s9;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '0';
				enReg4 <= '0';
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				cont <= "00";
				selComp <= '0';
			when s1 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				
				enReg1 <= '1';
				enReg2 <= '1';
				enReg3 <= '1';
				enReg4 <= '1';
				
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				
				selComp <= '0';
			when s10 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '0';
				enReg4 <= '0';
				
				enComp1 <= '1';
				enComp2 <= '1';
				enComp3 <= '1';
				
				selComp <= '1';
			when s2 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '0';
				enReg4 <= '0';
				
				enComp1 <= '1';
				enComp2 <= '0';
				enComp3 <= '0';
				
				selComp <= '0';
			when s3 =>
				SelReg1 <= "01";
				SelReg2 <= "01";
				SelReg3 <= "00";
				SelReg4 <= "00";
				
				enReg1 <= '1';
				enReg2 <= '1';
				enReg3 <= '0';
				enReg4 <= '0';
				
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				
				selComp <= '0';
			when s4 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '0';
				enReg4 <= '0';
				
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				
				selComp <= '0';
			when s5 =>
				SelReg1 <= "00";
				SelReg2 <= "10";
				SelReg3 <= "01";
				SelReg4 <= "00";
				
				enReg1 <= '0';
				enReg2 <= '1';
				enReg3 <= '1';
				enReg4 <= '0';
				
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				
				selComp <= '0';
			when s6 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '0';
				enReg4 <= '0';
				
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '1';
				
				selComp <= '0';
			when s7 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "10";
				SelReg4 <= "01";
				
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '1';
				enReg4 <= '1';
				
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				
				selComp <= '0';
			when s8 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '0';
				enReg4 <= '0';
				
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				
				cont <= cont + '1';
				selComp <= '0';
			when s9 =>
				SelReg1 <= "00";
				SelReg2 <= "00";
				SelReg3 <= "00";
				SelReg4 <= "00";
				enReg1 <= '0';
				enReg2 <= '0';
				enReg3 <= '0';
				enReg4 <= '0';
				enComp1 <= '0';
				enComp2 <= '0';
				enComp3 <= '0';
				cont <= "00";
				selComp <= '0';
		end case;
	end process;

end rtl;