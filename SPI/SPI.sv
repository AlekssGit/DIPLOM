
module SPI(
input clk,
input miso,
input  [dataActualL - 1 :0] i_data,
output [dataActualL - 1:0] o_data,
output cs,
output mosi,
output sclk,
output [4:0] helpCnt
);

parameter [1:0] mode = 2'b01; //mode[1] - cpol, mode[0] - cpha
parameter dataLength = 16;
parameter dataActualL = 16;
parameter cs1Length = 3;

enum int unsigned {s_idle, s_work} state, state_next;

reg [4:0] cnt = 0;
reg [2:0] cntIdl = 0;
reg  workClock;
reg test;

assign workClk = test;

always@(posedge workClk)
begin
	if(state == s_work)
	begin
		cnt ++;
		cntIdl = 0;
	end
	else
	begin
		cnt = 0;
		cntIdl++;
	end
end

always@(posedge workClk)
begin
	case(state)
		s_idle:
		begin
			cs = 1'b1;
			o_data = 16'hz;
		end
		
		s_work:
		begin
			cs = 1'b0;
			o_data = {o_data[14:0], miso};
		end
	endcase
end

always@(posedge workClk)
begin
	state = state_next;
end

always_comb
begin

	case(mode)
		2'b00: test = ~clk;
		2'b01: test = clk;
		2'b10: test = ~clk;
		2'b11: test = clk;	
	endcase
	
	case(state)
		s_idle: 
		begin
			state_next = (cntIdl == cs1Length - 1) ? s_work : s_idle;
		end
		s_work: 
		begin
			state_next = (cnt == dataLength-1) ? s_idle : s_work;
		end
	endcase

end

assign sclk = (state == s_work)? ((mode[1] == 0) ? clk: ~clk):((mode[1] == 0) ? 0:1);

assign helpCnt = cnt;

endmodule