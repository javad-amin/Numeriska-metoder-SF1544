function y = f(x,vm,d)

for i = 1:length(x)
    if x(i) < 0
        y(i) = 0;
    elseif x(i) >=0 && x(i) < d
        y(i) = (vm/d) * x(i);
    elseif x(i) >= d
        y(i) = vm;
    end
end

