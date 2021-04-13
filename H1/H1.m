figure;hold on;
axis([0 5 0 5]);
[x,y] = ginput(5);
[a,b] = linfit(x,y);

scatter(x,y,'filled')
plot( 0:5, a.*(0:5)+b )
function [a,b] = linfit(x,y)

b = (sum(y)-(sum(x.*y)*sum(x))/(sum(x.^2)))/(length(x)-(sum(x)).^2/sum(x.^2));
a = (sum(y)-length(x)*b)/sum(x);

end