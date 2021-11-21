//clock divide by 3 RTL code
module clock_divide_by_3 ( 
 input  logic clkin, reset,
 output logic clkout);

 // Add clock divide by 3 code
 
 logic [1:0] cnt_value;
 logic count3_done, r_count3_done;
 
 always_ff@(posedge clkin, posedge reset) begin
 if(reset ==1) begin
 cnt_value <=0;
 end
 
 else begin
 if(cnt_value ==2) begin
 
 count3_done <= 1;
 cnt_value <= 0;
 
 end
 else begin
 
 count3_done <= 0;
 cnt_value <= (cnt_value + 1) % 3;
 
 end
 end
 end
 
 always_ff@(negedge clkin, posedge reset)begin
 if(reset ==1) begin
 
 r_count3_done <= 0;
 
 end
 else begin
 
 r_count3_done <= count3_done;
 
 end
 end
 
 assign clkout = (count3_done | r_count3_done);
 

endmodule: clock_divide_by_3