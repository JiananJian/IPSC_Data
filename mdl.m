t = 0 : 0.01 : 100;
gC = 26.5; Cs = 100; Cd = 40;
tau = 7.2; gS = gC / Cs; gD = gC / Cd;
y = tau * gS / (tau * gD - 1) * (exp(-t/tau) - exp(-t*gD));
figure; plot(t, y); xlabel('t (ms)'); ylabel('IPSC / Imax');