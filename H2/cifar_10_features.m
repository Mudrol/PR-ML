function [f] = cifar_10_features(x,N)

    if nargin==1
        mean_r = mean(x(1:1024));
        mean_g = mean(x(1025:2048));
        mean_b = mean(x(2049:3072));

        f = [mean_r mean_g mean_b];
    end

    
    if nargin == 2
       seg = N*N;
       j=1;
       for i = 1:(3072/seg)
           f(i) = mean(x(j:(j+seg-1)));
           j = j + seg;
       end
        
    end
end

