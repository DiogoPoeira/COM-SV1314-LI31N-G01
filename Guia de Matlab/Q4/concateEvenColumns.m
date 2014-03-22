function MConcat = concateEvenColumns(M)
vetor_size = length(M(:,1));
columns = length(M(1,:));
if mod(columns,2)==0
    columns = columns/2;
else
    columns = (columns-1)/2;
end
MConcat = zeros(vetor_size*columns,1);
for i = 2:2:columns*2
    for j = 1:vetor_size
     MConcat(((i-2)/2 * vetor_size)+j,1) = M(j,i);
    end
end
end