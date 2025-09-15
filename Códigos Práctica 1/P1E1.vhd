library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ejercicio1 is
    Port (
        A, B, C: in  STD_LOGIC;
        S1, S2, S3, S4, S5, S6: out STD_LOGIC
    );
end Ejercicio1;

architecture a_func of Ejercicio1 is
begin
    S1 <= (not A and not B and C) or 
          (not A and B and not C) or 
          (A and not B and not C) or 
          (A and B and C);

    S2 <= A or B or C;

    S3 <= (not A and not B) or (A and B);

    S4 <= (not A and C) or (not B and C);

    S5 <= (not A and not B) or (not B and not C) or (B and C);

    S6 <= (A and not B) or (not A and B and not C);
end a_func;