% Before compiling, set 'cudaRootDir' and 'cudnnRootDir' to your cuda and 
% cudnn directories, respectively.
% compile MatConvNet
addpath(fullfile(fileparts(mfilename('fullpath')),'matconvnet','matlab'));
vl_setupnn
if ~ispc
  cudaRootDir = '/usr/local/cuda-8.0';
  cudnnRootDir = cudaRootDir;
  cudaMethod = 'mex';
else
  cudaRootDir = 'C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0';
  cudnnRootDir = 'E:\CUDNN\cudnn+cuda\CUDA9.1_CUDNN7.05_Win10\cudnn-9.1-windows10-x64-v7';
  cudaMethod = 'nvcc';
end
vl_compilenn('enableGpu', true, ...
               'cudaRoot', cudaRootDir, ...
               'cudaMethod', cudaMethod, ...
               'enableCudnn', 'true', ...
               'cudnnRoot', cudnnRootDir, ...
               'verbose', 1) ;

% compile MexConv3D
run(fullfile(fileparts(mfilename('fullpath')), ...
         'MexConv3D', 'make_all.m')) ;       
run(fullfile(fileparts(mfilename('fullpath')), ...
         'MexConv3D', 'setup_path.m')) ;   