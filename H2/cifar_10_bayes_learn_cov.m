function [mu,Sigma,p] = cifar_10_bayes_learn_cov(F,labels)
    Sigma = [];
    tmp = [];
    k = 1;
    for i = 0:9
        for j = 1:size(F,1)
            if labels(j) == i
                tmp = [tmp;F(j,:)]; % Lis‰t‰‰n tmp:n F(j)
            end
        end
        % mean value for class i
        mu_r = mean(tmp(:,1));
        mu_g = mean(tmp(:,2));
        mu_b = mean(tmp(:,3));
        for a = 1:size(F,2)
            mu(i+1,a) = mean(tmp(:,a));
        end
        % standard deviation for class i
        Sigma(k:(k+(size(F,2)-1)),:) = cov(tmp);
        k = k+size(F,2);
        % prior probability for class i
        p(i+1) = size(tmp,1)/size(F,1);
        tmp = [];
    end
end

