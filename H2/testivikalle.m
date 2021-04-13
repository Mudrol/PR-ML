for i = 1:10000
    labelguessv(i) = cifar_10_1NN(te_data(i,:),tr_data,tr_labels);
end

cifar_10_evaluate(labelguessv',te_labels)
%first test -> 38.59%