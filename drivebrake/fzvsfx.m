[FZ, FX] = read_calspan_data();

% Ordenar por FZ
[FZ_sorted, idx] = sort(FZ);
FX_sorted = FX(idx);

% Ajuste polinomial grau 5
grau = 4;
p = polyfit(FZ_sorted, FX_sorted, grau);

% Avaliar polinómio nos FZ ordenados (ou numa malha mais suave)
FZ_fit = linspace(min(FZ_sorted), max(FZ_sorted), 500);
FX_fit = polyval(p, FZ_fit);

% Plot
figure;
hold on;
plot(FZ_fit, FX_fit, 'r-', 'LineWidth', 2);
xlabel('FZ [N]');
ylabel('FX [N]');
title(sprintf('Curva FX vs FZ com ajuste polinomial (grau %d)', grau));
legend('Dados experimentais ordenados', 'Ajuste polinomial');
grid on;

