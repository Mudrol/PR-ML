function [net] = cifar_10_MLP_train(tr_data,tr_labels)
MLP_labels = full(ind2vec(double(tr_labels)'+1)); % +1 for index
net = patternnet([100 100]);


inputweightsb = net.IW;
disp('input weights before training')
celldisp(inputweightsb)

layerweightsb = net.LW;
disp('layer weights before training')
celldisp(layerweightsb)

biasesb = net.b;
disp('biases before training')
celldisp(biasesb)

net = train(net,double(tr_data)',MLP_labels);

inputweightsa = net.IW;
disp('input weights after training')
celldisp(inputweightsa)

layerweightsa = net.LW;
disp('layer weights after training')
celldisp(layerweightsa)

biasesa = net.b;
disp('biases after training')
celldisp(biasesa)
end

