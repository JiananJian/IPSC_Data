T = readtable('GPe_repatchSUM_R');
GPe_int = T.IPSC_intensity;
GPe_tau = T.TimeConstant;
T = readtable('D1_repatchSUM_R');
D1_int = T.IPSC_intensity;
D1_tau = T.TimeConstant;

%% Boxplot
g = [0 * D1_tau + 1; 0 * GPe_tau + 2];
figure(1); clf; hold on;
boxplot([D1_tau; GPe_tau] * 1e3, g, 'Whisker', inf);
xticklabels({'D1', 'GPe'}); ylabel('time constant (ms)'); 
[h, p] = ttest2(GPe_tau, D1_tau);
xlim([0, 3]); title("p = " + num2str(p));

g = [0 * D1_int + 1; 0 * GPe_int + 2];
figure(2); clf; hold on;
boxplot([D1_int; GPe_int], g, 'Whisker', inf);
xticklabels({'D1', 'GPe'}); ylabel('intensity (pA)'); xlim([0, 3]);
[h, p] = ttest2(GPe_int, D1_int);
xlim([0, 3]); title("p = " + num2str(p));

g = [0 * D1_int + 1; 0 * GPe_int + 2];
figure(3); clf; hold on;
boxplot([D1_int .* D1_tau; GPe_int .* GPe_tau], g, 'Whisker', inf);
xticklabels({'D1', 'GPe'}); ylabel('charge (pC)'); xlim([0, 3]);
[h, p] = ttest2(GPe_int .* GPe_tau, D1_int .* D1_tau);
xlim([0, 3]); title("p = " + num2str(p));

%% Timeplot
t = (0 : 1 : 100) * 1e-3;
n = length(D1_int);
figure(4); clf; hold on;
for i = 1 : n
    plot(t * 1e3, D1_int(i) * exp(-t / D1_tau(i)), 'k');
end
xlabel('t (ms)'); ylabel('IPSC (pA)'); title('D1'); 

t = (0 : 1 : 100) * 1e-3;
n = length(GPe_int);
figure(5); clf; hold on;
for i = 1 : n
    plot(t * 1e3, GPe_int(i) * exp(-t / GPe_tau(i)), 'k');
end
xlabel('t (ms)'); ylabel('IPSC (pA)'); title('GPe');
