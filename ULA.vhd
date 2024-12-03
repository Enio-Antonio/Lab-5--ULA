entity ULA is
	port(A, B : in bit_vector(5 downto 0); x, y, z, clk, enable : in bit; saida : out bit_vector(5 downto 0); cin_teste : out bit);
end ULA;

architecture main of ULA is
	signal IA, IB : bit_vector(5 downto 0);
	signal cin : bit;
	signal saida_ula_interna : bit_vector(5 downto 0);
	
	component abext is
		port(x, y, z, a, b : in bit; ia, ib : out bit);
	end component;
	
	component cinext is
		port(x, y, z : in bit; cin : out bit);
	end component;
	
	component calculadora is
		port(a, b : in bit_vector (5 downto 0); sub : in bit; result : out bit_vector (5 downto 0));
	end component;
	
	component full_adder is 
		port(a, b, ci : in bit; s, co : out bit);
	end component;
	
	component reg6 is
		 Port (
			  clk : in bit;                       -- Sinal de clock
			  enable : in bit;
			  data_in : in bit_vector(5 downto 0); -- Entrada de 6 bits
			  data_out : out bit_vector(5 downto 0) -- Saída de 6 bits
		 );
	end component;

	signal co_0 : bit;
	signal co_1 : bit;
	signal co_2 : bit;
	signal co_3 : bit;
	signal co_4 : bit;
	signal co_5 : bit;

begin
	abext0: abext port map(x => x, y => y, z => z, a => A(0), b => B(0), ia => IA(0), ib => IB(0));
	abext1: abext port map(x => x, y => y, z => z, a => A(1), b => B(1), ia => IA(1), ib => IB(1));
	abext2: abext port map(x => x, y => y, z => z, a => A(2), b => B(2), ia => IA(2), ib => IB(2));
	abext3: abext port map(x => x, y => y, z => z, a => A(3), b => B(3), ia => IA(3), ib => IB(3));
	abext4: abext port map(x => x, y => y, z => z, a => A(4), b => B(4), ia => IA(4), ib => IB(4));
	abext5: abext port map(x => x, y => y, z => z, a => A(5), b => B(5), ia => IA(5), ib => IB(5));
	
	cinext_0: cinext port map(x => x, y => y, z => z, cin => cin);
	cinext_teste : cinext port map(x => x, y => y, z => z, cin => cin_teste);
	
	-- somador: calculadora port map(a => IA, b => IB, sub => cin, result => saida);
	somador0: full_adder port map(a => IA(0), b => IB(0), ci => cin, co => co_0, s => saida_ula_interna(0));
	somador1: full_adder port map(a => IA(1), b => IB(1), ci => co_0, co => co_1, s => saida_ula_interna(1));
	somador2: full_adder port map(a => IA(2), b => IB(2), ci => co_1, co => co_2, s => saida_ula_interna(2));
	somador3: full_adder port map(a => IA(3), b => IB(3), ci => co_2, co => co_3, s => saida_ula_interna(3));
	somador4: full_adder port map(a => IA(4), b => IB(4), ci => co_3, co => co_4, s => saida_ula_interna(4));
	somador5: full_adder port map(a => IA(5), b => IB(5), ci => co_4, co => co_5, s => saida_ula_interna(5));

	registrador : reg6
	port map(clk => clk, enable => enable, data_in => saida_ula_interna , data_out => saida);
end architecture main;

