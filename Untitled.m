data = load('demandresponse.txt');
data2 = load('gdplotdata.txt');
data3 = load('gmplotdata.txt');
data4 = load('gurobi.txt');

capacity = data(:,1);
time = data(:,2);

cost2 = data2(:,1);
time2 = data2(:,2);

cost3 = data3(:,1);
time3 = data3(:,2);

cost4 = data4(:,1);
time4 = data4(:,2);

[ax,p1,p2] = plotyy(time,capacity, time2, cost2);
set(ax,'NextPlot','add')
plot(ax(2),time2,cost3)
plot(ax(2),time2,cost4)
xlabel ('Time');



%h = ylabel ('Alpha');
ylabel(ax(1),'Capacity') % label left y-axis
ylabel(ax(2),'Minimized compensation') % label right y-axis
ylim(ax(1),[-1000000,5300000])
%ylim(ax(2),[-3000,31000])
xlim(ax(2),[-10,350])
xlim(ax(1),[-10,350])
legend('Capacity','GDA', 'GMA', 'GUROBI OPT MIN');
%legend("Sid's algorithm","Greedy Utility","Greedy Demand");
%legend location northeastoutside
%axis ("tic");
%print('running_time_number_of_users.jpg', '-djpg');



