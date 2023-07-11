

%% then sweep ky

%kx=0.5;

ky_range=ky_max-ky_min;
imag_freqsky = ones(NO_EIGENS, num_ksteps); % one row one curve
real_freqsky = ones(NO_EIGENS, num_ksteps); % one row one curve
%freqsweep=0:1:(ky_range/K_STEP_SIZE+1)-1
kysweep=linspace(ky_min,ky_max,num_ksteps)
col_idx = 1;


%%% 
% k1 = ? and k2 = [0, 2] 
kx=kx_set;
model.param.set('k1', num2str(kx, 15));
model.param.set('k2', num2str(ky_min, 15));

for k_var = kysweep
    model.sol('sol1').runAll; % solve
    sol_info = mphsolinfo(model);
    sol_vals = sol_info.solvals;
    % sanity check
    sol_size = size(sol_vals);
    if sol_size(1) > NO_EIGENS
        %disp('Extra free solutions truncated.');
        sol_vals = sol_vals(1:NO_EIGENS);
    elseif sol_size(1) < NO_EIGENS
        %disp('Not enough solutions returnted. 1 padded.');
        tail = ones(NO_EIGENS-sol_size(1), 1);
        sol_vals = [sol_vals; tail];
    end
    real_freqsky(:, col_idx) = -imag(sol_vals);
    imag_freqsky(:, col_idx) = -real(sol_vals);

    col_idx = col_idx+1;
    model.param.set('k2', num2str(k_var, 15));
    disp(k_var)
end







