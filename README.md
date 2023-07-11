
# Point-gap topology and braids in photonic crystals using COMSOL with MATLAB scripting
MATLAB/ COMSOL scripts for studying point-gap topology / braiding in photonic crystals. I use COMSOL server and 
 automate scripts using MATLAB. 
 This repo was helpful: https://github.com/xiumingzhang/photonic-bandgap-comsol-matlab

 # Steps
1. Open COMSOL server from local computer
2. Run `comsol_init.m ` script (used https://www.youtube.com/watch?v=7E7g0SHc8c8&t)
3. You can make your geometry etc. in COMSOL. Then go files 'Compact history' (otherwise code is very long!) and save as model file for MATLAB
4. Copy and paste from the matlab file what you need. You can edit things such as `model.param.set('epsa',  num2str(epsa));
` in order to automate changing variables

# Files
The script `script_band_diagram_and_braid.m` uses helper functions `solve_band_diagram_and_braid.m`, `plot_band_diagram_and_braid.m`, `save_band_diagram_and_braid.m`, `helper_sweepkx_upd.m` and `helper_sweepky_upd.m` to plot the eigenvalue braids for some loop or path in the Brillouin zone for a 2D photonic crystal model which is in the models folder. It also plots the the complex band diagram (which is the braid projection from the (Im(w), Re(w)) plane)
![example_plot](https://github.com/janetzhong/Non-Hermitian-Photonic-Crystal-Topology-COMSOL-Matlab/assets/91340575/ed288b41-06dd-4abe-b7ae-2fec60104dc7)