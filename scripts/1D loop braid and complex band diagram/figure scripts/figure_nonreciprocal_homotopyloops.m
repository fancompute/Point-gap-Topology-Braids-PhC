% nonreciprocal braids
clf;

% Define the position and size of the subplots
fig = figure(1);
set(fig, 'Position', [0 0 500 250]);
% set(fig, 'Position', [0 0 600 200]);
fontSize = 12; % font size for plots

% pick loop
for loopnamecell = {'A','B','M','C','D','E','F','G','H','I','J','K','L','N','BZ','kx','ky'}
% for loopnamecell = {'A'}

    clf;
    loopname = string(loopnamecell);
    % this was calculated separately by solving 2D band structure
    load('data_nonreciprocal_homotopyloops/data_nonreciprocal_min_eig_dist.mat');

    if loopname == 'A'
        load('data_nonreciprocal_homotopyloops/29Mar23-185611loopA_edr1_edi06_ea2.mat');
        braid = '\sigma_2';
    elseif loopname == 'B'
        load('data_nonreciprocal_homotopyloops/29Mar23-190039loopB_edr1_edi06_ea2.mat');
        braid = '\sigma_2 \sigma_1 \sigma_2^{-1}';
    elseif loopname == 'M'
        load('data_nonreciprocal_homotopyloops/29Mar23-190427loopM_edr1_edi06_ea2.mat');
        braid = '\sigma_2^{-1}';
    elseif loopname == 'C'
        load('data_nonreciprocal_homotopyloops/29Mar23-190821loopC_edr1_edi06_ea2.mat');
        braid = '\sigma_1^{-1}';
    elseif loopname == 'D'
        load('data_nonreciprocal_homotopyloops/29Mar23-191220loopD_edr1_edi06_ea2.mat');
        braid = '\sigma_1';
    elseif loopname == 'E'
        load('data_nonreciprocal_homotopyloops/29Mar23-191620loopE_edr1_edi06_ea2.mat');
        braid = '\sigma_3';
    elseif loopname == 'F'
        load('data_nonreciprocal_homotopyloops/29Mar23-192021loopF_edr1_edi06_ea2.mat');
        braid = '\sigma_3^{-1}';
    elseif loopname == 'G'
        load('data_nonreciprocal_homotopyloops/29Mar23-192431loopG_edr1_edi06_ea2.mat');
        braid = '\sigma_2^{-1}';
    elseif loopname == 'H'
        load('data_nonreciprocal_homotopyloops/29Mar23-192832loopH_edr1_edi06_ea2.mat');
        braid = '\sigma_2^{-1} \sigma_1^{-1} \sigma_2';
    elseif loopname == 'I'
        load('data_nonreciprocal_homotopyloops/29Mar23-193224loopI_edr1_edi06_ea2.mat');
        braid = '\sigma_2^{-1} \sigma_3 \sigma_2';
    elseif loopname == 'J'
        load('data_nonreciprocal_homotopyloops/29Mar23-193610loopJ_edr1_edi06_ea2.mat');
        braid = '\sigma_1 \sigma_3 \sigma_2 \sigma_1^{-1} \sigma_2^{-1} \sigma_3^{-1} \sigma_1^{-1}';
    elseif loopname == 'K'
        load('data_nonreciprocal_homotopyloops/29Mar23-194000loopK_edr1_edi06_ea2.mat');
        braid = '\sigma_2^{-1} \sigma_3 \sigma_2 \sigma_1 \sigma_2^{-1} \sigma_3^{-1} \sigma_2';
    elseif loopname == 'L'
        load('data_nonreciprocal_homotopyloops/29Mar23-194349loopL_edr1_edi06_ea2.mat');
        braid = '\sigma_2^{-1} \sigma_1^{-1} \sigma_2 \sigma_1 \sigma_2';
    elseif loopname == 'N'
        load('data_nonreciprocal_homotopyloops/30Mar23-100148loopN_edr1_edi06_ea2.mat');
        braid = '\sigma_3^{-1}';
    elseif loopname == 'BZ'
        load('data_nonreciprocal_homotopyloops/30Mar23-103147loopBZ_boundary_edr1_edi06_ea2.mat');
        braid = '\sigma_1^{-1} \sigma_2^{-1} \sigma_1 \sigma_2';
    elseif loopname == 'kx'
        load('data_nonreciprocal_homotopyloops/30Mar23-103717loopkx_boundary_edr1_edi06_ea2.mat');
        braid = '\sigma_2^{-1}\sigma_1^{-1}';
    elseif loopname == 'ky'
        load('data_nonreciprocal_homotopyloops/30Mar23-103953loopky_boundary_edr1_edi06_ea2.mat');
        braid = '\sigma_2';
    end

    realfreq_min = 0.600 *2*pi*c/a %yline
    realfreq_max = 1.150 *2*pi*c/a%yline
    imagfreq_min = 0.050 *2*pi*c/a%xline
    imagfreq_max = 0.550 *2*pi*c/a%xline

    % Plot the data
    ax(1) = subplot(1,2,1);
    for i = 1:size(k_colors,2)
        h2 = scatter3(imag_freq(:,i)*a/(2*pi*c),real_freq(:,i)*a/(2*pi*c),k_colors(:,i),20,imag_freq(:,i)*a/(2*pi*c),'filled');
        hold on;
    end
    zmin = min(k_colors(:))-1
    zmax = max(k_colors(:))+1
    zlim([zmin, zmax]);
    xlabel('Im($\omega)a/2 \pi c$','Interpreter','latex');
    ylabel('Re($\omega)a/2 \pi c$','Interpreter','latex');
