function [ a,b ] = p_Pivot( a, b, n )
%Performs Partial Pivoting on the coefficient matrix and b-vector
%   Called by gauss_Seidel.m before it solves the system 

    for k = 1:(n-1)
        
        pivot_row = k;
        max = abs(a(k,k));

%determines the row with the largest value in the pivot column
        for i = k+1:n
           
            val = abs(a(i,k));
            
            if (val > max)
               max = val;
               pivot_row = i;
            end
            
            %don't switch a zero into a lower row - could be adding it to
            %the diagonal
            
            for l = 1:n
                if a(k,l) == 0
                    pivot_row = k;
                end 
            end 
            
        end
        
%switches pivot row with the row containing the largest value if necessary
        if (pivot_row ~= k)
            
            for j = k:n
                hold = a(pivot_row,j);
                a(pivot_row,j) = a(k,j);
                a(k,j) = hold;
            end 
            
            holdb = b(pivot_row);
            b(pivot_row) = b(k);
            b(k) = holdb;
            
        end
        
    end

end

