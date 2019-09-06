function WBT = swbgt(T, RH)
%% Compute the simplified wet-bulb globe temperature based on temperature 
%  relative humidity 
%
% Input:
%   T: Temperature (in degree Celsius )
%   RH: Relative humidity (in percentage) 
%
% Output:
%   sWBGT: Simplified wet-bulb global tempreature (sWBGT)
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
% Reference: 
% Willett, K.M., Sherwood, S., 2012. Exceedance of heat index thresholds 
%       for 15 regions under a warming climate using the wet?bulb globe 
%       temperature. International Journal of Climatology, 32: 161-177.
%





%%  Bureau of Meteorology
% Water vapour pressure (hPa)
e = RH / 100 * 6.105 .* exp ( 17.27 * T ./ ( 237.7 + T ) );

% Simplified WBGT
sWBGT =  0.567 * T + 0.393 * e + 3.94;