%     zlabel(sprintf('loop trajectory \n (arb. units)'), 'Interpreter', 'latex')
    zlabel(sprintf('loop step index'), 'Interpreter', 'latex')
    colormap(ax(1),'parula')
    ylim([realfreq_min/( 2*pi*c/a) realfreq_max/( 2*pi*c/a)])
    xlim([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
%     cbar = colorbar(ax(1))
    % cbar.Position(1) = 0.35;
    caxis([imagfreq_min/( 2*pi*c/a) imagfreq_max/( 2*pi*c/a)])
    title(sprintf('$\\gamma_{%s} = %s$', loopname, braid),'Interpreter','latex')
%     cbar.YTick = linspace(cbar.Limits(1), cbar.Limits(2), 2);
%     cbar.Label.Interpreter = 'latex';
%     cbar.Label.String = 'Im($\omega)a/2 \pi c$'
%     cbar.Label.Position(1) = 1.5;
    ax(1).TickDir = 'in';
    box on;
    view(90, 0);
    set(gca, 'FontSize', fontSize);
    cmap = slanCM('gnuplot2');
    % flipped_cmap = flipud(cmap);
    set(ax(1), 'Colormap', cmap);


    % Plot loop trajectory in kx and ky plane
    ax(2) = subplot(1,2,2);
    % plot min eig distance
    x = linspace(0, 2, size(min_eig_dist', 2));
    y = linspace(0, 2, size(min_eig_dist', 1));
    imagesc(x,y,min_eig_dist')
    steps = 90; % to do with how min_eig_dist was plotted
    scalefactor = 1
    set(gca,'YDir','normal') 
%     cbar = colorbar;
%     cbar.Label.String = 'min eig dist'
%     cbar.Label.Interpreter = 'latex';
    set(gca,'ColorScale','log')
    hold on

    % plot loop
    cmap = jet(12); 
    for i=1:length(kx_loop_pts)-1
        % Plot the line segment
        line([kx_loop_pts(i), kx_loop_pts(i+1)]*scalefactor , [ky_loop_pts(i), ky_loop_pts(i+1)]*scalefactor , 'Color', 'red', 'LineWidth', 1.5);
        disp(kx_loop_pts(i))
        % drawing an arrow marker on matlab sucks, anyway i dont use diagonal
        % lines so i can use these markers
        % Calculate the midpoint of the line segment
        startpt = [kx_loop_pts(i), ky_loop_pts(i)];
        endpt = [kx_loop_pts(i+1), ky_loop_pts(i+1)];
        midpt = [(startpt(1) + endpt(1))/2, (startpt(2) + endpt(2))/2];
        % Determine the direction of the line segment
        dx = endpt(1) - startpt(1);
        dy = endpt(2) - startpt(2);
        if abs(dx) > abs(dy)
            if dx > 0
                marker = '>'; % Segment goes to the right
            else
                marker = '<'; % Segment goes to the left
            end
        else
            if dy > 0
                marker = '^'; % Segment goes up
            else
                marker = 'v'; % Segment goes down
            end
        end
        % Plot the marker at the midpoint
        plot(midpt(1)*scalefactor , midpt(2)*scalefactor , marker, 'Color', 'red','MarkerFaceColor','red','MarkerSize',4);
    end
    ylabel('$k_y$','Interpreter','latex');
    xlabel('$k_x$','Interpreter','latex');
    box on
    title(sprintf('Loop %s', string(loopname)),'Interpreter','latex');
    set(gca, 'FontSize', fontSize);
    axis square
    
%     % % save as matlab fig
    datestring = datestr(now,'ddmmmyy-HHMMSS');
    figFileName=(string(loopname))
    figFileName = strrep(figFileName,'.','');
    figFileName =strcat(figFileName,'.fig');
    new_folder_path = 'data_nonreciprocal_homotopyloops';
    fullFileName = fullfile(new_folder_path, figFileName);
    saveas(gcf,fullFileName)
    % % save as matlab png
    figFileName =strrep(figFileName,'.fig','.png');
    fullFileName = fullfile(new_folder_path, figFileName);
    saveas(gcf,fullFileName)
end

%plot just min eig distance
load('data_nonreciprocal_homotopyloops/data_nonreciprocal_min_eig_dist.mat');
a=0.04; % lattice width
c=299792458; % speed of light
fig = figure(5);
set(fig, 'Position', [0 0 300 300]);
fontSize = 12; % font size for plots
x = linspace(0, 2, size(min_eig_dist', 2));
y = linspace(0, 2, size(min_eig_dist', 1));
imagesc(x,y,min_eig_dist'*a/(2*pi*c))
steps = 90; % to do with how min_eig_dist was plotted
set(gca,'YDir','normal') 
cbar = colorbar;
caxis([min(min(min_eig_dist))*a/(2*pi*c), max(max(min_eig_dist))*a/(2*pi*c)]);
% Label the colorbar max and min ticks
cbar.Ticks = [min(min(min_eig_dist))*a/(2*pi*c), max(max(min_eig_dist))*a/(2*pi*c)];
cbar.TickLabels = {'0', num2str(round(max(max(min_eig_dist))*a/(2*pi*c),2))};
cbar.Label.String = 'log(min eig dist)'
cbar.Label.Interpreter = 'latex';
set(gca,'ColorScale','log')
ylabel('$k_y$','Interpreter','latex');
xlabel('$k_x$','Interpreter','latex');
box on
set(gca, 'FontSize', fontSize);
axis square
% Set the xticks and yticks
xticks([0, 0.5, 1, 1.5, 2]);
xticklabels({'0', '$\pi/2$', '$\pi$', '$3\pi/2$', '$2\pi$'});
yticks([0, 0.5, 1, 1.5, 2]);
yticklabels({'0', '$\pi/2$', '$\pi$', '$3\pi/2$', '$2\pi$'});
set(gca, 'TickLabelInterpreter', 'latex');

