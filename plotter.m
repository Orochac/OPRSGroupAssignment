[x,y] = meshgrid(-0.5:0.05:1.5,-0.5:0.05:1.5);
f = sqrt(x.^2 + y.^2) + sqrt((x-1).^2 + y.^2)+ sqrt(x.^2 + (1-y).^2)+max(max(sqrt(x.^2 + y.^2), sqrt((x-1).^2 + y.^2)), sqrt(x.^2 + (1-y).^2));
surf(f)