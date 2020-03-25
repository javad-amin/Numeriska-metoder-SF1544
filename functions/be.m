function x = Backward_Euler(x,h,g,vm,d,niter)

for n = 1:size(x,2)        
    for i = size(x,1):-1:1
        if i ~= size(x,1) 
            x = fixed_point(x,h,g,vm,d,i,n,niter);   
        else
            x(i,n+1) = x(i,n) + h * g;
        end
    end
end

