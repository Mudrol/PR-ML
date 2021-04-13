function [c] = cifar_10_bayes_classify(f, mu, sigma, p)

    posterior = [];
    for cl = 1:10
        posterior(cl) = normpdf(f(1),mu(cl,1),sigma(cl,1))*...
            normpdf(f(2),mu(cl,2),sigma(cl,2))*...
            normpdf(f(3),mu(cl,3),sigma(cl,3))*p(cl);
    end
    [M,c] = max(posterior);
end

