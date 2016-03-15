data = load('glplotdata.txt');
data2 = load('glplotdata.txt');


usersqty = data(:,3);
utilities = data(:,1);
running_time = data(:,2);
running_time_gls = data2(:,2);

usersqty_conf = [];
running_time_conf = [];
running_time_conf_gls = [];
ym1 = [];
yp1 = [];

ym2 = [];
yp2 = [];

for i = 1:6

[mu, upper, lower] = confidenceint(utilities(i*20-19:i*20));

[mu1, upper1, lower1] = confidenceint(running_time(i*20-19:i*20));

[mu3, upper3, lower3] = confidenceint(running_time_gls(i*20-19:i*20));

[mu2, upper2, lower2] = confidenceint(usersqty(i*20-19:i*20));


utilities_conf(i) = mu;
running_time_conf(i) = mu1;

running_time_conf_gls(i) = mu3;
usersqty_conf(i) = mu2;

ym(i) = (mu - lower);
yp(i) = (upper - mu);

ym1(i) = (mu1 - lower1);
yp1(i) = (upper1 - mu1);

ym2(i) = (mu3 - lower3);
yp2(i) = (upper3 - mu3);


end


x = usersqty_conf;
y = utilities_conf;


x1 = usersqty_conf
y1 = running_time_conf

y2 = running_time_conf_gls





h1 = errorbar(x1,y1,yp1,ym1);

%hold on;

%h2 = errorbar(x1,y2,yp2,ym2);

%hold off;
xlabel ('Number of customers');



%h = ylabel ('\alpha');
ylabel ('Running time (in seconds)');
%title ('Sids algorithms results ');
%legend("Greedy Utility","Sid's algorithm", "Greedy Demand");
%legend("Sid's algorithm","Greedy Utility","Greedy Demand");
%legend location northeastoutside
%axis ("tic");
%print('maximize_utility_number_of_users_3.jpg', '-djpg');
%print('running_time_number_of_users.jpg', '-djpg');



