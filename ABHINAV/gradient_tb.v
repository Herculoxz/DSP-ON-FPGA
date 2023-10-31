module gradient_tb;
reg [215:0] A;
wire  [215:0] GM;
//reg [215:0] GM_T;
//wire  [215:0] img_result;
wire done ;
reg [23:0] matF[2:0][2:0];
integer i,j;
parameter Clock_period = 10;
reg Clock , reset , Enable = 0;
initial 
begin


Clock =1;
reset =1 ;
#100;

reset = 0;
#Clock_period;
A = {24'd0, 24'd0, 24'd253, 24'd154, 24'd3, 24'd153, 24'd253, 24'd2, 24'd0};//1
 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
    Enable = 0; //reset Enable.
    #Clock_period;
    ///1///
    reset =1 ;
    
    
    #Clock_period;
    reset = 0;
A = {24'd0, 24'd82, 24'd255, 24'd253, 24'd91, 24'd1, 24'd0, 24'd198, 24'd0};//2

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
 for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              //
 end 
 $display("\n");
 end
 
 //Enable_thresholding = 1;
 
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period;
   reset =1;
    Enable = 0; //reset Enable.
    #Clock_period;
    ///2///
    
    #Clock_period;
    reset = 0;
A = {24'd210, 24'd254, 24'd255, 24'd147, 24'd252, 24'd255, 24'd1, 24'd253, 24'd118};//3

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
  reset = 1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///3///
    #Clock_period;
    reset = 0;
A = {24'd255, 24'd255, 24'd255, 24'd255, 24'd254, 24'd177, 24'd255, 24'd255, 24'd255};//4

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
  reset =1 ;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///4///
    #Clock_period;
    reset = 0;
A = {24'd130, 24'd32, 24'd255, 24'd255, 24'd254, 24'd255, 24'd255, 24'd101, 24'd119};//5

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
  reset = 1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///5///
    #Clock_period;
    reset = 0;
A = {24'd255, 24'd253, 24'd0, 24'd0, 24'd1, 24'd1, 24'd0, 24'd255, 24'd254};//6

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
  reset =1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///6///
    #Clock_period;
    reset = 0;
A = {24'd0, 24'd4, 24'd254, 24'd219, 24'd2, 24'd223, 24'd251, 24'd2, 24'd0};//7

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
  reset = 1;
   Enable = 0;//reset Enable.
    #Clock_period;
    
    ///7///
    #Clock_period;
    reset = 0;
A = {24'd0, 24'd0, 24'd0, 24'd252, 24'd255, 24'd255, 24'd0, 24'd60, 24'd0};//8

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
  reset = 1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///8///
    #Clock_period;
    reset = 0;
A = {24'd0, 24'd0, 24'd0, 24'd0, 24'd252, 24'd45, 24'd219, 24'd0, 24'd0};//9

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
   //always @() begin
    //$display("GM = %d, GM = %d", GM, GM);
  //end

 
  #Clock_period; 
  reset = 1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
   //always @(img_result) 
  // begin
    //$display("GM_T = %d, img_result  = %d", GM_T, img_result );
 // end
 //#Clock_period;
 //Enable_thresholding = 0;
   // $stop;
    //end

    //always #(Clock_period/2) Clock<= ~Clock;
    end
    matrix_mult dut (
    .Clock(Clock),
    .reset(reset),
    .A(A),
    .GM(GM),
    .done(done),
    .Enable(Enable)
    );
    
 /* double_thresholding uut (
    .GM_T(GM),
    .img_result(img_result),
    .Enable_thresholding(Enable_thresholding)
  );*/
    
    
    endmodule
    
