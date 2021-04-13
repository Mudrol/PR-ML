function [labelguess] = cifar_10_1NN(x,tr_data,tr_labels)
tic
tr_data = int16(tr_data);
x = int16(x);

tr_data = abs(tr_data - x);
sumvector = sum(tr_data,2);
[Y,I] = min(sumvector);
labelguess = tr_labels(I);
toc
end

