// TopLevelSCUWARM.v
// Jerry Hamann
// EE 4490 Fall 2017

module TopLevelSCUWARM(sevenSegmentsa2g,anodeDrives,theReg,TopHalf,PushButton,clk,reset);
  output [0:6]    sevenSegmentsa2g;
  output [3:0]    anodeDrives;
  input  [3:0]    theReg;
  input           TopHalf, PushButton, clk, reset;

  wire   [31:0]   theRegVal;
  wire   [3:0]    the7SegVal;
  wire   [3:0]    setA, setB, setC, setD;

  SingleCycleProcessor    scpuw(.DBtheRegVal(theRegVal),.DBtheReg(theReg),.clk(PushButton),.reset(reset));
  Mux4Machine             mux4m(.muxd(the7SegVal),.adrive(anodeDrives),.A(setA),.B(setB),
                                .C(setC),.D(setD),.clk(clk),.reset(reset),.blank(4'b0000));
  Hex27Seg                hx27s(.Leds(sevenSegmentsa2g),.HexVal(the7SegVal));

  assign  setA = TopHalf ? theRegVal[31:28] : theRegVal[15:12];
  assign  setB = TopHalf ? theRegVal[27:24] : theRegVal[11:8];
  assign  setC = TopHalf ? theRegVal[23:20] : theRegVal[7:4];
  assign  setD = TopHalf ? theRegVal[19:16] : theRegVal[3:0];
    
endmodule
