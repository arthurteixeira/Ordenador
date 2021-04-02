-- Quartus II VHDL Template
-- Unsigned Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Ordenador is
	port 
	(
		v1	   : in std_logic_vector (7 downto 0);
		v2	   : in std_logic_vector (7 downto 0);
		v3	   : in std_logic_vector (7 downto 0);
		v4	   : in std_logic_vector (7 downto 0);
		
		clk   : in std_logic;
		rst   : in std_logic;
		
		comp1 : out std_logic;
		comp2 : out std_logic;
		comp3 : out std_logic;
		
		r1	   : out std_logic_vector (7 downto 0);
		r2	   : out std_logic_vector (7 downto 0);
		r3	   : out std_logic_vector (7 downto 0);
		r4	   : out std_logic_vector (7 downto 0)
	);

end entity;

architecture rtl of Ordenador is

signal reg1: std_logic_vector (7 downto 0);
signal reg2: std_logic_vector (7 downto 0);
signal reg3: std_logic_vector (7 downto 0);
signal reg4: std_logic_vector (7 downto 0);
signal regComp1: std_logic;
signal regComp2: std_logic;
signal regComp3: std_logic;
signal outComp1: std_logic;
signal outComp2: std_logic;
signal outComp3: std_logic;
signal outMuxReg1: std_logic_vector (7 downto 0);
signal outMuxReg2: std_logic_vector (7 downto 0);
signal outMuxReg3: std_logic_vector (7 downto 0);
signal outMuxReg4: std_logic_vector (7 downto 0);

signal enReg1	   : std_logic;
signal enReg2	   : std_logic;
signal enReg3	   : std_logic;
signal enReg4	   : std_logic;
signal enComp1	   : std_logic;
signal enComp2	   : std_logic;
signal enComp3	   : std_logic;	
signal selReg1	   : std_logic_vector (1 downto 0);
signal selReg2	   : std_logic_vector (1 downto 0);
signal selReg3	   : std_logic_vector (1 downto 0);
signal selReg4	   : std_logic_vector (1 downto 0);	
signal selComp    : std_logic;

component PC is
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
end component;

begin
	
	outComp1 <= '1' when	reg1 < reg2 else
				'0';

	outComp2 <= '1' when	reg2 < reg3 else
				'0';

	outComp3 <= '1' when	reg3 < reg4 else
				'0';
				
	regComp1 <= outComp1 when selComp = '0' else
					'0';
					
	regComp2 <= outComp2 when selComp = '0' else
					'0';
					
	regComp3 <= outComp3 when selComp = '0' else
					'0';
				
	outMuxReg1 <= v1 when selReg1 = "00" else
					  reg2 when selReg1 = "01" else
					  "00000000";
	
	outMuxReg2 <= v2 when selReg2 = "00" else
					  reg1 when selReg2 = "01" else
					  reg3 when selReg2 = "10" else
					  "00000000";
	
	outMuxReg3 <= v3 when selReg3 = "00" else
					  reg2 when selReg3 = "01" else
					  reg4 when selReg3 = "10" else
					  "00000000";
	
	outMuxReg4 <= v4 when selReg4 = "00" else
					  reg3 when selReg4 = "01" else
					  "00000000";

	r1 <= reg1;	
	r2 <= reg2;
	r3 <= reg3;
	r4 <= reg4;	
				
	process(clk, rst)is
	begin
		if (rst = '1') then
			reg1 <= "00000000";
			reg2 <= "00000000";
			reg3 <= "00000000";
			reg4 <= "00000000";
			comp1 <= '0';
			comp2 <= '0';
			comp3 <= '0';
		else
			if (rising_edge(clk)) then			
					if (enReg1 = '1') then
						reg1 <= outMuxReg1;
					end if;
					
					if (enReg2 = '1') then
						reg2 <= outMuxReg2;					
					end if;
					
					if (enReg3 = '1') then
						reg3 <= outMuxReg3;	
					end if;
					
					if (enReg4 = '1') then
						reg4 <= outMuxReg4;	
					end if;
					
					
					if (enComp1 = '1') then
						comp1 <= regComp1;	
					end if; 
					if (enComp2 = '1') then
						 comp2 <= regComp2;		
					end if; 
					if (enComp3 = '1') then
						 comp3 <= regComp3;		
					end if;
			end if;
		end if;
	end process;
	
	
Controle: PC
		port map (
			clk => clk,
			reset => rst,
			comp1 => regComp1,
			comp2 => regComp2,
			comp3 => regComp3,
			enReg1 => enReg1,
			enReg2 => enReg2,
			enReg3 => enReg3,
			enReg4 => enReg4,		
			enComp1 => enComp1,
			enComp2 => enComp2,
			enComp3 => enComp3,
			selReg1 => selReg1,
			selReg2 => selReg2,
			selReg3 => selReg3,
			selReg4 => selReg4,
			selComp => selComp
		);
	
end rtl;








