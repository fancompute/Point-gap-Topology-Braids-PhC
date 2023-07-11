% % save as matlab fig
datestring = datestr(now,'ddmmmyy-HHMMSS');
% figFileName=strcat(datestring,'loop',string(loopname),...
figFileName=strcat(datestring,'kx',+strcat(num2str(kx_set, 15)),...
'_edr',strcat(num2str(epsd_re, 15)),...
'_edi',strcat(num2str(epsd_im, 15)),...
'_ea',strcat(num2str(epsa, 15)),'');
figFileName = strrep(figFileName,'.','');
figFileName =strcat(figFileName,'.fig');
new_folder_path = fullfile(results_folder_path, new_folder_name);
fullFileName = fullfile(new_folder_path, figFileName);
saveas(gcf,fullFileName)
% % save as matlab png
figFileName =strrep(figFileName,'.fig','.png');
new_folder_path = fullfile(results_folder_path, new_folder_name);
fullFileName = fullfile(new_folder_path, figFileName);
saveas(gcf,fullFileName)


% save data
datestring = datestr(now,'ddmmmyy-HHMMSS');
% dataFileName=strcat(datestring,'loop',string(loopname),...
dataFileName=strcat(datestring,'kx',+strcat(num2str(kx_set, 15)),...
'_edr',strcat(num2str(epsd_re, 15)),...
'_edi',strcat(num2str(epsd_im, 15)),...
'_ea',strcat(num2str(epsa, 15)),'');
dataFileName = strrep(dataFileName,'.','');
dataFileName =strcat(dataFileName,'.mat');
dataFileName = fullfile(new_folder_path, dataFileName);
save(dataFileName, 'kx_loop_pts', 'ky_loop_pts', 'imag_freq', 'real_freq', 'k_colors', 'colormap_vals', 'NO_EIGENS', 'realfreq_min', 'realfreq_max', 'imagfreq_min', 'imagfreq_max', 'epsd_re', 'epsd_im', 'epsa', 'model_name','a','c','loop_pts','kx_set')
