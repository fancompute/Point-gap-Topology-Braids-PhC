
% if loading a file
% load('29Mar23-003135kx102_edr3_edi06_ea0.mat');

% Plot the data
clf;
fig = figure(5);
set(fig, 'Position', [100 100 1400 400]);

% PLOT KX,KY LOOP IN BRILLOUIN ZONE COLOURED BY SEGMENTS
ax(1) = subplot(1,4,1);
cmap = jet(12); 
for i=1:length(kx_loop_pts)-1
    line([kx_loop_pts(i), kx_loop_pts(i+1)], [ky_loop_pts(i), ky_loop_pts(i+1)], 'Color', cmap(mod(i,12),:), 'LineWidth', 2);
    hold on
end
xlim([0, 2])
ylim([0, 2])
xlabel('kx')
ylabel('ky')
axis square
title(sprintf('Loop traced in BZ \n colored by segments'))


    
% PLOT EIGENVALUE BRAID COLOURED BY ORDER OF SEGMENTS IN KX,KY LOOP
ax(2) = subplot(1,4,2);
% Typically, if I am drawing a loop in the BZ, I will do it in straight
% line segments. This plot colours the braid according to segment, ordered
% by the jet colour scale dark blue -> light blue -> etc. On a different
% plot, I will draw the loop in the BZ plane, and then it's easier to see
% which part of the braid corresponds to what kx,ky segment in the BZ, due
% to the colour
for i = 1:size(k_colors,2)
    h1 = scatter3(imag_freq(:,i)*a/(2*pi*c),real_freq(:,i)*a/(2*pi*c),k_colors(:,i),20,colormap_vals,'filled');
    hold on;
end
% scatter3(imag_freq(:)*a/(2*pi*c),real_freq(:)*a/(2*pi*c),k_colors(:),20,colormap_vals(:),'filled');
% For some reason the above line didnt work, so I broke it into a loop
xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
zlabel('k steps')
ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
title(sprintf('Eigenvalue braid \n colored by kx,ky segments'))
cbar_ticklabels = arrayfun(@(i) sprintf('(%d,%d)', loop_pts(i,1), loop_pts(i,2)), 1:length(kx_loop_pts), 'UniformOutput', false);
cmap = jet(12);
cmap = cmap(1:length(loop_pts),:);
cbar = colorbar(ax(2),'Ticks', linspace(0, 1, length(loop_pts)+1), 'TickLabels', cbar_ticklabels)
colormap(cbar, cmap);
cbar.Label.String = 'Loop segment start and end coordinates'

% PLOT EIGENVALUE BRAID COLOURED BY Imag Freq
% purpose of this plot is that you can see which braids are over or under
% in braid projection plot -> only 2D projection is needed with this
% colourscale
ax(3) = subplot(1,4,3);
for i = 1:size(k_colors,2)
    h2 = scatter3(imag_freq(:,i)*a/(2*pi*c),real_freq(:,i)*a/(2*pi*c),k_colors(:,i),20,imag_freq(:,i)*a/(2*pi*c),'filled');
    hold on;
end
xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
zlabel('k steps')
colormap(ax(3),'parula')
ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
cbar = colorbar(ax(3))
caxis([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
title(sprintf('Eigenvalue braid \n colored by imag freq'))
cbar.Label.Interpreter = 'latex';
cbar.Label.String = 'Im($\omega)a/2 \pi c$'



% PLOT Complex band diagram coloured by rainbow (to show direction of
% trajectory)
ax(4) = subplot(1,4,4);
% kcolor=repmat(linspace(1,NO_EIGENS,size(imag_freq,2)),NO_EIGENS,1);
colormap(ax(4),'jet')
hold on;
ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
for index =1:size(k_colors,1)
    scatter(imag_freq(index, :)*a/(2*pi*c), real_freq(index, :)*a/(2*pi*c), NO_EIGENS,  k_colors(index, :),'filled');
end
axis square
ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
title(sprintf('Complex band diagram \n coloured by (kx,ky) step index'))
hold off;
cbar = colorbar(ax(4))
cbar.Label.Interpreter = 'latex';
cbar.Label.String = '$(kx,ky)$ step index'
axis square


%title over whole figure
str = strcat(', epsd_re = ', num2str(epsd_re), ', epsd_im = ', num2str(epsd_im), ', epsa = ', num2str(epsa));
figuretitle = strcat(model_name, str);
figuretitle = strrep(figuretitle,'_','\_');
sgtitle(figuretitle)





