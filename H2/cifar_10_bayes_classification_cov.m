function [c] = cifar_10_bayes_classification_cov(f, mu, Sigma, p)
    
    posterior = [];
    j = 1;
    for cl = 1:10
        posterior(cl) = mvnpdf(f,mu(cl,:),Sigma(j:(j+size(f,2)-1),:))*p(cl);
        j=j+size(f,2);
    end
    [M,c] = max(posterior);
end

