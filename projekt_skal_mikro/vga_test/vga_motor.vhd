-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;            -- basic IEEE library
use IEEE.NUMERIC_STD.ALL;               -- IEEE library for the unsigned type


-- entity
entity vga_motor is
	port (
		clk      : in std_logic;
		VR_data  : in std_logic_vector(3 downto 0);
		VR_addr  : out unsigned(3 downto 0);
		clear    : in std_logic;
		vgaRed   : out std_logic_vector(3 downto 0);
		vgaGreen : out std_logic_vector(3 downto 0);
		vgaBlue  : out std_logic_vector(3 downto 0);
		Hsync    : out std_logic;
		Vsync    : out std_logic);
end vga_motor;


-- architecture
architecture Behavioral of vga_motor is
	
	signal Xpixel1, Xpixel2 : unsigned(9 downto 0); -- Horizontal pixel counter, and its pipelined version
	signal Ypixel1, Ypixel2 : unsigned(9 downto 0); -- Vertical pixel counter
	signal ClkDiv : unsigned(1 downto 0);          -- Clock divisor, to generate 25 MHz signal
	signal Clk25  : std_logic;                     -- One pulse width 25 MHz signal
	
	signal CR_addr  : unsigned(11 downto 0);       -- address for CHAR_ROM
	signal CR_data : std_logic_vector(11 downto 0); -- data from CHAR_ROM.
	
	signal blank1, blank2, blank : std_logic; -- blanking signal, with delayed versions
	signal Hsync1, Hsync2 : std_logic;
	signal Vsync1, Vsync2 : std_logic;
	
	signal TileX, TileY : unsigned(1 downto 0);

	signal SpriteX : unsigned(3 downto 0); -- 0 to 19
	signal SpriteY : unsigned(3 downto 0); -- 0 to 14
	signal SpriteX_tmp, SpriteY_tmp : unsigned(3 downto 0);

	signal pixel_counter_x, pixel_counter_y : unsigned(3 downto 0); -- räknar till 10

	
	-- Character image rom:
	component char_rom is
		port (
			clk      : in std_logic;
			addr     : in unsigned(11 downto 0);
			data     : out std_logic_vector(11 downto 0));
	end component;
	
begin
	
	-- Clock divisor
	-- Divide system clock (100 MHz) by 4
	process(clk)
	begin
		if rising_edge(clk) then
			if clear='1' then
				ClkDiv <= (others => '0');
			else
				ClkDiv <= ClkDiv + 1;
			end if;
		end if;
	end process;
	
	-- 25 MHz clock (one system clock pulse width)
	Clk25 <= '1' when (ClkDiv = 3) else '0';

	-- Horizontal pixel counter
	process(clk) 
	begin
		if rising_edge(clk) then
			if clear = '1' then
				Xpixel1 <= (others => '0'); 
				pixel_counter_x <= (others => '0');
				SpriteX_tmp <= (others => '0');
			elsif Clk25 = '1' then
				if Xpixel1 = 799 then
					Xpixel1 <= (others => '0'); 
					pixel_counter_x <= (others => '0');
				else
					Xpixel1 <= Xpixel1 + 1; 
				end if;
				if Xpixel1 < 640 then
					if pixel_counter_x = 9 then
						pixel_counter_x <= (others => '0');
						SpriteX_tmp <= SpriteX_tmp + 1;
					else
						pixel_counter_x <= pixel_counter_x + 1;
					end if;
				end if;
			end if;
		end if;
	end process;

	-- Horizontal sync
	Hsync1 <= '0' when (Xpixel1 >= 656 and Xpixel1 < 752) else '1';

	-- Vertical pixel counter
	process(clk) 
	begin
		if rising_edge(clk) then
			if clear = '1' then
				Ypixel1 <= (others => '0'); 
				pixel_counter_y <= (others => '0');
				SpriteY_tmp <= (others => '0');
			elsif Clk25 = '1' then
				if Xpixel1 = 799 then
					if Ypixel1 = 520 then
						Ypixel1 <= (others => '0'); -- Reset vid max row
						pixel_counter_y <= (others => '0');
					else 
						Ypixel1 <= Ypixel1 + 1; 
					end if;

					if Ypixel1 < 480 then
						if pixel_counter_y = 9 then
							pixel_counter_y <= (others => '0');
							if SpriteY_tmp > 10 then
								SpriteY_tmp <= (others => '0');
							else
								SpriteY_tmp <= SpriteY_tmp + 1;
							end if;
						else
							pixel_counter_y <= pixel_counter_y + 1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

	Vsync1 <= '0' when (Ypixel1 >= 490 and Ypixel1 < 492) else '1';

	blank1 <= '0' when (Xpixel1 < 640 and Ypixel1 < 480) else '1';

	-- Video ram address composite
	--VR_addr <= to_unsigned(10, 7) * Ypixel1(9 downto 6) + Xpixel1(9 downto 6);
	--VR_addr <= to_unsigned(20, 7) * Ypixel1(8 downto 5) + Xpixel1(9 downto 5);

	process(Xpixel2, Ypixel2)
	begin
		if to_integer(Xpixel2) < 160 then
			TileX <= "00";
		elsif to_integer(Xpixel2) < 320 then
			TileX <= "01";
		elsif to_integer(Xpixel2) < 480 then
			TileX <= "10";
		else
			TileX <= "11";
		end if;

		if to_integer(Ypixel2) < 120 then
			TileY <= "00";
		elsif to_integer(Ypixel2) < 240 then
			TileY <= "01";
		elsif to_integer(Ypixel2) < 360 then
			TileY <= "10";
		else
			TileY <= "11";
		end if;
	end process;

	VR_addr <= TileY & TileX;


	-- VIDEO_RAM:
	-- data <= mem(addr), with one clock cycle delay
	process(clk)
	begin
		if rising_edge(clk) then
			blank2 <= blank1;
			Hsync2 <= Hsync1;
			Vsync2 <= Vsync1;
			Xpixel2 <= Xpixel1;
			Ypixel2 <= Ypixel1;
			SpriteX <= SpriteX_tmp;
			SpriteY <= SpriteY_tmp;
		end if;
	end process;


	-- Character rom address:
	CR_addr <= unsigned(VR_data) & SpriteY & SpriteX;

	CHAR_ROM1 : char_rom port map (clk=>clk, addr=>CR_addr, data=>CR_data); -- one clock cycle delay.

	process(clk)
	begin
		if rising_edge(clk) then
			Hsync <= Hsync2;
			Vsync <= Vsync2;
			blank <= blank2;
		end if;
	end process;
	
	
	-- VGA generation : 4 bit red, 4 bit green ,4 bit blue
	vgaRed(3)   <= CR_data(11) when blank = '0' else '0';
	vgaRed(2)   <= CR_data(10) when blank = '0' else '0';
	vgaRed(1)   <= CR_data(9) when blank = '0' else '0';
	vgaRed(0)   <= CR_data(8) when blank = '0' else '0';
	vgaGreen(3) <= CR_data(7) when blank = '0' else '0';
	vgaGreen(2) <= CR_data(6) when blank = '0' else '0';
	vgaGreen(1) <= CR_data(5) when blank = '0' else '0';
	vgaGreen(0) <= CR_data(4) when blank = '0' else '0';
	vgaBlue(3)  <= CR_data(3) when blank = '0' else '0';
	vgaBlue(2)  <= CR_data(2) when blank = '0' else '0';
	vgaBlue(1)  <= CR_data(1) when blank = '0' else '0';
	vgaBlue(0)  <= CR_data(0) when blank = '0' else '0';
	
end Behavioral;
