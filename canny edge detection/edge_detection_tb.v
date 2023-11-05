module gradient_tb;
reg [215:0] A;
wire  [215:0] GM;
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
A = {24'd96, 24'd81, 24'd90, 24'd77, 24'd118, 24'd138, 24'd90, 24'd135, 24'd132};//1

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
  $display("m1");
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
             
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
 
  #Clock_period; 
    Enable = 0; //reset Enable.
    #Clock_period;
    ///1///
    reset =1 ;
    
    
    #Clock_period;
    reset = 0;
A = {24'd103, 24'd103, 24'd100, 24'd98, 24'd88, 24'd97, 24'd75, 24'd96, 24'd75};//2

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
  $display("m2");
 for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
               
                $display("%d" , matF[i][j]);
              //
 end 
 $display("\n");
 end

 
 
  #Clock_period;
   reset =1;
    Enable = 0; //reset Enable.
    #Clock_period;
    ///2///
    
    #Clock_period;
    reset = 0;
A = {24'd83, 24'd86, 24'd96, 24'd138, 24'd105, 24'd84, 24'd122, 24'd130, 24'd179};//3

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
  $display("m3");
 
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
A = {24'd90, 24'd134, 24'd128, 24'd74, 24'd131, 24'd136, 24'd95, 24'd71, 24'd87};//4

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
   $display("m4");
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
            
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
  

 
  #Clock_period; 
  reset =1 ;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///4///
    #Clock_period;
    reset = 0;
A = {24'd74, 24'd96, 24'd74, 24'd107, 24'd97, 24'd110, 24'd104, 24'd106, 24'd85};//5

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
  $display("m5");
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
              
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
 
 
  #Clock_period; 
  reset = 1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///5///
    #Clock_period;
    reset = 0;
A = {24'd126, 24'd134, 24'd96, 24'd134, 24'd141, 24'd95, 24'd117, 24'd138, 24'd92};//6

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
  $display("m6");
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
              
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
 
  
 
  #Clock_period; 
  reset =1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///6///
    #Clock_period;
    reset = 0;
A = {24'd78, 24'd105, 24'd118, 24'd74, 24'd131,24'd137, 24'd93, 24'd79,24'd104};//7

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
  $display("m7");
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
             
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end


 
  #Clock_period; 
  reset = 1;
   Enable = 0;//reset Enable.
    #Clock_period;
    
    ///7///
    #Clock_period;
    reset = 0;
A = {24'd77, 24'd96, 24'd70, 24'd90, 24'd89, 24'd116, 24'd108, 24'd99, 24'd94};//8

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 $display("m8");
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[( i*3+j)*24+:24];
               
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
 
 
 
  #Clock_period; 
  reset = 1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
    ///8///
    #Clock_period;
    reset = 0;
A = {24'd136, 24'd132, 24'd74, 24'd131, 24'd77, 24'd94, 24'd78, 24'd95, 24'd96};//9

 Enable = 1 ;
 
 wait(done);
 
 #(Clock_period/2);
 
 $display("m9");
  for (i=0 ; i<=2 ; i = i+1) begin 
       for (j=0 ; j<=2 ; j = j+1 ) begin 
              matF[i][j] = GM[(i*3+j)*24+:24];
              
                $display("%d" , matF[i][j]);
              
 end 
 $display("\n");
 end
  


 
  #Clock_period; 
  reset = 1;
    Enable = 0; //reset Enable.
    #Clock_period;
    
  
    $stop;
    end

    always #(Clock_period/2) Clock<= ~Clock;
    
    matrix_mult dut (
    .Clock(Clock),
    .reset(reset),
    .A(A),
    .GM(GM),
    .done(done),
    .Enable(Enable)
    );
    
    
    endmodule
    
