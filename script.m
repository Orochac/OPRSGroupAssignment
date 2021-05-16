rng =1;
min = 0;
max = 3;
n =100;
X= x_generator(n,min,max)
f([2,3],X);
f([2,3],X)

s1 = linspace(min,max);
s2 = linspace(min,max);
[S1,S2] = meshgrid(s1,s2);
Z = [];
Z1 = [];
Z2 = [];
size(s1)
for j =1:size(S2,2)
    for i = 1:size(S1,2)
        Z2 = f([S1(i),S2(j)],X);
        Z1 = [Z1,Z2];
    end
    Z = [Z;Z1];
    Z1=[];
end
% Z=f([s1(1),s2(1)],X)
size(Z)
contour(S1,S2,Z)
surf(S1,S2,Z)

% [X,Y] = meshgrid(min:(max-min)/100:max);
% Z = Y.*sin(X) - X.*cos(Y);
% s = surf(X,Y,Z,'FaceAlpha',0.5)