// imem.v
// Very simple instruction memory for ARM single-cycle model.
// "Digital Design and Computer Architecture ARM EDITION," S.L. Harris and D.M. Harris.
// EE 4490 adapted from code by Jerry C. Hamann

module imem(RD,A);
  output  [31:0]  RD;
  input   [31:0]  A;

  reg     [31:0]  RD;

  always @(A)
    case(A[5:2])
      4'b0000: RD = 32'hE032_2002;  // T0: EORS    R2,R2,R2
      4'b0001: RD = 32'h1AFF_FFFD;  //     BNE     T0
      4'b0010: RD = 32'hE202_3000;  //     AND     R3,R2,#0
      4'b0011: RD = 32'hE383_4030;  //     ORR     R4,R3,#0x30
      4'b0100: RD = 32'hE082_2004;  // T1: ADD     R2,R2,R4
      4'b0101: RD = 32'hE092_2002;  //     ADDS    R2,R2,R2
      4'b0110: RD = 32'h2022_2002;  //     EORCS   R2,R2,R2
      4'b0111: RD = 32'hE244_4001;  //     SUB     R4,R4,#1
      4'b1000: RD = 32'h5354_0000;  //     CMPPL   R4,#0
      4'b1001: RD = 32'h1AFF_FFF9;  //     BNE     T1
      4'b1010: RD = 32'hE583_2000;  //     STR     R2,[R3]
      4'b1011: RD = 32'hE593_5000;  //     LDR     R5,[R3]
      4'b1100: RD = 32'hEAFF_FFFE;  // T2: BAL     T2
      default: RD = 32'hEAFF_FFFE;  // T3: BAL     T3
    endcase
endmodule
