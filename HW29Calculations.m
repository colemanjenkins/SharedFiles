resistor_values = [1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2,...
    10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82,...
    100, 120, 150, 180, 220, 270, 330, 390, 470, 560, 680, 820,...
    1e3, 1.2e3, 1.5e3, 1.8e3, 2.2e3, 2.7e3, 3.3e3, 3.9e3, 4.7e3, 5.6e3, 6.8e3, 8.2e3,...
    10e3, 12e3, 15e3, 18e3, 22e3, 27e3, 33e3, 39e3, 47e3, 56e3, 68e3, 82e3,...
    100e3, 120e3, 150e3, 180e3, 220e3, 270e3, 330e3, 390e3, 470e3, 560e3, 680e3, 820e3, 1e6];

cap_values = [.001e-6, .0047e-6, .01e-6, .047e-6, .1e-6,...
    470e-12, .002e-6, .02e-6, 1e-6, 4.7e-6, 10e-6, 22e-6, ...
    47e-6, 100e-6, 220e-6, 1000e-6, 47e-12, 100e-12, 220e-12, 330e-12];

% Schmitt Trigger Calculations

Vhl = 0;
Vlh = 2;
Vcc = 3.5;
Vee = -3.5;

%R1 and R2
equals = 0;
error = .07;

schmitt = @(r1, r2) (Vhl - Vlh)*(r2/(r1+r2)) + (Vcc-Vee)*(1-(r2/(r1+r2)));

for r1 = resistor_values
    for r2 = resistor_values
        val = schmitt(r1, r2);
        if (val <= equals + error) && (val >= equals - error)
            fprintf('R1: %f R2: %f\n Val: %.5f\n', r1, r2, val);
        end
    end
end

% R4 and R5
r1 = 330;
r2 = 1.2e3;
equals = Vcc*(r1/(r1+r2));
error = .0025;
for r4 = resistor_values
    for r5 = resistor_values
        val = 5*(r5/(r4+r5));
        if (val <= equals + error) && (val >= equals - error)
            fprintf('R4: %f R5: %f\n Val: %.7f\n', r4, r5, val);
        end
    end
end


% Integrator Calculations

equals = Vlh;
error = .1;
t = 5e-3;

for r3 = resistor_values
    for c1 = cap_values
        val = (Vcc*t)/(r3*c1);
        if (val <= equals + error) && (val >= equals - error)
            fprintf('R3: %f C1: %.10f\n Val: %.7f\n', r3, c1, val);
        end
    end
end
