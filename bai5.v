module bai5 (SW, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
    input [0:0]SW;
    input CLOCK_50;
    output reg [6:0]HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

    parameter start = 4'b0000;
    parameter s0    = 4'b0001;
    parameter s1    = 4'b0010;
    parameter s2    = 4'b0011;
    parameter s3    = 4'b0100;
    parameter s4    = 4'b0101;
	 parameter s5    = 4'b0110;
	 parameter s6    = 4'b0111;
    parameter s7    = 4'b1000; 
  
    reg [3:0]current_state, next_state;
    integer q;
    reg clock_1s = 1'b0;
  
    always @ (*)
    begin
        HEX4 = 7'b1111111;
        HEX5 = 7'b1111111;
        HEX6 = 7'b1111111;
        HEX7 = 7'b1111111;
    end
  
    always @ (posedge CLOCK_50)
    begin
        q = q + 1;
        if (q == 12499999) 
        begin 
            clock_1s = ~clock_1s;
            q = 0;
        end
    end
    
    always @ (*)
    begin
        case (current_state)
				start:next_state=s0;
            s0 : next_state = s1;
            s1 : next_state = s2;
            s2 : next_state = s3;
            s3 : next_state = s4;
            s4 : next_state = s5;
			   s5 : next_state = s6;
			   s6 : next_state = s7;
			   s7 : next_state = s0;
            default: next_state = start;
        endcase
    end
    
    always @ (posedge clock_1s or posedge SW[0])
    begin
        if (SW[0]) current_state <= start;
        else current_state <= next_state;
    end
    
    always @ (*)
    begin
        case (current_state)
				start: begin HEX0 = 7'b1111111; HEX1 = 7'b1111111; HEX2 = 7'b1111111; HEX3 = 7'b1111111; end // ____
            s0: begin HEX0 = 7'b0001000; HEX1 = 7'b0000010; HEX2 = 7'b0001100; HEX3 = 7'b0001110; end // FPGA
            s1: begin HEX0 = 7'b0000010; HEX1 = 7'b0001100; HEX2 = 7'b0001110; HEX3 = 7'b1111111; end // _FPG
            s2: begin HEX0 = 7'b0001100; HEX1 = 7'b0001110; HEX2 = 7'b1111111; HEX3 = 7'b1111111; end // __FP
            s3: begin HEX0 = 7'b0001110; HEX1 = 7'b1111111; HEX2 = 7'b1111111; HEX3 = 7'b1111111; end // ___F
            s4: begin HEX0 = 7'b1111111; HEX1 = 7'b1111111; HEX2 = 7'b1111111; HEX3 = 7'b1111111; end // ____
				s5: begin HEX3 = 7'b0001000; HEX2 = 7'b1111111; HEX1 = 7'b1111111; HEX0 = 7'b1111111; end // A___
				s6: begin HEX3 = 7'b0000010; HEX2 = 7'b0001000; HEX1 = 7'b1111111; HEX0 = 7'b1111111; end // GA__
				s7: begin HEX3 = 7'b0001100; HEX2 = 7'b0000010; HEX1 = 7'b0001000; HEX0 = 7'b1111111; end // PGA_
        endcase
    end
endmodule