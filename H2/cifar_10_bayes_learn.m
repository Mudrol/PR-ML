function [mu,sigma,p] = cifar_10_bayes_learn(F,labels)

    tmp = [];
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
        mu(i+1,1:3) = [mu_r mu_g mu_b];

        % standard deviation for class i
        std_r = std(tmp(:,1));
        std_g = std(tmp(:,2));
        std_b = std(tmp(:,3));
        sigma(i+1,1:3) = [std_r std_g std_b];

        % prior probability for class i
        p(i+1) = size(tmp,1)/size(F,1);
        tmp = [];
    end
end

