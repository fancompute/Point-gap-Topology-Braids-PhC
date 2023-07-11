HOME = pwd;
cd('C:\Program Files\COMSOL\COMSOL55\Multiphysics\mli');
% check which port it says when you open comsol server, and edit below
mphstart(2036);
cd(HOME);

import com.comsol.model.*
import com.comsol.model.util.*

disp('Livelink is ready');