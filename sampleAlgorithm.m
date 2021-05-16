function [smin, fmin, k, t] = sampleAlgorithm(s0, nmbrSensors, sensorLocations)
    smin = rand(1,2);
    fmin = rand();
    k = round(rand()*1000);
    t = rand()*10;
end