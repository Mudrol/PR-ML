function [classes] = cifar_10_MLP_test(x, net)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
y = net(double(x)');
classes = (vec2ind(y)-1)';
end

