function y = channel(x,alpha,SNe,model)
switch model
    case 1
        y = atenuacao(x,alpha);
    case 2
        y = ruido(x,SNe);
    case 3
        y = atenuacao(x,alpha);
        y = ruido(y, SNe);
    otherwise
end
return