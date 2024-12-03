entity calculadora is
	port(a, b : in bit_vector (5 downto 0); sub : in bit; result : out bit_vector (5 downto 0); cout : out bit);
end entity;

architecture main of calculadora is
	component mult is
		port(a, b, switch : in bit; saida : out bit);
	end component;
	
	component full_adder is 
		port(a, b, ci : in bit; co, s : out bit);	
	end component;
	
	signal co_0 : bit;
	signal co_1 : bit;
	signal co_2 : bit;
	signal co_3 : bit;
	signal co_4 : bit;
	signal co_5 : bit;
	
	signal b_mux : bit_vector (5 downto 0);

begin
	mux_0: mult port map(a => b(0), b => not(b(0)), switch => sub, saida => b_mux(0));

	mux_1: mult port map (a => b(1), b => not(b(1)), switch => sub, saida => b_mux(1));

	mux_2: mult port map(a => b(2), b => not(b(2)), switch => sub, saida => b_mux(2));

	mux_3: mult port map(a => b(3), b => not(b(3)), switch => sub, saida => b_mux(3));

	mux_4: mult port map(a => b(4), b => not(b(4)), switch => sub, saida => b_mux(4));

	mux_5: mult port map(a => b(5), b => not(b(5)), switch => sub, saida => b_mux(5));
	
	f_add_0: full_adder port map(a => a(0), b => b_mux(0), ci => sub, co => co_0, s => result(0));
	
	f_add_1: full_adder port map(a => a(1), b  => b_mux(1), ci => co_0, co => co_1, s => result(1));
	
	f_add_2: full_adder port map(a => a(2), b  => b_mux(2), ci => co_1, co => co_2, s => result(2));
	
	f_add_3: full_adder port map(a => a(3), b  => b_mux(3), ci => co_2, co => co_3, s => result(3));
	
	f_add_4: full_adder port map(a => a(4), b  => b_mux(4), ci => co_3, co => co_4, s => result(4));
	
	f_add_5: full_adder port map(a => a(5), b  => b_mux(5), ci => co_4, co => co_5, s => result(5));
	
	cout <= co_5;
	
end architecture main;