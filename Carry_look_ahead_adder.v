`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     
// Design Name: 
// Module Name:    Carry_look_ahead_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Carry_look_ahead_adder(a, b, cin,sum, Cout);

    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output Cout;
    
    wire P0,P1,P2,P3,G0,G1,G2,G3;
    wire C4, C3, C2, C1;
    
/*incase we add one assign then each stmt can be given with ',' and last stmt can be ended with ';' 
or else use assign for each stmt and use';' to end each stmt */
    assign
        P0 = a[0] ^ b[0],   
        P1 = a[1] ^ b[1],   
        P2 = a[2] ^ b[2],
        P3 = a[3] ^ b[3]
        
    assign
        G0 = a[0] & b[0],
        G1 = a[1] & b[1]
        G2 = a[2] & b[2],
        G3 = a[3] & b[2];
	 assign
        C1 = G0 | (P0 & cin),
        C2 = G1 | (P1 & G0) | (P1 & P0 & cin),
        C3 = G2 | (P2 & G1) | (P2 & P1 & G0) | (P2 & P1 & P0 & cin),
        C4 = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0) | (P3 & P2 & P1 & P0 & cin)
        
    assign
        sum[0] = P0 ^ cin,
        sum[1] = P1 ^ C1        sum[2] = P2 ^ C2,
        sum[3] = P3 ^ C3;
        
    assign Cout = C4    
endmodule