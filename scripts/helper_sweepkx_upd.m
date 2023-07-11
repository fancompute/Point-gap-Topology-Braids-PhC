

%%sweep kx



kx_range=kx_max-kx_min;
imag_freqskx = ones(NO_EIGENS, num_ksteps); % one row one curve
real_freqskx = ones(NO_EIGENS, num_ksteps); % one row one curve
%freqsweep=0:1:(ky_range/K_STEP_SIZE+1)-1
kxsweep=linspace(kx_min,kx_max,num_ksteps)
col_idx = 1;


%%% 
% k1 = ? and k2 = [-1, 1] 
ky=ky_set;
model.param.set('k1', num2str(kx_min, 15));
model.param.set('k2', num2str(ky, 15));

for k_var = kxsweep
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
    real_freqskx(:, col_idx) = -imag(sol_vals);
    imag_freqskx(:, col_idx) = -real(sol_vals);

    col_idx = col_idx+1;
    model.param.set('k1', num2str(k_var, 15));
    disp(k_var)
end

%imag_freqskx=-imag_freqskx %COMSOL CONVENTION










