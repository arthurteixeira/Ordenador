-- Quartus II VHDL Template
-- Unsigned Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_Ordenador is
end entity;


architecture rtl of tb_Ordenador is

signal	 	v1_sg	   : std_logic_vector (7 downto 0) := "00000100";
signal		v2_sg	   :  std_logic_vector (7 downto 0) := "00000011";
signal		v3_sg	   :  std_logic_vector (7 downto 0) := "00000010";
signal		v4_sg	   :  std_logic_vector (7 downto 0) := "00000001";
		
signal		clk_sg   :  std_logic := '0';
signal		rst_sg   :  std_logic := '0';
		
signal		comp1_sg :  std_logic := '0';
signal		comp2_sg :  std_logic := '0';
signal		comp3_sg :  std_logic := '0';
		
signal		r1_sg	   :  std_logic_vector (7 downto 0);
signal		r2_sg	   :  std_logic_vector (7 downto 0);
signal		r3_sg	   :  std_logic_vector (7 downto 0);
signal		r4_sg	   :  std_logic_vector (7 downto 0);

component Ordenador is
	port(
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
end component Ordenador;

begin

inst_Ordenador: Ordenador 
	port map( 
		v1	=> v1_sg,		
		v2	=> v2_sg,   
		v3	=> v3_sg,   
		v4	=> v4_sg,  
		
		clk   => clk_sg,
		rst   => rst_sg,
		
		comp1 => comp1_sg,
		comp2 => comp2_sg,
		comp3 => comp3_sg,
		
		r1	   => r1_sg,
		r2	  => r2_sg,
		r3	  => r3_sg,
		r4	   => r4_sg
	);

clk_sg <= not clk_sg after 20 ns;

process is
	begin
		wait for 0 ns;
			rst_sg       <= '0';
		wait;
end process;
	
end rtl;








