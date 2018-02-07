A = [265 400 500 700 950 1360 2080 2450 2940];  % Xi points given as data
z1 = 0;
z2 = 1025;
z3 = 1400;
z4 = 1400;
z5 = 1710;
z6 = 1710;
z7 = 2080;
z8 = 2080;
z9 = 2425;
z10 = 2425;
z11 = 2760;
z12 = 2760;
z13 = 3005;
z14 = 3005;
z15 = 2850;
z16 = 2850;
z17 = 2675;
z18 = 0;
z19 = 0;
z20 = 0;
z21 = 0;
z22 = 0;
z23 = 0;
z24 = 0;
%Rhs matrix
Z=[z2;z3;z4;z5;z6;z7;z8;z9;z10;z11;z12;z13;z14;z15;z16;z17;z18;z19;z20;z21;z22;z23;z24;z1];

%Matrix of coefficeints of a1,b1,c1 .. a8,b8,c8 written in the equations.
X=[
  265^2 265 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  400^2 400 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 400^2 400 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 500^2 500 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 500^2 500 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 700^2 700 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 
  0 0 0 0 0 0 0 0 0 700^2 700 1 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 950^2 950 1 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 950^2 950 1 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 1360^2 1360 1 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1360^2 1360 1 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2080^2 2080 1 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2080^2 2080 1 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2450^2 2450 1 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2450^2 2450 1;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2940^2 2940 1;
  2*400 1 0 -2*400 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 2*500 1 0 -2*500 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 2*700 1 0 -2*700 -1 0 0 0 0 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 2*950 1 0 -2*950 -1 0 0 0 0 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 2*1360 1 0 -2*1360 -1 0 0 0 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2*2080 1 0 -2*2080 -1 0 0 0 0;
  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2*2450 1 0 -2*2450 -1 0;
  1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
  ];
Res = linsolve(X,Z);
figure
hold on
ylim([0 3500])

%This for loop is for being able to plot all piece-wise functions on the
%same figure.It takes its limits from A matrix given on the first line of
%this script. Then takes each function and plots it with its coefficients.
for i=1:8
lin = A(i):A(i+1);
plot(lin,Res(3*i-2)*(lin.^2)+Res(3*i-1)*lin+Res(3*i));
end    