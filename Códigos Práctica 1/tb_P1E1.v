`timescale 1ns/1ps

module tb_Ejercicio1;
// Entradas de prueba
reg A_prueba;
reg B_prueba;
reg C_prueba;

// Salidas de prueba
wire S1_prueba, S2_prueba, S3_prueba, S4_prueba, S5_prueba, S6_prueba;

// Instancia del circuito bajo prueba (DUT)
Ejercicio1 dut(
    .A(A_prueba),
    .B(B_prueba),
    .C(C_prueba),
    .S1(S1_prueba),
    .S2(S2_prueba),
    .S3(S3_prueba),
    .S4(S4_prueba),
    .S5(S5_prueba),
    .S6(S6_prueba)
);

// Bloque inicial para pruebas
initial begin
    // Archivo de resultados para GTKWave o similar
    $dumpfile("tb_Ejercicio1.vcd");
    $dumpvars(0, tb_Ejercicio1);
    
    // Monitor en consola
    $monitor("Tiempo=%0t ns : A=%b B=%b C=%b -> S1=%b S2=%b S3=%b S4=%b S5=%b S6=%b",  
        $time, A_prueba, B_prueba, C_prueba, S1_prueba, S2_prueba, S3_prueba, S4_prueba, S5_prueba, S6_prueba);
    
    // Pruebas: todas las combinaciones posibles de A, B, C
    A_prueba=0; B_prueba=0; C_prueba=0; #10;
    A_prueba=0; B_prueba=0; C_prueba=1; #10;
    A_prueba=0; B_prueba=1; C_prueba=0; #10;
    A_prueba=0; B_prueba=1; C_prueba=1; #10;
    A_prueba=1; B_prueba=0; C_prueba=0; #10;
    A_prueba=1; B_prueba=0; C_prueba=1; #10;
    A_prueba=1; B_prueba=1; C_prueba=0; #10;
    A_prueba=1; B_prueba=1; C_prueba=1; #10;

    $stop; // detener simulación
end

endmodule
