function MConcat = concateEvenColumns(M)
MConcat = (M(:,2:2:length(M)));
MConcat = MConcat(:);
end
