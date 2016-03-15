data = load('fcmw.txt');



time = data(:,1);
totalp = data(:,2);
totalq = data(:,3);
p4 = data(:,4);
q4 = data(:,5);
v = data(:,6);


t = figure;


subplot(3,1,1)       % add first plot in 2 x 1 grid
hold on;
plot(time,totalp)
hold off;
hold on;
plot(time,totalq)
hold off;
xlabel ('Time step');
ylabel ('Active and Reactive Power (MW, MVAR)');


subplot(3,1,2)
hold on;
plot(time,p4)
hold off;
hold on;
plot(time,q4)
hold off;
xlabel ('Time');
ylabel ('Active and Reactive Power (MW, MVAR)');


hold on
subplot(3,1,3)
plot(time,v)
xlabel ('Time');
ylabel ('Voltage (per unit)');
hold off


tightfig;

