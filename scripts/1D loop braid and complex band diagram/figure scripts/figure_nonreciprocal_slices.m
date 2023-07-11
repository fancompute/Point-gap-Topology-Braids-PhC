% reciprocal braids

% if loading a file
% load('data_nonreciprocal_slices/29Mar23-155301kx047_edr1_edi06_ea2.mat');
% load('data_nonreciprocal_slices/29Mar23-165923kx051_edr1_edi06_ea2.mat');
% load('data_nonreciprocal_slices/29Mar23-155821kx053_edr1_edi06_ea2.mat');
% load('data_nonreciprocal_slices/29Mar23-160059kx057_edr1_edi06_ea2.mat');
% load('data_nonreciprocal_slices/29Mar23-160343kx06_edr1_edi06_ea2.mat');
% load('data_nonreciprocal_slices/03May23-130230kx083_edr1_edi06_ea2.mat');
load('data_nonreciprocal_slices/03May23-133429kx09_edr1_edi06_ea2.mat');

% Plot the data
fig = figure;
set(fig, 'Position', [0 0 300 550]);
fontSize = 12; % font size for plots

% PLOT KX,KY LOOP IN BRILLOUIN ZONE COLOURED BY SEGMENTS

% PLOT EIGENVALUE BRAID COLOURED BY Imag Freq
% purpose of this plot is that you can see which braids are over or under
% in braid projection plot -> only 2D projection is needed with this
% colourscale
% ax(3) = subplot(3,1,1);
% for i = 1:size(k_colors,2)
%     h2 = scatter3(imag_freq(:,i)*a/(2*pi*c),real_freq(:,i)*a/(2*pi*c),k_colors(:,i),20,imag_freq(:,i)*a/(2*pi*c),'filled');
%     hold on;
% end
% zmin = min(k_colors(:));
% zmax = max(k_colors(:));
% zmid = (zmin + zmax) / 2;
% zticks([zmin, zmid, zmax]); % Set the tick marks on the z-axis
% zticklabels({'0', '\pi', '2\pi'}); % Set the labels for the tick marks
% xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
% ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
% zlabel('loop trajectory $k_y$','Interpreter','latex')
% % colormap(ax(3),'turbo')
% ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
% xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
% cbar = colorbar(ax(3))
% caxis([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
% title(sprintf('$k_x$ = %s$\\pi$', string(kx_set)), 'Interpreter', 'latex')
% cbar.YTick = linspace(cbar.Limits(1), cbar.Limits(2), 2);
% cbar.Label.Interpreter = 'latex';
% cbar.Label.String = 'Im($\omega)a/2 \pi c$'
% cbar.Label.Position(1) = 1.5;
% ax(3).TickDir = 'in';
% box on;
% view(107, 8);
% set(gca, 'FontSize', fontSize);
% cmap = slanCM('gnuplot2');
% % flipped_cmap = flipud(cmap);
% % set(ax(3), 'Colormap', parula);
% set(ax(3), 'Colormap', cmap);



% PLOT Complex band diagram coloured by rainbow (to show direction of
% trajectory)
% ax(4) = subplot(3,1,2);
ax(4) = subplot(2,1,1);
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


% load('data_OBC/02May23-210212OBC_ky047_edr1_edi06_ea2');
% load('data_OBC/02May23-210818OBC_ky051_edr1_edi06_ea2');
% load('data_OBC/02May23-211106OBC_ky053_edr1_edi06_ea2');
% load('data_OBC/02May23-211637OBC_ky057_edr1_edi06_ea2');
% load('data_OBC/02May23-211941OBC_ky06_edr1_edi06_ea2');
% load('data_OBC/03May23-135101OBC_ky083_edr1_edi06_ea2');
load('data_OBC/03May23-135455OBC_ky09_edr1_edi06_ea2');

NO_EIGENS=20; % number of eigenvalues solved for in comsol
num_ksteps =150; % number of steps per (kx,ky) se
fontSize = 12; % font size for plots
kcolor=repmat(linspace(1,NO_EIGENS,num_ksteps),NO_EIGENS,1); %used for a plot
cmap = jet(12); %used for a plot
% Constants
a=0.04; % lattice width
c=299792458; % speed of light
% 


% Plot the data OBC
% ax(5) = subplot(3,1,3);
ax(5) = subplot(2,1,2);
scatter(imag_freqs_pt(1, :)*a/(2*pi*c), real_freqs_pt(1, :)*a/(2*pi*c),6, centreE_freqs_pt(1, :),'filled');
hold on;
for index =2:NO_EIGENS_OBC
    scatter(imag_freqs_pt(index, :)*a/(2*pi*c), real_freqs_pt(index, :)*a/(2*pi*c), 6,centreE_freqs_pt(index, :)*a/(2*pi*c),'filled');
end
% these variables loaded from PBC conditions
ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
colormap(ax(5),colorMap);
cb = colorbar();cb.Label.String = 'Mean E field position';cb.Label.Interpreter = 'latex';
cb.Ticks = [];
axis square
cmin = min(centreE_freqs_pt(:)*a/(2*pi*c));
cmax = max(centreE_freqs_pt(:)*a/(2*pi*c));
caxis([cmin, cmax]);
titlestring=strcat('OBC $k_{x}=',+strcat(num2str(kx_set, 15)),'\pi/a$')
h=title({titlestring,' '},'Interpreter','latex')
h.FontSize=12;
%PLOT PBC ON SAME PLOT (run script_band_diagram_band in other folder to get
%PBC)
kcolor=repmat(linspace(1,NO_EIGENS,size(imag_freq,2)),NO_EIGENS,1);
scatter(imag_freq(1, :)*a/(2*pi*c), real_freq(1, :)*a/(2*pi*c),3,'k','filled');
ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
for index =2:NO_EIGENS
    scatter(imag_freq(index, :)*a/(2*pi*c), real_freq(index, :)*a/(2*pi*c), 3,'k','filled' );
end
axis square
ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
title(sprintf('$k_x$ = %s$\\pi$', string(kx_set)), 'Interpreter', 'latex') %because i did vertical stripe as horizontal but rotated, its ky_set in code
set(gca, 'FontSize', fontSize);
axis square;
box on;


%title over whole figure
str = strcat(', epsd_re = ', num2str(epsd_re), ', epsd_im = ', num2str(epsd_im), ', epsa = ', num2str(epsa));
figuretitle = strcat(model_name, str);
figuretitle = strrep(figuretitle,'_','\_');
hold off;




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
new_folder_path = 'data_nonreciprocal_slices/';
fullFileName = fullfile(new_folder_path, figFileName);
saveas(gcf,fullFileName)



