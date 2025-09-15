module Ejercicio1(A, B, C, S1, S2, S3, S4, S5, S6);
    input A, B, C;
    output reg S1, S2, S3, S4, S5, S6;

    always @(*) begin
        S1 = (~A & ~B & C) | (~A & B & ~C) | (A & ~B & ~C) | (A & B & C);
        S2 = A | B | C;
        S3 = (~A & ~B) | (A & B);
        S4 = (~A & C) | (~B & C);
        S5 = (~A & ~B) | (~B & ~C) | (B & C);
        S6 = (A & ~B) | (~A & B & ~C);
    end

endmodule
