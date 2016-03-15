n=6;

data = load('cplexopt.txt');
datautility = load('guplotdata.txt');
datademand = load('gdplotdata.txt');
dataratio = load('grplotdata.txt');
datakhaled = load('sidplotdata.txt');
strive = load('sidplotdata.txt');


usersqty = data(:,3);
gu_usersqty = datautility(:,3);
gd_usersqty = datademand(:,3);
gr_usersqty = dataratio(:,3);
kh_usersqty = datakhaled(:,3);
strive_usersqty = strive(:,3);
total_utility = data(:,4);


utilities = data(:,1);
gu_utilities = datautility (:,1);
gd_utilities = datademand  (:,1);
gr_utilities = dataratio(:,1);
kh_utilities = datakhaled(:,1);
strive_utilitites = strive(:,1);

running_time = data(:,2);
gu_running_time = datautility(:,2);
gd_running_time = datademand(:,2);
gr_running_time =  dataratio(:,2);
kh_running_time =  datakhaled(:,2);
strive_runing_time = strive(:,2);

tweencounter = zeros(n+1,1);
tweencounter(1) = 1;
pointer = 1;
for i = 1:n

while pointer+1 <= length(usersqty) && usersqty(pointer) == usersqty(pointer + 1)
    tweencounter(i+1) = tweencounter(i+1) + 1;
    pointer = pointer + 1;
end


pointer = pointer + 1;
tweencounter(i+1) = tweencounter(i+1) + 1;
tweencounter(i+1) = tweencounter(i+1) + tweencounter(i);


[mu, upper, lower] = confidenceint(utilities(tweencounter(i):tweencounter(i+1)-1));
[gu_mu, gu_upper, gu_lower] = confidenceint(gu_utilities(tweencounter(i):tweencounter(i+1)-1));
[gd_mu, gd_upper, gd_lower] = confidenceint(gd_utilities(tweencounter(i):tweencounter(i+1)-1));
[gr_mu, gr_upper, gr_lower] = confidenceint(gr_utilities(tweencounter(i):tweencounter(i+1)-1));
[kh_mu, kh_upper, kh_lower] = confidenceint(kh_utilities(tweencounter(i):tweencounter(i+1)-1));
[st_mu, st_upper, st_lower] = confidenceint(strive_utilitites(tweencounter(i):tweencounter(i+1)-1));
[mu1, upper1, lower1] = confidenceint(running_time(tweencounter(i):tweencounter(i+1)-1));
[gu_mu1, gu_upper1, gu_lower1] = confidenceint(gu_running_time(tweencounter(i):tweencounter(i+1)-1));
[gd_mu1, gd_upper1, gd_lower1] = confidenceint(gd_running_time (tweencounter(i):tweencounter(i+1)-1));
[gr_mu1, gr_upper1, gr_lower1] = confidenceint(gr_running_time (tweencounter(i):tweencounter(i+1)-1));
[kh_mu1, kh_upper1, kh_lower1] = confidenceint(kh_running_time (tweencounter(i):tweencounter(i+1)-1));
[st_mu1, st_upper1, st_lower1] = confidenceint(strive_runing_time(tweencounter(i):tweencounter(i+1)-1));

[mut, uppert, lowert] = confidenceint(total_utility(tweencounter(i):tweencounter(i+1)-1));
total_utility_conf(i) = mut;

[mu2, upper2, lower2] = confidenceint(usersqty(tweencounter(i):tweencounter(i+1)-1));

usersqty_conf(i) = mu2;


utilities_conf(i) = mu;
gu_utilities_conf(i) = gu_mu;
gd_utilities_conf(i) = gd_mu;
gr_utilities_conf(i) = gr_mu;
kh_utilities_conf(i) = kh_mu;
strive_utilities_conf(i) = st_mu;
running_time_conf(i) = mu1;
gu_running_time_conf(i) = gu_mu1;
gd_running_time_conf(i) = gd_mu1;
gr_running_time_conf(i) = gr_mu1;
kh_running_time_conf(i) = kh_mu1;
st_running_time_conf(i) = st_mu1;
ym(i) = (mu - lower);
yp(i) = (upper - mu);
gu_ym(i) = (gu_mu - gu_lower);
gu_yp(i) = (gu_upper - gu_mu);
gd_ym(i) = (gd_mu - gd_lower);
gd_yp(i) = (gd_upper - gd_mu);
gr_ym(i) = (gr_mu - gr_lower);
gr_yp(i) = (gr_upper - gr_mu);
kh_ym(i) = (kh_mu - kh_lower);
kh_yp(i) = (kh_upper - kh_mu);
st_ym(i) = (st_mu - st_lower);
st_yp(i) = (st_upper - st_mu);
ym1(i) = mu1 - lower1;
yp1(i) = upper1 - mu1;
gu_ym1(i) = gu_mu1 - gu_lower1;
gu_yp1(i) = gu_upper1 - gu_mu1;
gd_ym1(i) = gd_mu1 - gd_lower1;
gd_yp1(i) = gd_upper1 - gd_mu1;
gr_ym1(i) = gr_mu1 - gr_lower1;
gr_yp1(i) = gr_upper1 - gr_mu1;
kh_ym1(i) = kh_mu1 - kh_lower1;
kh_yp1(i) = kh_upper1 - kh_mu1;
st_ym1(i) = st_mu1 - st_lower1;
st_yp1(i) = st_upper1 - st_mu1;


