function str = convertCoordntToStr(x)
    str = string(round(x, 2));
    str = strcat('(', str(:,1), ',', str(:,2), ')');
end