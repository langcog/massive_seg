function segScanEnd

thePath.start =  pwd;
thePath.script = [thePath.start '/scripts/'];
thePath.stim = [thePath.start '/stim/'];
thePath.data = [thePath.start '/data/'];
thePath.core = [thePath.start '/core/'];
% Add relevant paths. These paths are necessary for the experiment, but
% will not be saved permanently.
rmpath(thePath.script);
rmpath(thePath.stim);
rmpath(thePath.data);
rmpath(thePath.core);
