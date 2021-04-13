function [accuracy] = cifar_10_evaluate(pred,gt)
% Function computes the classification accuracy for predicted labels
% pred as compared to the ground truth labels gt

accuracy = (sum(pred==gt) / length(pred));