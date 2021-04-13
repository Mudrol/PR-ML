net = cifar_10_MLP_train(tr_data, tr_labels);
estlabels = cifar_10_MLP_test(te_data, net);
accuracy = cifar_10_evaluate(te_labels, estlabels)

%% mean values
for i = 1:50000
    tr_mean(i,:) = cifar_10_features(tr_data(i,:),8);
end

for i = 1:10000
    te_mean(i,:) = cifar_10_features(te_data(i,:),8);
end
net = cifar_10_MLP_train(tr_mean, tr_labels);
estlabels = cifar_10_MLP_test(te_mean, net);
accuracy = cifar_10_evaluate(te_labels, estlabels)
