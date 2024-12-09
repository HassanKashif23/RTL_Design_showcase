module synchronize
(
    input [15:0]hcount,            //from horizontal controller
    input [15:0]vcount,            //from vertical controller
    output hsync,      
    output vsync,   
    output [15:0]x_loc,          //the position of the horizpntal pixel
    output [15:0]y_loc,            //the position of the vertical pixel
    output video
);

parameter H_display = 640, H_front_porch = 16, H_back_porch = 48, H_sync_width = 96;
parameter V_display = 480, V_front_porch = 10, V_back_porch = 33, V_sync_width = 2;
//video signal is generated when the hcount and vcount are in their visible pixels
assign video = ((hcount < H_display) && (vcount < V_display)) ? 1'b1 : 1'b0 ;

assign x_loc = hcount;
assign y_loc = vcount;
//synchronization signal generation
assign hsync = (hcount >= (H_display + H_front_porch)) && (hcount < (H_display + H_front_porch + H_sync_width)) ? 1'b0 : 1'b1;
assign vsync = (vcount >= (V_display + V_front_porch)) && (vcount < (V_display + V_front_porch + V_sync_width)) ? 1'b0 : 1'b1;


endmodule