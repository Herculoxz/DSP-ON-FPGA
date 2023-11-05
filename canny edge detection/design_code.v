//This code is for following canny edge detection steps - 1) gaussian smoothing , 2) gradient modulus calculation , 3) double thresholding 

// A is the input image array of 9x9 matrix and GM is the output of the double thresholded image array 

// each matrix consists of 9 elements , each 24 bits wide.



module matrix_mult(
       input Clock,
        input reset, 
        input Enable,    
        input [215:0] A,
        output reg [215:0] GM,
        output reg done     
    );   


reg signed [23:0] matA [2:0][2:0];
reg signed [23:0] matB [2:0][2:0];
reg signed [23:0] matC [2:0][2:0];
reg signed [23:0] matD [2:0][2:0];
reg signed [23:0] matE [2:0][2:0];
reg signed [23:0] matF [2:0][2:0];
reg signed [23:0] matD1[2:0][2:0];
reg signed [23:0] matE1[2:0][2:0];
reg signed [23:0] matM1[2:0][2:0];
reg signed [23:0] matM2[2:0][2:0];
reg signed [215:0] B;
reg signed [215:0] Gx;
reg signed [215:0] Gy;

integer i,j,k;  
reg first_cycle;    
reg end_of_mult_1;
reg end_of_mult_2;
reg end_of_mult_3;
reg end_of_mult_4;
reg end_of_mult_5;
reg end_of_mult_6;
reg signed [47:0] temp_1;
reg signed [47:0] temp_2;
reg signed [47:0] temp_3;
reg signed [47:0] temp_4;
reg signed [47:0] temp_5;
reg signed [47:0] temp_6;

