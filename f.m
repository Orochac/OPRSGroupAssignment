function val = f(s,x)
h = [];
for i = 1:size(x,1);
    h1 = norm(s-x(i,:));
    h = [h;h1];
end   
val =sum(h) + max(h);