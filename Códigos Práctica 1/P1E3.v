module Ejercicio3(
    input wire clk,       // reloj
    input wire rst,       // reset activo en bajo
    input wire hab,       // habilitación
    input wire dir,       // dirección (1=up, 0=down)
    output reg [3:0] cnt, // valor del contador
    output reg [6:0] SEG, // segmentos (abcdefg)
    output reg [3:0] AN   // control de displays (activo en bajo)
);

    // Inicializar
    initial begin
        cnt = 4'b0000;
        SEG = 7'b1111111;
        AN  = 4'b1110; // habilitamos solo un display (AN0=0)
    end

    // Contador
    always @(posedge clk) begin
        if (!rst) begin
            cnt <= 4'b0000;                  // reset activo en bajo
        end else if (hab) begin
            if (dir) 
                cnt <= cnt + 1'b1;           // ascendente
            else 
                cnt <= cnt - 1'b1;           // descendente
        end
    end

    // Decodificador a 7 segmentos (solo muestra cnt en AN0)
    always @(*) begin
        AN = 4'b1110; // solo habilito el display 0
        case (cnt)
            4'b0000: SEG = 7'b1000000; // 0
            4'b0001: SEG = 7'b1111001; // 1
            4'b0010: SEG = 7'b0100100; // 2
            4'b0011: SEG = 7'b0110000; // 3
            4'b0100: SEG = 7'b0011001; // 4
            4'b0101: SEG = 7'b0010010; // 5
            4'b0110: SEG = 7'b0000010; // 6
            4'b0111: SEG = 7'b1111000; // 7
            4'b1000: SEG = 7'b0000000; // 8
            4'b1001: SEG = 7'b0010000; // 9
            4'b1010: SEG = 7'b0001000; // A
            4'b1011: SEG = 7'b0000011; // b
            4'b1100: SEG = 7'b1000110; // C
            4'b1101: SEG = 7'b0100001; // d
            4'b1110: SEG = 7'b0000110; // E
            4'b1111: SEG = 7'b0001110; // F
            default: SEG = 7'b1111111; // apagado
        endcase
    end

endmodule
