
module matrix_mult
    (   input Clock,
        input reset, 
        input Enable,    
        input [71:0] A,
        input [71:0] B,
        output reg [71:0] C,
        output reg done     
    );   


reg signed [7:0] matA [2:0][2:0];
reg signed [7:0] matB [2:0][2:0];
reg signed [7:0] matC [2:0][2:0];
integer i,j,k;  
reg first_cycle;    
reg end_of_mult;    
reg signed [15:0] temp;

always @(posedge Clock or posedge reset)    
begin
    if(reset == 1) begin    
        i = 0;
        j = 0;
        k = 0;
        temp = 0;
        first_cycle = 1;
        end_of_mult = 0;
        done = 0;
       
        for(i=0;i<=2;i=i+1) begin
            for(j=0;j<=2;j=j+1) begin
                matA[i][j] = 8'd0;
                matB[i][j] = 8'd0;
                matC[i][j] = 8'd0;
            end 
        end 
    end
    else begin  
        if(Enable == 1)    
            if(first_cycle == 1) begin   
                
                for(i=0;i<=2;i=i+1) begin
                    for(j=0;j<=2;j=j+1) begin
                        matA[i][j] = A[(i*3+j)*8+:8];
                        matB[i][j] = B[(i*3+j)*8+:8];
                        matC[i][j] = 8'd0;
                    end 
                end
      
                first_cycle = 0;
                end_of_mult = 0;
                temp = 0;
                i = 0;
                j = 0;
                k = 0;
            end
            else if(end_of_mult == 0) begin    
                temp = matA[i][k]*matB[k][j];
                matC[i][j] = matC[i][j] + temp[7:0];    
                if(k == 2) begin
                    k = 0;
                    if(j == 2) begin
                        j = 0;
                        if (i == 2) begin
                            i = 0;
                            end_of_mult = 1;
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
            else if(end_of_mult == 1) begin     
                for(i=0;i<=2;i=i+1) begin  
                    for(j=0;j<=2;j=j+1) begin    
                        C[(i*3+j)*8+:8] = matC[i][j];
                    end
                end   
                done = 1;  
            end
    end
end

// $display( "matrix_C : %d" , matC);
 initial begin
    // Initialize matC (assuming it's declared and populated elsewhere in your code)
    // ...

    // Display the elements of matC
    $display("matrix_C:");
            $display("matC[%0d][%0d] : %d", i, j, matC[i][j]);
        end
    end
end

endmodule
