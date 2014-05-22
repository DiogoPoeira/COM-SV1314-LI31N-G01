function y = atenuacao(x,alpha)
if abs(alpha)>0.8
    if alpha>0
        alpha = 0.8;
    else
        alpha = -0.8;
    end
end
y = alpha*x;
return