[x,y] = meshgrid(-0.5:0.05:1.5,-0.5:0.05:1.5);
f = sqrt(x.^2 + y.^2) + sqrt((x-1).^2 + y.^2)+ sqrt(x.^2 + (1-y).^2)+max(max(sqrt(x.^2 + y.^2), sqrt((x-1).^2 + y.^2)), sqrt(x.^2 + (1-y).^2));
surf(f)
<<<<<<< HEAD

‘Hello' - Jeff
=======
%This is a comment

%This is a comment written by Luke Quinn
>>>>>>> 7658a0d3e7a34d8e494fb30cbac0c71042358306
