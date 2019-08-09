function [ x ] = gauss_Seidel( a, b, n, x, max_i, stop_error, lambda )
%Performs Gauss-Seidel Iterative Solution to solve system of linear eqations 
%defined by coefficient matrix a and vectors x_in,b 

    iteration = 1;
    done = false;
    x_in = x;  %used for output message
    
%Applies partial pivoting to improve solution reliability 
    [a1,b1] = p_Pivot(a,b,n);
    

%First iteration - no relaxation factor used
    for i = 1:n

        diagonal = a1(i,i);

        for j = 1:n
            a1(i,j) = a1(i,j)/diagonal;
        end
        
        b1(i) = b1(i)/diagonal;

    end 
    
    for i = 1:n
        
        row_sum = b1(i);
        
        for j = 1:n
            if (j ~= i)
                row_sum = row_sum - a1(i,j)*x(j);
            end 
        end
        
        x(i) = row_sum;
        
    end 
    
    
%continue iterating until either maximum iterations or error limit reached
    while (done == false)
        
        iteration = iteration+1;
        max_error = 0;
        
        for i = 1:n
            
            prev = x(i);
            row_sum = b1(i);
            
            for j = 1:n
                if (j ~= i)
                    row_sum = row_sum - a1(i,j)*x(j);
                end 
            end
            
            x(i) = lambda*row_sum + (1-lambda)*prev;
            
            if x(i) ~= 0  
                error = abs((x(i)-prev)/x(i))*100;
            else 
                error = stop_error;
            end
            
            if error > max_error
                max_error = error;
            end
            
        end    
        
        if (max_error <= stop_error || iteration >= max_i)
            done = true;
        end
        
    end 
    
    fprintf('Using a lambda value of %1.1f', lambda);
    fprintf(' and an intial guess of g = ');
    for i = 1:n
        fprintf('%4.0f',x_in(n));
    end
    fprintf('. The solution took %1.0f', iteration);
    fprintf(' iterations to converge:\n');

end

