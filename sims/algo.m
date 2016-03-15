format rat
Gain1 = 100;
Gain2 = 200;
A = [3,3;2,5;0,6];
B = [3,2;2,6;3,1];
y0 = [1/2,1/2];
x0 = [0,0,1];
trigger = true;

while (trigger)

Ay = [];
for i = 1:3
    Ay(i) = sum(times(A(i,:),y0));
end

xTB = [];
for i = 1:2
        xTB(i) = sum(times(B(:,i), transpose(x0)));
end

xTAy = sum(times(transpose(Ay),transpose(x0)));
xTBy = sum(times(xTB,y0));


Gain1 = [];
for i = 1:3
    Gain1(i) = max([0, Ay(i)-xTAy]);
end

Gain2 = [];
for i = 1:2
    Gain2(i) = max([0, xTB(i) - xTBy]);
end


if sum(Gain1) == 0 && sum(Gain2) == 0
    sum(Gain1)
    sum(Gain2)
    break
end


x0 = Gain1 + x0;
x0 = x0/(sum(Gain1) + 1);

y0 = Gain2 + y0;
y0 = y0/(sum(Gain2) + 1);

end

x0
y0
