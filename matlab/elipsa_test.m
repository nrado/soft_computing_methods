close all; clear all; clc;   
% prikaz elipse i trougla
figure(1)
a = 10; b = 3;
a2 = a*a
b2 = b*b

elipsa = [];
teta_ = [];
N = 20
for i = 1:N
    teta = 2 * pi / (N-1) * i;
    rad2deg(teta);
    teta_ = [teta_; teta];

    % jednacina elipse
    xx = sqrt(1/ (1/a2 + tan(teta)^2 / b2));
    yy = xx * tan(teta);
% 
%     if 0 < teta < pi/2 || pi < teta < 3*pi/2
%         yy = abs(yy);
%     else
%         yy = -abs(yy);
%     end
%     xx = yy / tan(teta)
    elipsa = [ elipsa ; xx yy ];
end

elipsa;
teta_
figure(1); plot(elipsa(:,1), elipsa(:,2), 'bo');