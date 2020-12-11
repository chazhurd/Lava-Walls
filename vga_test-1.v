#Chaz Hurd & Jose Garcia's Version Of Leap Frog Meets Angry Birds





module vga_test(sysclk, sw, vr, vg, vb, vhs, vvs, led, keyClock, keyData);
	input sysclk;
	input [9:0]sw;
	input keyData;
	input keyClock;
	
	
	output [3:0]vr; //4bit red
	output [3:0]vg; //4bit green
	output [3:0]vb; //4bit blue
	output vhs; //H_sync
	output vvs; //V_sync
	output [9:0]led;
	
	reg [3:0]vr;
	reg [3:0]vg;
	reg [3:0]vb;
	reg vhs;
	reg vvs;
	reg [9:0]led;
	reg [31:0]counter;
	reg [31:0]counter_sub;
	reg [9:0]counterH;
	reg [9:0]counterV;
	
	reg myclk; //25MHz
	reg [9:0]hcounter = 10'b0000000000;
	reg [9:0]vcounter = 10'b0000000000;
	reg ready = 1'b0;
	reg viewable=1'b0;
	reg dead = 1'b0;
	initial viewable=0;
	initial dead=0;
	reg [9:0]oh;
	reg [9:0]ov;
	//reg [1:0] move;
	
	
	cleanClock cleanClock1(sysclk,keyClock,oclk);
	readData readData1(keyData,oclk, left, up, right);
	
	
	initial oh=10;
		initial ov=10;
	//mobject m0(myclk, hcounter, vcounter, viewable,vr,vg,vb);
	
	always@(posedge sysclk) //make 25MHz myclk
	begin
		myclk <= ~myclk;
		if(counter >= 50000000)
		begin
			led[9] <= ~led[9];
			counter = 0;
		end
		counter = counter+1;
		
					
					
		
		
		
		
	end
	
	always@(posedge myclk)
	begin
		//Horizontal
		//if(300 <= hcounter && hcounter <= 350)
	if(dead==0 )
	begin
		
		if ( (0 <= hcounter) && (hcounter<= 640)  && (0 <= vcounter) && (vcounter <= 10) ) 
		begin
			if(ready)
			begin
			viewable=1;
				vr = 4'b1111;
				vg = 4'b0000;
				vb = 4'b0000;
			end
			else
			begin
			viewable=0;
				vr = 4'b0000;
				vg = 4'b0000;
				vb = 4'b0000;
			end
			
		end
		else
		  begin
		  viewable=0;
				vr = 4'b0000;
				vg = 4'b0000;
				vb = 4'b0000;
			end
		
		//border
		if ( (0 <= hcounter) && (hcounter<= 10)  && (0 <= vcounter) && (vcounter <= 480) ) 
		begin
			if(ready)
			begin
			viewable=1;
				vr = 4'b1111;
			end
		
			
		end
		//border
		
		if ( (630 <= hcounter) && (hcounter<= 640)  && (0 <= vcounter) && (vcounter <= 480) ) 
		begin
			if(ready)
			begin
			viewable=1;
				vr = 4'b1111;
			end
		
			
		end
		
		//border
			if ( (0<= hcounter) && (hcounter<= 640)  && (470 <= vcounter) && (vcounter <= 480) ) 
		begin
			if(ready)
			begin
			viewable=1;
				vr = 4'b1111;
			end
		
			
		end
		
		
		
		
		if ( (10<= hcounter) && (hcounter<= 630)  && (10 <= vcounter) && (vcounter <= 470) ) 
		begin
			if(ready)
			begin
			
			
			if(oh>630 || ov>470)
			begin
			oh= 10;
			ov = 10;
			end
				if ( (oh<= hcounter) && (hcounter<= oh+10)  && (ov <= vcounter) && (vcounter <= ov+10) ) 
				begin
					if(ready)
						begin
						vr=4'b0000;
						vg=4'b1111;
						vb=4'b1111;
						end
				
	
				end
			
			
			//if statements for all the vertical lines
		
			if ( (180<= hcounter) && (hcounter<=190 )  && (0 <= vcounter) && (vcounter <= 300) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end
		
			if ( (180<= hcounter) && (hcounter<= 190)  && (400 <= vcounter) && (vcounter <= 470) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end
		
		
		if ( (280<= hcounter) && (hcounter<=290 )  && (0 <= vcounter) && (vcounter <= 200) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end
		
			if ( (280<= hcounter) && (hcounter<= 290)  && (250 <= vcounter) && (vcounter <= 470) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end
			
		if ( (380<= hcounter) && (hcounter<=390 )  && (0 <= vcounter) && (vcounter <= 150) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end
		
			if ( (380<= hcounter) && (hcounter<= 390)  && (200 <= vcounter) && (vcounter <= 470) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end	
			
			
		if ( (480<= hcounter) && (hcounter<=490 )  && (0 <= vcounter) && (vcounter <= 370) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end
		
		if ( (480<= hcounter) && (hcounter<= 490)  && (420 <= vcounter) && (vcounter <= 470) )
			begin
				vr=4'b1111;
				vg=4'b1010;
			
			end	
		end	
		if((oh>=170 && oh<190 && (ov<=290 || ov>=400)))
			begin
				dead=1;
			end
		
		if((oh>=270 && oh<290 && (ov<=190 || ov>=240)))
			begin
				dead=1;
			end
			
		if((oh>=370 && oh<390 && (ov<=140 || ov>=190)))
			begin
				dead=1;
			end
		
		if((oh>=470 && oh<490 && (ov<=360 || ov>=410)))
			begin
				dead=1;
			end
		
	
		
		end //end if ready
		
		
		
		end //end inside the border statement
		
		
		
		
		
		
		
		
		
		
		
			
		
		if(640 <= hcounter && hcounter <= 654)
		begin
		viewable=0;
			vr = 4'b0000;
			vg = 4'b0000;
			vb = 4'b0000;
		end
		else if(655 <= hcounter && hcounter <= 750)
		begin
		viewable=0;
			vr = 4'b0000;
			vg = 4'b0000;
			vb = 4'b0000;
			vhs = 0;
		end
		else if(751 <= hcounter && hcounter <= 798)
		begin
		viewable=0;
			vr = 4'b0000;
			vg = 4'b0000;
			vb = 4'b0000;
			vhs = 1;
		end
		else if(hcounter >= 799)
		begin
			hcounter = -1;
			vcounter = vcounter+1;
			
			if(counterH == 1000)
			begin
				led[7] = ~led[7];
				counterH = 0;
			end
			counterH = counterH+1;
		end
		
		hcounter = hcounter+1;
		
		//Vertical
		if(0 <= vcounter && vcounter <= 479)
		begin
			ready = 1;
			viewable=viewable;
		end
		if(480 <= vcounter && vcounter <= 488)
		begin
			ready = 0;
			viewable=0;
		end
		else if(489 <= vcounter && vcounter <= 490)
		begin
		viewable=0;
			ready = 0;
			vvs = 0;
		end
		else if(491 <= vcounter && vcounter <= 523)
		begin
		viewable=0;
			ready = 0;
			vvs = 1;
		end
		else if(vcounter >= 524)
		begin
		viewable=viewable;
		vcounter = 0;
	
			if(right==1)//D
			begin
			oh = oh +1;
			end
			
		   if(left==1)//A
			begin
			oh= oh-1;
			end
			
			if(up == 1)//W
			begin
				ov = ov-1;
			end
			if(up == 0)
			begin
			ov = ov +1;
			end
			ready = 1;
			
			if(counterV == 100)
			begin
				led[6] = ~led[6];
				counterV = 0;
			end
			counterV = counterV+1;
		end
		
		if(counter_sub >= 50000000)
		begin
			led[8] = ~led[8];
			counter_sub = 0;
		end
		counter_sub = counter_sub+1;
		
	end //end pos edge
	

	
	
	
endmodule



module cleanClock(sysclk,kclk,oclk);
	input sysclk;
	input kclk;
	output reg oclk;
	
	reg [7:0] sr;
	
	
	
	initial
	begin
	sr = 8'b10101010;
	oclk = 1;
	end
	
	
	always@(posedge sysclk)
	begin
	sr={sr[6:0],kclk};
 
	case(sr)
	8'b00000000: oclk = 0;
	8'b11111111: oclk = 1;
	default: oclk = oclk;
	endcase
	
	end
	

endmodule



module readData (kData, oclk, left, up, right);
	input oclk;
	input kData;
	output left;
	output up;
	output right;

		
	reg left = 1'b0;
	initial left= 0;
	
	reg up = 1'b0;
	initial up = 0;
	
	reg right = 1'b0;
	initial right = 0;
	
	reg[7:0] led2;
	reg[11:0] counter;

	
	initial counter = 0;
	
	
	
	
	always@(negedge oclk)
	begin
	case(counter)
	0:;
	1:led2[0] = kData; ///read keyData
	2:led2[1] = kData;///read Keydata
	3:led2[2] = kData; // read keyData
	4:led2[3] = kData; //read keyData
	5:led2[4] = kData; // read keyData
	6:led2[5] = kData; // read keyData
	7:led2[6] = kData; // read keyData
	8:led2[7] = kData; // read keyData
	9:; //read keyData
	10: begin
	led2 = led2;
	if(led2[7:0]==8'b00011100)	//A key pressed
	begin
	left = 1;
	up = 0;
	right = 0;
	end
	
	if(led2[7:0]==8'b00100011) //D key pressed
	begin
	up = 0;
	left = 0;
	right = 1;
	end
	
	if(led2[7:0]==8'b00011101) //W key pressed
	begin
	up = 1;
	right = 0;
	left = 0;
	end
	
	
	end
	endcase
	

	
	
	
	
	
	if( counter<10 )
     counter = counter + 1;
 else if( counter >= 10 )
     counter = 0;
	end
	
	
endmodule 









