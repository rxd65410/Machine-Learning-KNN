k =0.00025;
x0=38000;
e=2.7182818284590452
t = [0,0,0,1,0,1,0,1,1,1,1,1]
x = [22000, 28000, 30000, 31000, 36000, 39000, 40000, 41000, 41100, 44000, 49000,52000]


logistic = @(x) 1/(1+e^(-k*(x-x0)));
domain = 0:60000;

hold on;
plot(domain,arrayfun(logistic, domain),'-r');
scatter(x,t);


logistic = @(x) 1/(1+e^x);
w=[37000*0.00025,-0.00025];
%w=[x0*k,-k]

m=@(x) logistic(lin_hyp(w,x));
m
plot(domain,arrayfun(m,domain),'-g');
hold off

