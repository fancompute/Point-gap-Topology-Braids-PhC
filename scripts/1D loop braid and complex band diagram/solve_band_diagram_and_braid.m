% Initialize variables to store data
imag_freq = [];
real_freq = [];
k_colors = [];
colormap_vals = [];

for ind = linspace(1,length(kx_loop_pts)-1,length(kx_loop_pts)-1)
    kx_min = kx_loop_pts(ind); %technically its start and end, not min and max. might be flipped/ sweeping backwards
    kx_max = kx_loop_pts(ind+1);
    ky_min = ky_loop_pts(ind);
    ky_max = ky_loop_pts(ind+1);
    
    if kx_min == kx_max
        % this is a ky sweep
        kx_set = kx_min;
        run('../helper_sweepky_upd.m')
        imag_freq = [imag_freq; imag_freqsky];
        real_freq = [real_freq; real_freqsky];
        k_colors = [k_colors; (ind-1)*(NO_EIGENS-1)+kcolor];
        colormap_vals = [colormap_vals; repmat(cmap(mod(ind,12),:), [NO_EIGENS, 1])];
        
    elseif ky_min == ky_max        
        % this is a kx sweep
        ky_set = ky_min;
        run('../helper_sweepkx_upd.m')
        imag_freq = [imag_freq; imag_freqskx];
        real_freq = [real_freq; real_freqskx];
        k_colors = [k_colors; (ind-1)*(NO_EIGENS-1)+kcolor];
        colormap_vals = [colormap_vals; repmat(cmap(mod(ind,12),:), [NO_EIGENS, 1])];
    end
end