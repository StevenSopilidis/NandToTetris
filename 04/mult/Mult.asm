// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@i 
M=0 //initialize counter
@sum
M=0 // initalize sum of the multiplie

//if R0 or R1 is zero go straight to EXIT
@R0
D=M
@EXIT
D;JEQ
@R1
D=M
@EXIT
D;JEQ

//find the smallest and use it as target
@target // up untill @target add 
@ammount // how much to add per iteration 
@R0
D=M
@R1
D=M-D // R1 - R0
@SET_R0_AS_BIGGER
D;JLT
@SET_R1_AS_BIGGER
0;JMP

(SET_R0_AS_BIGGER)
@R0
D=M
@ammount
M=D
@R1
D=M
@target
M=D
@LOOP
0;JMP
(SET_R1_AS_BIGGER)
@R1
D=M
@ammount
M=D
@R0
D=M
@target
M=D

(LOOP) // main loop
@ammount
D=M
@sum
M=M+D
@target
D=M
@i
M=M+1
D=M-D
@LOOP
D;JLT

(EXIT)
@EXIT
0;JMP