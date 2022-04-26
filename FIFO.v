module FIFO(
input CLK,
input RST,
input [7:0]DATA_INPUT,
input BTN_WRITE,
input BTN_READ,
output reg [7:0]DATA_OUT,
output reg FULL,
output reg EMPTY
);


reg [1:0]CT_HEAD = 0;
reg [1:0]CT_TAIL = 0;
reg [7:0]FIFO[0:3];

initial begin
	EMPTY = 1;
	FULL = 0;
end

always@(posedge CLK, posedge RST)
begin
	if(RST)
	begin
		CT_HEAD = 0;//write
		CT_TAIL = 0;//read
		EMPTY = 1;
		FULL = 0;
	end
	
	else if(BTN_WRITE && FULL != 1)
	begin
		FIFO[CT_HEAD] = DATA_INPUT;
		CT_HEAD = CT_HEAD + 1;
			if(FIFO[CT_HEAD] == FIFO[CT_TAIL])
			begin
				FULL = 1;
				EMPTY = ~FULL;
			end
			else begin
				FULL = 0;
				EMPTY = 0;
			end
	end
	
	else if(BTN_READ && EMPTY != 1)
	begin
		DATA_OUT = FIFO[CT_TAIL];
		CT_TAIL = CT_TAIL + 1;
			if(FIFO[CT_TAIL] == FIFO[CT_HEAD]) 
			begin
				EMPTY = 1;
				FULL = ~EMPTY;
			end
			else begin
				FULL = 0;
				EMPTY = 0;
			end
	end
	
end



endmodule