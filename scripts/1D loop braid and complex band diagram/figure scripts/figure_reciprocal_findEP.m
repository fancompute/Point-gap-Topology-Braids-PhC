% reciprocal braids

% if loading a file
% load('data_reciprocal_findEP/29Mar23-005530kx1_edr3_edi06_ea0.mat');
%  load('data_reciprocal_findEP/05Jul23-183517kx101_edr3_edi06_ea0.mat');
%  load('data_reciprocal_findEP/29Mar23-005820kx1015_edr3_edi06_ea0');
 load('data_reciprocal_findEP/29Mar23-151622kx103_edr3_edi06_ea0.mat');


% Plot the data
fig = figure;
set(fig, 'Position', [0 0 300 550]);
fontSize = 12; % font size for plots

% PLOT KX,KY LOOP IN BRILLOUIN ZONE COLOURED BY SEGMENTS
realfreq_min = 0.30 *2*pi*c/a; %yline
realfreq_max = 0.62 *2*pi*c/a; %yline
imagfreq_min = 0.005 *2*pi*c/a; %xline
imagfreq_max = 0.025 *2*pi*c/a; %xline
% PLOT EIGENVALUE BRAID COLOURED BY Imag Freq
% purpose of this plot is that you can see which braids are over or under
% in braid projection plot -> only 2D projection is needed with this
% colourscale
ax(3) = subplot(2,1,1);
for i = 1:size(k_colors,2)
    h2 = scatter3(imag_freq(:,i)*a/(2*pi*c),real_freq(:,i)*a/(2*pi*c),k_colors(:,i),20,imag_freq(:,i)*a/(2*pi*c),'filled');
    hold on;
end
zmin = min(k_colors(:));
zmax = max(k_colors(:));
zmid = (zmin + zmax) / 2;
zticks([zmin, zmid, zmax]); % Set the tick marks on the z-axis
zticklabels({'0', '\pi', '2\pi'}); % Set the labels for the tick marks
xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
zlabel('loop trajectory $k_y$','Interpreter','latex')
colormap(ax(3),slanCM('gnuplot2'))
% colormap(ax(3),'parula')
ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
cbar = colorbar(ax(3))
caxis([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
title(sprintf('$k_x$ = %s$\\pi$', string(kx_set)), 'Interpreter', 'latex')
cbar.YTick = linspace(cbar.Limits(1), cbar.Limits(2), 2);
cbar.Label.Interpreter = 'latex';
cbar.Label.String = 'Im($\omega)a/2 \pi c$'
cbar.Label.Position(1) = 1.5;
ax(3).TickDir = 'in';
box on;
% view(90, 13); %for kx=1.03
view(131, 7); %for kx=1.015
% view(130, 5); %for kx=1
set(gca, 'FontSize', fontSize);


% PLOT Complex band diagram coloured by rainbow (to show direction of
% trajectory)
ax(4) = subplot(2,1,2);
kcolor=repmat(linspace(1,NO_EIGENS,size(imag_freq,2)),NO_EIGENS,1);
scatter(imag_freq(1, :)*a/(2*pi*c), real_freq(1, :)*a/(2*pi*c),NO_EIGENS,kcolor(1, :),'filled');
colormap(ax(4),'jet')
hold on;
ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
for index =2:NO_EIGENS
    scatter(imag_freq(index, :)*a/(2*pi*c), real_freq(index, :)*a/(2*pi*c), NO_EIGENS,  kcolor(index, :),'filled');
end
axis square
ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
title(sprintf('$k_x$ = %s$\\pi$', string(kx_set)), 'Interpreter', 'latex')
hold off;
cbar = colorbar(ax(4))
cbar.Label.Interpreter = 'latex';
cbar.Label.String = 'loop trajectory $k_y$'
axis square;
box on;
cbar.Ticks = [min(kcolor(:)),max(kcolor(:))];
yticks = cbar.Ticks;
yticklabels = ["0","2\pi"];
cbar.YTickLabel = yticklabels;
cbar.Label.Position(1) = 1.2;
set(gca, 'FontSize', fontSize);


% Adjust subplot widths
left_margin = 0.2;
right_margin = 0.9;
subplot_width = 0.45;
subplot_height = 0.45;
subplot_gap = 0.05;

pos1 = get(ax(3), 'Position');
pos2 = get(ax(4), 'Position');
pos2(1) = left_margin;
pos2(3) = subplot_width;
pos2(4) = subplot_height;
pos2(2) = pos1(2) - subplot_height - subplot_gap;
set(ax(4), 'Position', pos2);

%title over whole figure
str = strcat(', epsd_re = ', num2str(epsd_re), ', epsd_im = ', num2str(epsd_im), ', epsa = ', num2str(epsa));
figuretitle = strcat(model_name, str);
figuretitle = strrep(figuretitle,'_','\_');
% sgtitle(figuretitle)
% 
% % save as matlab png
datestring = datestr(now,'ddmmmyy-HHMMSS');
figFileName=strcat(datestring,'kx',+strcat(num2str(kx_set, 15)));
figFileName = strrep(figFileName,'.','');
figFileName =strcat(figFileName,'.png');
new_folder_path = 'data_reciprocal_findEP/';
fullFileName = fullfile(new_folder_path, figFileName);
saveas(gcf,fullFileName)






