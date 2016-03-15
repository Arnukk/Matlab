function [thefactorial, trailingzeros] = hugefactorial(N)
digits(500);
thefactorial = gamma(vpa(N)+1);
i = 1;
b = 1;
trailingzeros = 0;
while b >= 1
  b = N/5.^i;
  d = floor(b);
  trailingzeros = trailingzeros + d;
  i = i+1;
end