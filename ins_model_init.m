model_version = 'v0.1.1';
model_name = 'Base INS';

%% Load configuration
load('ins_default_config');
wmm = load('wmmgrid_2021.mat');

%% Constant Variable (for internal use)
INS_CONST.dt = 0.002;   % step time in s
INS_CONST.g = single(9.8055);   % gravity constant
INS_CONST.wmm_mag = wmm.wmmgrid_mag;
INS_CONST.wmm_dec = wmm.wmmgrid_dec;
INS_CONST.wmm_inc = wmm.wmmgrid_inc;

%% Exported Value
INS_EXPORT_VALUE.period = uint32(INS_CONST.dt*1e3); 
INS_EXPORT_VALUE.model_info = int8([model_name, ' ', model_version, 0]); % 0 for end of string

INS_EXPORT = Simulink.Parameter(INS_EXPORT_VALUE);
INS_EXPORT.CoderInfo.StorageClass = 'ExportedGlobal';

%% Paramaters
% INS_PARAM_VALUE.GyroBias = single([0;0;0]);
% INS_PARAM_VALUE.GyroRotMat = single(eye(3));
% INS_PARAM_VALUE.AccBias = single([0;0;0]);
% INS_PARAM_VALUE.AccRotMat = single(eye(3));
% INS_PARAM_VALUE.MagBias = single([0;0;0]);
% INS_PARAM_VALUE.MagRotMat = single(eye(3));
% 
% INS_PARAM_VALUE.GyroBias2 = single([0;0;0]);
% INS_PARAM_VALUE.GyroRotMat2 = single(eye(3));
% INS_PARAM_VALUE.AccBias2 = single([0;0;0]);
% INS_PARAM_VALUE.AccRotMat2 = single(eye(3));
% INS_PARAM_VALUE.MagBias2 = single([0;0;0]);
% INS_PARAM_VALUE.MagRotMat2 = single(eye(3));
% 
% INS_PARAM_VALUE.LevelXOFF = single(0);
% INS_PARAM_VALUE.LevelYOFF = single(0);
% 
% INS_PARAM_VALUE.USE_EXTERN_FILTER = uint8(0); % Use External Filter for IMU
% 
% INS_PARAM = Simulink.Parameter(INS_PARAM_VALUE);
% INS_PARAM.CoderInfo.StorageClass = 'ExportedGlobal';
