clear;
figure_num = 1;

% The generalized form for a 2nd-order system with an input derivative is:
%
% (a0*D^2 + a1*D + a2)y(t) = (b1*D + b2)x(t).
%

L = 33e-3;
C = .01e-6;
R = @(Q) (1/Q)*sqrt(L/C);

QList = [((1/68)*sqrt(L/C)), 1.625, .707, .5315, .500001, .25];

tbegin = 0;
tend = 1e-3;
tdelta = 1e-6;
t = 0:1e-6:.01; % only for the first one

for Q = QList
    a0 = 1;
    a1 = R(Q)/L;
    a2 = 1/(L*C);
    b1 = 0;
    b2 = 1/(L*C);
    w0 = sqrt(a2);
    A = [a0 a1 a2];
    B = [b1 b2];
    PlotSecondOrderResponse(figure_num,w0,Q,A,B,t,PulseAmplitude,StepAmplitude);
    figure_num = figure_num + 1;
    t = tbegin:tdelta:tend;
end

