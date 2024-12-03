entity full_adder is 
	port(a, b : in bit_vector(5 downto 0); s : out bit_vector; ci : in bit);
end full_adder;

architecture main of full_adder is
	signal co : bit_vector(5 downto 0);
	
begin
	co(0) <= (not(a(0)) and b(0) and ci) or (a(0) and not(b(0)) and ci) or (a(0) and b(0) and not(ci)) or (a(0) and b(0) and ci);
	s(0) <= (not(a(0)) and not(b(0)) and ci) or (not(a(0)) and b(0) and not(ci)) or (a(0) and not(b(0)) and not(ci)) or (a(0) and b(0) and ci);
	
	co(1) <= (not(a(1)) and b(1) and co(0)) or (a(1) and not(b(1)) and co(0)) or (a(1) and b(1) and not(co(0))) or (a(1) and b(1) and co(0));
	s(1) <= (not(a(1)) and not(b(1)) and co(0)) or (not(a(1)) and b(1) and not(co(0))) or (a(1) and not(b(1)) and not(co(0))) or (a(1) and b(1) and co(0));
	
	co(2) <= (not(a(2)) and b(2) and co(1)) or (a(2) and not(b(2)) and co(1)) or (a(2) and b(2) and not(co(1))) or (a(2) and b(2) and co(1));
	s(2) <= (not(a(2)) and not(b(2)) and co(1)) or (not(a(2)) and b(2) and not(co(1))) or (a(2) and not(b(2)) and not(co(1))) or (a(2) and b(2) and co(1));

	
	co(3) <= (not(a(3)) and b(3) and co(2)) or (a(3) and not(b(3)) and co(2)) or (a(3) and b(3) and not(co(2))) or (a(3) and b(3) and co(2));
	s(3) <= (not(a(3)) and not(b(3)) and co(2)) or (not(a(3)) and b(3) and not(co(2))) or (a(3) and not(b(3)) and not(co(2))) or (a(3) and b(3) and co(2));

	
	co(4) <= (not(a(4)) and b(4) and co(3)) or (a(4) and not(b(4)) and co(3)) or (a(4) and b(4) and not(co(3))) or (a(4) and b(4) and co(3));
	s(4) <= (not(a(4)) and not(b(4)) and co(3)) or (not(a(4)) and b(4) and not(co(3))) or (a(4) and not(b(4)) and not(co(3))) or (a(4) and b(4) and co(3));

	
	co(5) <= (not(a(5)) and b(5) and co(4)) or (a(5) and not(b(5)) and co(4)) or (a(5) and b(5) and not(co(4))) or (a(5) and b(5) and co(4));
	s(5) <= (not(a(5)) and not(b(5)) and co(4)) or (not(a(5)) and b(5) and not(co(4))) or (a(5) and not(b(5)) and not(co(4))) or (a(5) and b(5) and co(4));
	
end architecture main;	