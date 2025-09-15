`timescale 1ns/1ps

module tb_Ejercicio3;
    // Señales de prueba
    reg clk_prueba;
    reg rst_prueba;
    reg hab_prueba;
    reg dir_prueba;
    wire [3:0] cnt_prueba;
    wire [6:0] SEG_prueba;
    wire [3:0] AN_prueba;

    // Instancia del DUT
    Ejercicio3 dut (
        .clk(clk_prueba),
        .rst(rst_prueba),
        .hab(hab_prueba),
        .dir(dir_prueba),
        .cnt(cnt_prueba),
        .SEG(SEG_prueba),
        .AN(AN_prueba)
    );

    // Generador de reloj: periodo = 10 ns
    initial begin
        clk_prueba = 0;
        forever #5 clk_prueba = ~clk_prueba;
    end

    // Estímulos
    initial begin
        // Archivo de salida para GTKWave
        $dumpfile("tb_Ejercicio3.vcd");
        $dumpvars(0, tb_Ejercicio3);

        // Monitor en consola
        $monitor("T=%0t ns : rst=%b hab=%b dir=%b -> cnt=%b, SEG=%b, AN=%b",
                 $time, rst_prueba, hab_prueba, dir_prueba, cnt_prueba, SEG_prueba, AN_prueba);

        // Reset inicial
        rst_prueba = 0; hab_prueba = 0; dir_prueba = 1;
        #20;  // 20 ns en reset

        // Quitar reset, habilitar, contar hacia arriba
        rst_prueba = 1; hab_prueba = 1; dir_prueba = 1;
        #100; // contar 10 ciclos

        // Cambiar dirección: descendente
        dir_prueba = 0;
        #100; // contar hacia abajo

        // Pausar (hab=0)
        hab_prueba = 0;
        #50;

        // Otra vez habilitado, ascendente
        hab_prueba = 1; dir_prueba = 1;
        #80;

        $stop; // detener simulación
    end
endmodule
