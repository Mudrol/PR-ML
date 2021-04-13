N = 50000; % amount of pictures used
F = [];
for i = 1:N
    F(i,1:3) = cifar_10_features(tr_data(i,:));
end

% train
[mu, sigma, p] = cifar_10_bayes_learn(F,tr_labels);

N = 10000;
F = [];
for i = 1:N
    F(i,:) = cifar_10_features(te_data(i,:));
end
% classify
labels_from_bayes = [];
for i = 1:N 
    labels_from_bayes(i) = cifar_10_bayes_classify(F(i,:),mu,sigma,p)-1;
end
labels_from_bayes = labels_from_bayes';
accuracy = cifar_10_evaluate(labels_from_bayes,te_labels(1:N))
%% Classification via mvnpdf
N = 50000; % amount of pictures used
F = [];
for i = 1:N
    F(i,1:3) = cifar_10_features(tr_data(i,:));
end

% train
[mu, Sigma, p] = cifar_10_bayes_learn_cov(F,tr_labels);

N = 10000;
F = [];
for i = 1:N
    F(i,:) = cifar_10_features(te_data(i,:));
end
% classify
labels_from_bayes = [];
for i = 1:N 
    labels_from_bayes(i) = cifar_10_bayes_classification_cov(F(i,:),mu,Sigma,p)-1;
end
labels_from_bayes = labels_from_bayes';
accuracy = cifar_10_evaluate(labels_from_bayes,te_labels(1:N))

%% Classification with image splitting
ind = 1;
for imagesize = [32 16 8 4]
    matrixsize = 3072/(imagesize^2);

    N = 50000; % amount of pictures used
    F = [];
    for i = 1:N
        F(i,1:matrixsize) = cifar_10_features(tr_data(i,:),imagesize);
    end

    % train
    [mu, Sigma, p] = cifar_10_bayes_learn_cov(F,tr_labels);

    N = 10000;
    F = [];
    for i = 1:N
        F(i,1:matrixsize) = cifar_10_features(te_data(i,:),imagesize);
    end
    % classify
    labels_from_bayes = [];
    for i = 1:N 
        labels_from_bayes(i) = cifar_10_bayes_classification_cov(F(i,:),mu,Sigma,p)-1;
    end
    labels_from_bayes = labels_from_bayes';
    accuracy = cifar_10_evaluate(labels_from_bayes,te_labels(1:N))
    accuracies(ind) = accuracy;
    ind = ind + 1;
end

scatter([32 16 8 4], accuracies,'filled')
text([32 16 8 4],accuracies,string(accuracies))