end



gu_x = usersqty_conf;
gu_y = gu_utilities_conf;
gd_x = usersqty_conf;
gd_y = gd_utilities_conf;
gr_x = usersqty_conf;
gr_y = gr_utilities_conf;
kh_x = usersqty_conf;
kh_y = kh_utilities_conf;
st_x = usersqty_conf;
st_y = strive_utilities_conf;
x = usersqty_conf;
y = utilities_conf;



x1 = usersqty_conf;
y1 = running_time_conf;
gu_x1 = usersqty_conf;
gu_y1 = gu_running_time_conf;
gd_x1 = usersqty_conf;
gd_y1 = gd_running_time_conf;
%h2 = errorbar(x1,y1,yp1,ym1)


t = figure('Renderer','painters','PaperType','<custom>',...
    'PaperSize',[12.7696646875 10.6889760520833],...
    'PaperUnits','centimeters',...
    'InvertHardcopy','off',...
    'Color',[1 1 1]);

min(gu_y(1:n)./y(1:n))
min(gd_y(1:n)./y(1:n))
min(gr_y(1:n)./y(1:n))
min(kh_y(1:n)./y(1:n))


%subplot(2,2,1)
h2 = errorbar(gu_x,gu_y,gu_yp,gu_ym);
set(h2,'MarkerSize',15,'Marker','.','DisplayName','GVA',...
    'Color',[0 0 1],'LineWidth',1);
%errorbar(gu_x,gu_y,gu_yp,gu_ym)
hold on;
%xlabel ('Number of users');
%title ('Greedy Utility Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.78,0.945])

%hold on;
h1 = errorbar(x,y,yp,ym);
%h1 = errorbar(gu_x1,gu_y1,gu_yp1,gu_ym1)
set(h1,'MarkerSize',15,'Marker','.','DisplayName','CPLEX',...
    'Color',[0 1 0],'LineWidth',1);
hold off;
hold on;
%subplot(2,2,2)
h3 = errorbar(gd_x,gd_y,gd_yp,gd_ym);
%h3 = errorbar(gd_x1,gd_y1,gd_yp1,gd_ym1)
set(h3,'MarkerSize',10,'Marker','o','DisplayName','GDA',...
    'Color',[1 0 0],'LineWidth',1);
%errorbar(gd_x,gd_y,gd_yp,gd_ym)
hold off;
hold on;
%xlabel ('Number of users');
%title ('Greedy Demand Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.78,0.945])

%subplot(2,2,3)
%errorbar(gr_x,gr_y,gr_yp,gr_ym)
%hold off;
%hold on;
%xlabel ('Number of users');
%title ('Greedy Ratio Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.78,0.945])
%hold off;
%hold on;
h4 = errorbar(gr_x,gr_y,gr_yp,gr_ym);
set(h4,'MarkerSize',10,'Marker','square','DisplayName','GRA',...
    'Color',[0 0 0],...
    'LineStyle','-','LineWidth',1);
hold off;
hold on;


h5 = errorbar(kh_x,kh_y,kh_yp,kh_ym);
set(h2,'MarkerSize',15,'Marker','.','DisplayName','1DPA',...
    'Color',[0 0 1],'LineWidth',1);
hold off;
%hold on;

%h6 = errorbar(st_x,st_y,st_yp,st_ym);
%set(h2,'MarkerSize',15,'Marker','.','DisplayName','GSA',...
    %'Color',[1 0 1],'LineWidth',1);
%hold off;
%hold on;

%subplot(2,2,4)
%errorbar(x,y,yp,ym)
%xlabel ('Number of users');
%title ('Sids Algorithms Results ');
%ylabel ('\alpha');
%xlim([1500,1820])
%ylim([0.58,0.72])
%h5 = errorbar(kh_x,kh_y,kh_yp,kh_ym);
%set(h5,'color','black')
%hold on;


% Create xlabel
xlabel('Number of customers','FontSize',12);

% Create ylabel
ylabel('Minimized compensation','FontSize',12);

% Create title
%title('maxPA for scenario FUM','FontSize',14);

% Create legend
legend1 = legend({'GVA','CPLEX','GDA','GRA','1DPA'});
set(legend1,'Orientation','horizontal')

%xlabel ('Number of users');
%ylabel ('Maximized utility');
tightfig;
%ylabel ("Running Time (in seconds)");
%title ('Sids, Greedy Utility, Greedy Demand  and Gredy Ratio Algorithms results ');

%legend({'A^{\rm u}','A^{1/2}','A^{\rm |d|}','A^{\rm e}'});
%legend location northeastoutside





