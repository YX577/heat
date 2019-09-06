function wci = windchill(T, V)
%% This function computes the wind chill index.
%  
% Input:
%   T: temperature (in degree Celsius)
%   V: relative humidity (in m/s)
%
% Output:
%   wci: wind chill index (in degree Celsius)
%
%
% This script is implimented by by Dr. Ming Luo at Sun Yat-sen University. 
%
% For those using this script, your are recommended to cite the following 
%   papers in your work: 
%   Lin, L., Luo, M., Chan, T.O., Ge, E., Liu, X., Zhao, Y., Liao, W., 2019. 
%       Effects of urbanization on winter wind chill conditions over China. 
%       Science of the Total Environment, 688: 389–397, 
%       https://doi.org/10.1016/j.scitotenv.2019.06.145
%   Luo, M., Lau, N.-C., 2018. Increasing heat stress in urban areas of 
%       eastern China: Acceleration by urbanization. Geophysical Research 
%       Letters, 45: 13060-13069, https://doi.org/10.1029/2018GL080306
%
% Please contact us via email: luo.ming@hotmail.com if you have any
% questions or comments on this script.
%
% Reference:
%   Mekis, É., Vincent, L.A., Shephard, M.W., Zhang, X., 2015. Observed 
%      trends in severe weather conditions based on humidex, wind chill, 
%      and heavy rainfall events in Canada for 1953–2012. Atmosphere-Ocean, 53: 383-397.
%   http://climate.weather.gc.ca/glossary_e.html
%


V = V * 3.6; % convert m/s to km/h

wci = nan(size(T));

% When T > 10
idx0 = find(T>10);    
wci(idx0) = T(idx0); 


% When T <= 10 & V >= 5 km/h (Osczevski and Bluestein, 2005)
idx1 = find(T<=10 & V >= 5);        
wci(idx1) = 13.12 + 0.6215 * T(idx1) ...
            - 11.37 * V(idx1) .^ 0.16 ...
            + 0.3965 * T(idx1) .* V(idx1) .^ 0.16;
       
% When T <= 10 & V < 5 km/h (Mekis et al. 2015; http://climate.weather.gc.ca/glossary_e.html)
idx2 = find(T<=10 & V < 5);
wci(idx2) = T(idx2) + ((-1.59+0.1345 * T(idx2))/5) .* V(idx2);



        
        