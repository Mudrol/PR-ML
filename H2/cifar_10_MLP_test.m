function [classes] = cifar_10_MLP_test(x, net)
% Testing MLP
y = net(double(x)');
classes = (vec2ind(y)-1)';
end

