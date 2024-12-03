entity abext is 
	port(x, y, z, a, b : in bit; ia, ib : out bit);
end abext;

architecture main of abext is
begin
	ia <= (not x and not y and not z and a and not b) or (not x and not y and not z and a and b) or (not x and not y and z and a and not b) or 
	(not x and not y and not z and a and b) or (not x and y and not z and a and not b) or (not x and y and not z and a and b) or 
	(not x and y and z and a and not b) or (not x and y and z and a and b) or (x and not y and not z and a and b) or 
	(x and not y and z and a and not b) or (x and not y and z and not a and b) or (x and not y and z and a and b) or 
	(x and y and not z and a and not b) or (x and y and not z and not a and b) or (x and y and z and not a and not b) or 
	(x and y and z and not a and b);
	
	ib <= (not x and not y and not z and not a and b) or (not x and not y and not z and a and b) or (not x and not y and z and not a and not b)
	or (not x and not y and z and a and not b);
end architecture main;