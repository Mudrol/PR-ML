%testscript :-)

for i = 1:size(te_data)
    test(i) = cifar_10_rand(te_data(i,:));
end
cifar_10_evaluate(test',te_labels)