parameter highThreshold = 10000;
parameter lowThreshold = 2000;
initial 
begin 
$dumpfile("dump.vcd");
$dumpvars( 0, matrix_mult);
end
always @(posedge Clock or posedge reset)    
begin
    if(reset == 1) begin    
        i = 0;
        j = 0;
        k = 0;
        temp_1 = 0;
        temp_2 = 0;
        temp_3 = 0;
        temp_4 = 0;
          temp_5 = 0;
            temp_6 = 0;
        first_cycle = 1;
        end_of_mult_1=0;
        end_of_mult_2=0;
          end_of_mult_3=0;
            end_of_mult_4=0;
            end_of_mult_5=0;
            end_of_mult_6=0;
        done = 0;
       
        for(i=0;i<=2;i=i+1) begin
            for(j=0;j<=2;j=j+1) begin
                matA[i][j] = 24'd0;
                matB[i][j] = 24'd0;
                matC[i][j] = 24'd0;
                matD[i][j] = 24'd0;
                matE[i][j] = 24'd0;
                matF[i][j] = 24'd0;
                matM1[i][j] = 24'd0; 
                matM2[i][j] = 24'd0; 
                matD1[i][j] = 24'd0;  
                matE1[i][j] = 24'd0;  
            end 
        end 
    end
    else
     begin  
        if(Enable == 1)  begin   
            if(first_cycle == 1) begin   
                B = {24'd1,24'd2,24'd1,24'd2,24'd4,24'd2,24'd1,24'd2,24'd1};
                Gx = {24'd1,24'd0,-24'd1,24'd2,24'd0,-24'd2,24'd1,24'd0,-24'd1};
                Gy = {24'd1,24'd2,24'd1,24'd0,24'd0,24'd0,-24'd1,-24'd2,-24'd1};
 
                for(i=0;i<=2;i=i+1) begin
                    for(j=0;j<=2;j=j+1) begin
                        matA[i][j] = A[(i*3+j)*24+:24];
                        matB[i][j] = B[(i*3+j)*24+:24];
                        matC[i][j] =  24'd0;  
                        matD[i][j] = Gx[(i*3+j)*24+:24];
                        matE[i][j] = Gy[(i*3+j)*24+:24];
                        matF[i][j] = 24'd0;
                           matM1[i][j] = 24'd0;
                              matM2[i][j] = 24'd0;
                        matD1[i][j] = 24'd0; 
                        matE1[i][j] = 24'd0;  
                    end 
                end
      
                first_cycle = 0;
                end_of_mult_1=0;
                end_of_mult_2=0;
                end_of_mult_3=0;
                end_of_mult_4=0;
                end_of_mult_5=0;
                end_of_mult_6=0;
                temp_1 = 0;
                temp_2 = 0;
                temp_3 = 0;
                temp_4 = 0;
                temp_5 = 0;
                temp_6 = 0;
                i = 0;
                j = 0;
                k = 0;
            end
            else if(end_of_mult_1 == 0 && end_of_mult_2 ==0 && end_of_mult_3 ==0&& end_of_mult_4 ==0&& end_of_mult_5 ==0 && end_of_mult_6 ==0) begin    
                temp_1 = matA[i][k]*matB[k][j];
                matC[i][j] = matC[i][j] + temp_1[23:0];  
               
                if(k == 2) begin
                    k = 0;
                    if(j == 2) begin
                        j = 0;
                        if (i == 2) begin
                            i = 0;
                            end_of_mult_1= 1;
                        end
                        else
                            i = i + 1;
                    end
                    else
                        j = j+1;    
                end
                else
                    k = k+1;
            end

            else if(end_of_mult_1 == 1 && end_of_mult_2 ==0 && end_of_mult_3 ==0&& end_of_mult_4 ==0&& end_of_mult_5 ==0 && end_of_mult_6 ==0) begin     
            // smoothing with Gx
            temp_2 = matC[i][k]*matD[k][j];
            matD1[i][j] = matD1[i][j] + temp_2[23:0];
            if(k == 2) begin
                    k = 0;
                    if(j == 2) begin
                        j = 0;
                        if (i == 2) begin
                            i = 0;
                            end_of_mult_2= 1;
                        end
                        else
                            i = i + 1;
                    end
                    else
                        j = j+1;    
                end
                else
                    k = k+1;
            end
            
          
            else if ( end_of_mult_1 ==1 && end_of_mult_2 ==1 && end_of_mult_3 ==0 && end_of_mult_4 ==0&& end_of_mult_5 ==0 && end_of_mult_6 ==0) begin
            
            // smoothing with Gy
            temp_3 = matC[i][k]*matE[k][j];
            matE1[i][j] = matE1[i][j] + temp_3[23:0];
    if(k == 2) begin
                    k = 0;
                    if(j == 2) begin
                        j = 0;
                        if (i == 2) begin
                            i = 0;
                            end_of_mult_3= 1;
                        end
                        else
                            i = i + 1;
                    end
                    else
                        j = j+1;    
                end
                else
                    k = k+1;
            end
         
                  else if ( end_of_mult_1 ==1 && end_of_mult_2 ==1 && end_of_mult_3 ==1 && end_of_mult_4 ==0 && end_of_mult_5 ==0 && end_of_mult_6 ==0) begin
          
            temp_5 = matE1[i][k]*matE1[k][j];
            matM1[i][j] = matM1[i][j] + temp_5[23:0];
    if(k == 2) begin
                    k = 0;
                    if(j == 2) begin
                        j = 0;
                        if (i == 2) begin
                            i = 0;
                            end_of_mult_4 = 1;
                        end
                        else
                            i = i + 1;
                    end
                    else
                        j = j+1;    
                end
                else
                    k = k+1;
            end
         
                   else if ( end_of_mult_1 ==1 && end_of_mult_2 ==1 && end_of_mult_3 ==1 && end_of_mult_4 ==1 && end_of_mult_5 ==0 && end_of_mult_6 ==0) begin
            
            // smoothing with Gy
            temp_6 = matD1[i][k]*matD1[k][j];
            matM2[i][j] = matM2[i][j] + temp_6[23:0];
    if(k == 2) begin
                    k = 0;
                    if(j == 2) begin
                        j = 0;
                        if (i == 2) begin
                            i = 0;
                            end_of_mult_5= 1;
                        end
                        else
                            i = i + 1;
                    end
                    else
                        j = j+1;    
                end
                else
                    k = k+1;
            end
            
      
           else if ( end_of_mult_1 ==1 && end_of_mult_2 ==1 && end_of_mult_3 ==1 && end_of_mult_4 ==1&& end_of_mult_5 ==1 && end_of_mult_6 ==0) begin
            temp_4 = $sqrt ( matM1[i][j]+ matM2[i][j] );
            matF[i][j] = matF[i][j] + temp_4[23:0];
    if(k == 2) begin
                    k = 0;
                    if(j == 2) begin
                        j = 0;
                        if (i == 2) begin
                            i = 0;
                            end_of_mult_6= 1;
                        end
                        else
                            i = i + 1;
                    end
                    else
                        j = j+1;    
                end
                else
                    k = k+1;
            end
           
            
      else if (  end_of_mult_1 ==1 && end_of_mult_2 ==1 && end_of_mult_3 ==1 && end_of_mult_4 ==1 && end_of_mult_5 ==1 && end_of_mult_6 ==1) begin
                for(i=0;i<=2;i=i+1) begin  
                    for(j=0;j<=2;j=j+1) begin   
                      
                   GM[(i*3+j)*24+:24] = matF[i][j];
                        
                   if (matF[i][j] >= highThreshold)
     GM[(i*3+j)*24+:24] = 255;
    else if (matF[i][j] >= lowThreshold)
      GM[(i*3+j)*24+:24] = 128;
    else
    GM[(i*3+j)*24+:24]= 0;
                   
                           
                    end
                end   
                done = 1;  
            end
    end
end 
end 


endmodule 


