data = load('sidplotdata.txt');
datautility = load('grplotdata.txt');
datademand = load('grplotdata.txt');
dataratio = load('grplotdata.txt');



usersqty = data(:,2);
gu_usersqty = datautility(:,2);
gd_usersqty = datademand(:,2);
gr_usersqty = dataratio(:,2);

total_utility = data(:,2);


utilities = data(:,1);
gu_utilities = datautility (:,1);
gd_utilities = datademand  (:,1);
gr_utilities = dataratio(:,1)*1000;


running_time = data(:,1);
gu_running_time = datautility(:,2);
gd_running_time = datademand(:,2);
gr_running_time =  dataratio(:,1);


for i = 1:6
[mu, upper, lower] = confidenceint(utilities(i*20-19:i*20));
[gu_mu, gu_upper, gu_lower] = confidenceint(gu_utilities(i*20-19:i*20));
[gd_mu, gd_upper, gd_lower] = confidenceint(gd_utilities(i*20-19:i*20));
[gr_mu, gr_upper, gr_lower] = confidenceint(gr_utilities(i*20-19:i*20));
[mu1, upper1, lower1] = confidenceint(running_time(i*20-19:i*20));
[gu_mu1, gu_upper1, gu_lower1] = confidenceint(gu_running_time(i*20-19:i*20));
[gd_mu1, gd_upper1, gd_lower1] = confidenceint(gd_running_time (i*20-19:i*20));
[gr_mu1, gr_upper1, gr_lower1] = confidenceint(gr_running_time (i*20-19:i*20));

[mut, uppert, lowert] = confidenceint(total_utility(i*20-19:i*20));
total_utility_conf(i) = mut;

[mu2, upper2, lower2] = confidenceint(usersqty(i*20-19:i*20));
usersqty_conf(i) = mu2;

utilities_conf(i) = mu;
gu_utilities_conf(i) = gu_mu;
gd_utilities_conf(i) = gd_mu;
gr_utilities_conf(i) = gr_mu;
running_time_conf(i) = mu1;
gu_running_time_conf(i) = gu_mu1;
gd_running_time_conf(i) = gd_mu1;
gr_running_time_conf(i) = gr_mu1;
ym(i) = (mu - lower);
yp(i) = (upper - mu);
gu_ym(i) = (gu_mu - gu_lower);
gu_yp(i) = (gu_upper - gu_mu);
gd_ym(i) = (gd_mu - gd_lower);
gd_yp(i) = (gd_upper - gd_mu);
gr_ym(i) = (gr_mu - gr_lower);
gr_yp(i) = (gr_upper - gr_mu);
ym1(i) = mu1 - lower1;
yp1(i) = upper1 - mu1;
gu_ym1(i) = gu_mu1 - gu_lower1;
gu_yp1(i) = gu_upper1 - gu_mu1;
gd_ym1(i) = gd_mu1 - gd_lower1;
gd_yp1(i) = gd_upper1 - gd_mu1;
gr_ym1(i) = gr_mu1 - gr_lower1;
gr_yp1(i) = gr_upper1 - gr_mu1;
end


gu_x = usersqty_conf;
gu_y = gu_utilities_conf;
gd_x = usersqty_conf;
gd_y = gd_utilities_conf;
gr_x = usersqty_conf;
gr_y = gr_utilities_conf;
x = usersqty_conf;
y = utilities_conf;




x1 = usersqty_conf;
y1 = running_time_conf;
gu_x1 = usersqty_conf;
gu_y1 = gu_running_time_conf;
gd_x1 = usersqty_conf;
gd_y1 = gd_running_time_conf;
gr_x1 = usersqty_conf;
gr_y1 = gr_running_time_conf;
%h2 = errorbar(x1,y1,yp1,ym1)


t = figure;

%subplot(2,2,1)
%h2 = errorbar(gu_x,gu_y,gu_yp,gu_ym);
%set(h2,'color',[0 1 1])
%set(h2,'linewidth',2);
%errorbar(gu_x,gu_y,gu_yp,gu_ym)
%hold on;
%xlabel ('Number of users');
%title ('Greedy Utility Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.78,0.945])

%hold on;
%h1 = errorbar(x1,y1,yp1,ym1);
%h1 = errorbar(gu_x1,gu_y1,gu_yp1,gu_ym1)
%set(h1,'color','blue')
%set(h1,'linewidth',2);
%hold off;
%hold on;
%subplot(2,2,2)
%h3 = errorbar(gd_x,gd_y,gd_yp,gd_ym);
%h3 = errorbar(gd_x1,gd_y1,gd_yp1,gd_ym1)
%set(h3,'color','green')
%set(h3,'linewidth',2);
%errorbar(gd_x,gd_y,gd_yp,gd_ym)
%hold off;
%hold on;
%xlabel ('Number of users');
%title ('Greedy Demand Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.78,0.945])

%subplot(2,2,3)
errorbar(gr_x,gr_y,gr_yp,gr_ym)
%hold off;
%hold on;
%xlabel ('Number of users');
%title ('Greedy Ratio Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.78,0.945])
%hold off;
%hold on;
%h4 = errorbar(gr_x1,gr_y1,gr_yp1,gr_ym1);
%set(h4,'color','black')
%hold on;
%hold off;
%subplot(2,2,4)
%errorbar(x,y,yp,ym)
%xlabel ('Number of users');
%title ('Sids Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.58,0.72])

xlabel ('Number of users');
ylabel ('Running time (in seconds)');
tightfig;
%ylabel ("Running Time (in seconds)");
%title ('Sids, Greedy Utility, Greedy Demand  and Gredy Ratio Algorithms results ');

%legend({'A^{\rm u}','A^{1/2}','A^{\rm |d|}','A^{\rm e}'});
%legend location northeastoutside

%print('maximize_utility_number_of_users.jpg', '-djpg');
%print('running_time_number_of_users.jpg', '-djpg');

%hold off;




