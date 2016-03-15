data = load('sidplotdata.txt');
datautility = load('guplotdata.txt');
datagreedy = load('gdplotdata.txt');

utilities = data(:,1);
gu_utilities = datautility (:,1);
gd_utilities = datagreedy  (:,1);
vector = [];
verctor_g = [];
for i = 1:120
   
    vector(i) = utilities(i) - gu_utilities(i);
    verctor_g(i) = gd_utilities(i) - gu_utilities(i);
end

max(vector)
max(verctor_g)
%ind = find(vector == max(vector))
%(max(vector)/gu_utilities(ind)) * 100