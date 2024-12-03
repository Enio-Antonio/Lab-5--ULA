entity cinext is 	
	port(x, y, z : in bit; cin : out bit);
end cinext;

architecture main of cinext is
begin
	cin <= (not x and not y and z) or (not x and y and not z);

end architecture main;