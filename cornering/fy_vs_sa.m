% FY vs SA using modular read function
tic
target_FZ = 1300;
tolerances = [50, 100, 150];
min_SA = -15;
max_SA = 15;

% Read data for FY
[SA, FY, FZ] = read_calspan_data('FY', min_SA, max_SA);

curves_sa = {};
curves_fy = {};
labels = {};

for k = 1:length(tolerances)
    tol = tolerances(k);
    mask = (FZ >= (target_FZ - tol)) & (FZ <= (target_FZ + tol));
    sa_sel = SA(mask);
    fy_sel = FY(mask);
    [sa_sorted, idx] = sort(sa_sel);
    fy_sorted = fy_sel(idx);

    if length(sa_sorted) >= 6
        p = polyfit(sa_sorted, fy_sorted, 3);
        sa_fit = linspace(min(sa_sorted), max(sa_sorted), 300);
        fy_fit = polyval(p, sa_fit);
        curves_sa{end+1} = sa_fit;
        curves_fy{end+1} = fy_fit;
        labels{end+1} = sprintf('FZ ≈ 1300 ± %d N', tol);
    end
end

% Plot
figure; hold on; grid on; box on;
colors = {'r', 'g', 'b'};
for i = 1:length(curves_sa)
    plot(curves_sa{i}, curves_fy{i}, 'LineWidth', 2.5, ...
         'Color', colors{i}, 'DisplayName', labels{i});
end
xlabel('Slip Angle (SA) [°]');
ylabel('Lateral Force (FY) [N]');
title('FY vs SA - Multiple FZ Tolerances');
legend('Location', 'southeast');
set(gca, 'FontSize', 11);
toc
