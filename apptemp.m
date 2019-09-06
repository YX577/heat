function AT = apptemp(T, RH, V)
%% Compute the Steadman's apparent temperature based on temperature, relative 
% humidity and wind speed
%
% Input:
%   T: Temperature (in degree Celsius)
%   RH: Relative humidity (in percentage) 
%   V: Wind speed at an elevation of 10 meters (in m/s)
%
% Output:
%   AT: apparent temperature 
%
%
% This script is implimented by by Dr. Ming Luo at Sun Yat-sen University
% (email: luo.ming@hotmail.com). For those using this script, your are 
% recommended to cite the following paper in your work: 
%   Luo, M., Lau, N.-C., 2018. Increasing heat stress in urban areas of 
%       eastern China: Acceleration by urbanization. Geophysical Research 
%       Letters, 45: 13060-13069, https://doi.org/10.1029/2018GL080306
%   Luo, M., Lau, N.-C., 2019. Characteristics of summer heat stress in China 
%       during 1979-2014: climatology and long-term trends. Climate
%       Dynamics, https://doi.org/10.1007/s00382-019-04871-5
%
%
% Reference:
% Steadman, R.G., 1984. A universal scale of apparent temperature. 
%       Journal of Climate and Applied Meteorology, 23: 1674-1687.
% Blazejczyk, K., Epstein, Y., Jendritzky, G., Staiger, H., Tinz, B., 2012. 
%       Comparison of UTCI to selected thermal indices. International 
%       Journal of Biometeorology, 56: 515-535.
%


% Saturation vapour pressure (Alduchov and Eskridge (1996))
A1 = 17.625;
B1 = 243.04;
C1 = 6.1094;
Es = C1 * exp(A1 * T ./ (B1 + T));

% Vapour pressure
vp = Es .* RH / 100;
clear Es;

% Apparent temperature 
AT = T + 0.33 * vp - 0.7 * V - 4.0;


