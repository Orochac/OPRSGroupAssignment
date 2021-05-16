function val = x_generator(n,min, max)
rng = 1;
h = [];
for i = 1:n;

    h1 = (max-min)*rand(1,2)+min;
    h = [h;h1];
end   
val = h;