entity ULA is
	port(A, B : in bit_vector(5 downto 0); x, y, z : in bit; saida : out bit_vector(5 downto 0));
end ULA;

architecture main of ULA is
	signal IA, IB : bit_vector(5 downto 0);
	signal cin : bit;
	signal enable: bit;
	
	component abext is
		port(x, y, z, a, b : in bit; ia, ib : out bit);
	end component;
	
	component cinext is
		port(x, y, z : in bit; cin : out bit);
	end component;
	
	component calculadora is
		port(a, b : in bit_vector (5 downto 0); sub : in bit; result : out bit_vector (5 downto 0));
	end component;

begin
	abext0: abext port map(x => x, y => y, z => z, a => A(0), b => B(0), ia => IA(0), ib => IB(0));
	abext1: abext port map(x => x, y => y, z => z, a => A(1), b => B(1), ia => IA(1), ib => IB(1));
	abext2: abext port map(x => x, y => y, z => z, a => A(2), b => B(2), ia => IA(2), ib => IB(2));
	abext3: abext port map(x => x, y => y, z => z, a => A(3), b => B(3), ia => IA(3), ib => IB(3));
	abext4: abext port map(x => x, y => y, z => z, a => A(4), b => B(4), ia => IA(4), ib => IB(4));
	abext5: abext port map(x => x, y => y, z => z, a => A(5), b => B(5), ia => IA(5), ib => IB(5));
	
	cinext_0: cinext port map(x => x, y => y, z => z, cin => cin);
	
	somador: calculadora port map(a => IA, b => IB, sub => cin, result => saida);

end architecture main;




