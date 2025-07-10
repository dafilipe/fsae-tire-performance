tic

% Parameters
target_FZ = 1000;
tolerances = [50, 100, 150];
min_SA = -15;
max_SA = 15;

% Read data for MZ
[SA, MZ, FZ] = read_calspan_data('MZ', min_SA, max_SA);

curves_sa = {};
curves_mz = {};
labels = {};

for k = 1:length(tolerances)
    tol = tolerances(k);
    mask = (FZ >= (target_FZ - tol)) & (FZ <= (target_FZ + tol));
    sa_sel = SA(mask);
    mz_sel = MZ(mask);

    [sa_sorted, idx] = sort(sa_sel);
    mz_sorted = mz_sel(idx);

    if length(sa_sorted) >= 6
        p = polyfit(sa_sorted, mz_sorted, 4);
        sa_fit = linspace(min(sa_sorted), max(sa_sorted), 300);
        mz_fit = polyval(p, sa_fit);

        curves_sa{end+1} = sa_fit;
        curves_mz{end+1} = mz_fit;
        labels{end+1} = sprintf('FZ ≈ 1000 ± %d N', tol);
    end
end

% Plot
figure; hold on; grid on; box on;
colors = {'r', 'g', 'b'};
for i = 1:length(curves_sa)
    plot(curves_sa{i}, curves_mz{i}, 'LineWidth', 2.5, ...
         'Color', colors{i}, 'DisplayName', labels{i});
end
xlabel('Slip Angle (SA) [°]');
ylabel('Aligning Moment (MZ) [Nm]');
title('MZ vs SA - Multiple FZ Tolerances');
legend('Location', 'southeast');
set(gca, 'FontSize', 11);
toc
