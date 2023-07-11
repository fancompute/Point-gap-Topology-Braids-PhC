%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Stuff to fill out
tic;

% Solver or plot variables
NO_EIGENS=20; % number of eigenvalues solved for in comsol
num_ksteps =60; % number of steps per (kx,ky) se
fontSize = 14; % font size for plots
kcolor=repmat(linspace(1,NO_EIGENS,num_ksteps),NO_EIGENS,1); %used for a plot
cmap = jet(12); %used for a plot
% Constants
a=0.04; % lattice width
c=299792458; % speed of light

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Create a results folder with date and folder name
% experiment_folder_name = 'nonreciprocal_ky0to2_120steps'
% new_folder_name = strcat(datestr(now,'ddmmmyy-HHMMSS-'),experiment_folder_name);
% results_folder_path = '../../results';
% mkdir(results_folder_path, new_folder_name);

% for kx_set = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2]
for kx_set = [1]
    for loopname = {'H'}
    % for epsd_re = [1];
        epsd_re = 1;
        epsd_im = 0.6;
        epsa = 2;


        % PICK COMSOL MODEL TO USE
        model_name = 'model_nonreciprocal_trianglecircle_oct22.m';
        % Define the path to the models folder and run the model
        models_folder_path = '../../models';
        run(fullfile(models_folder_path, model_name));
        % Define the (kx,ky) path taken in Brillouin zone (divided by pi)
        % Examples: BZ boundary [0 0; 2 0; 2 2; 0 2; 0 0]

        % for kx slices (reciprocal_findEP, nonreciprocal_slices plots)
        %     kx_set = 1.015;
        %     loop_pts = [kx_set 0; kx_set 2];

        % for homotopy loop plots (nonreciprocal_loops plots)
        % full list
        % {'A','B','M','C','D','E','F','G','H','I','J','K','L','N','BZ_boundary'}
        if string(loopname) == 'A'
            loop_pts = [0 0; 0 1.7; 0.8 1.7; 0.8 2; 0 2; 0 0];
        elseif string(loopname) == 'B'
            loop_pts = [0 0; 0 1.6; 0.8 1.6; 0.8 1.7; 0 1.7; 0 0];
        elseif string(loopname) == 'M' %called x in older plots
            loop_pts = [0 0; 0 1.39; 0.6 1.39; 0.6 1.5; 0 1.5; 0 0];
        elseif string(loopname) == 'C'
            loop_pts = [0 0; 0 1.32; 0.6 1.32; 0.6 1.39; 0 1.39; 0 0];
        elseif string(loopname) == 'D'
            loop_pts = [0 0; 0 1.12; 0.155 1.12; 0.155 1.32; 0 1.32; 0 0];
        elseif string(loopname) == 'E'
            loop_pts = [0 0; 0 1.05; 0.3 1.05; 0.3 1.15; 0 1.15; 0 0];
        elseif string(loopname) == 'F'
            loop_pts = [0 0; 0 0.37; 0.3 0.37; 0.3 0.5; 0 0.5; 0 0];
        elseif string(loopname) == 'G'
            loop_pts = [0 0; 0 0.25; 0.3 0.25; 0.3 0.37; 0 0.37; 0 0];
        elseif string(loopname) == 'H'
            loop_pts = [0 0; 0.45 0; 0.45 0.45; 0.3 0.45; 0.3 0; 0 0];
        elseif string(loopname) == 'I'
            loop_pts = [0 0; 0.9 0; 0.9 0.45; 0.75 0.45; 0.75 0; 0 0];
        elseif string(loopname) == 'J'
            loop_pts = [0 0; 0 0.6; 1.1 0.6; 1.1 0.9; 0 0.9; 0 0];
        elseif string(loopname) == 'K'
            loop_pts = [0 0; 1.3 0; 1.3 1.3; 1 1.3; 1 0; 0 0];
        elseif string(loopname) == 'L'
            loop_pts = [0 0; 2 0; 2 2; 1.8 2; 1.8 0; 0 0]; 
        elseif string(loopname) == 'N'
            loop_pts = [0 0; 0 1.3; 0.25 1.3; 0.25 1.1; 0.5 1.1; 0.5 1.3; 0 1.3; 0 0];
        elseif  string(loopname) == 'BZ_boundary'
            loop_pts = [0 0; 2 0; 2 2; 0 2; 0 0]; 
        elseif  string(loopname) == 'kx_boundary_bot'
            loop_pts = [0 0; 2 0]; 
        elseif  string(loopname) == 'ky_boundary_bot'
            loop_pts = [0 0; 0 2]; 
        elseif  string(loopname) == 'kx_boundary_top'
            loop_pts = [0 2; 2 2]; 
        elseif  string(loopname) == 'ky_boundary_top'
            loop_pts = [2 0; 2 2]; 
        elseif  string(loopname) == 'temp'
%             loop_pts = [0 ky_set;2 ky_set]; 
            loop_pts = [kx_set 0 ;kx_set 2]; 
        end


        kx_loop_pts = loop_pts(:,1);
        ky_loop_pts = loop_pts(:,2);


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


        solve_band_diagram_and_braid;

        % Define a range for all the plots (too many bands)
        % This is the max range
        realfreq_min = min(real_freq(:)); %yline
        realfreq_max = max(real_freq(:)); %yline
        imagfreq_min = min(imag_freq(:)); %xline
        imagfreq_max = max(imag_freq(:)); %xline
        % Edit and comment/ uncomment below to zoom in and out, replot and save
        plot_band_diagram_and_braid;
%         save_band_diagram_and_braid;

        % used for figure_reciprocal_findEP
%         realfreq_min = 0.30 *2*pi*c/a; %yline
%         realfreq_max = 0.62 *2*pi*c/a; %yline
%         imagfreq_min = 0.005 *2*pi*c/a; %xline
%         imagfreq_max = 0.025 *2*pi*c/a; %xline

        % used for figure_nonreciprocal_slices and homotopy loops
        realfreq_min = 0.600 *2*pi*c/a; %yline
        realfreq_max = 1.150 *2*pi*c/a; %yline
        imagfreq_min = 0.050 *2*pi*c/a; %xline
        imagfreq_max = 0.550 *2*pi*c/a; %xline
        
        % used for figure_nonreciprocal figure eight
%         realfreq_min = 0.750 *2*pi*c/a %yline
%         realfreq_max = 0.970 *2*pi*c/a%yline
%         imagfreq_min = 0.29 *2*pi*c/a%xline
%         imagfreq_max = 0.380 *2*pi*c/a%xline
        
%         plot_band_diagram_and_braid;
%         plot_band_and_braid_animation;

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%         save_band_diagram_and_braid;
    end
end

toc;

   


