function [hwCount, hwDays] = heatwave(tx, t0, minDur, isPlot)
%% This function identifies heatwaves from a daily temperature series. 
%   A heatwave is defined when the daily temperature exceeds a threshold for
%   at least several (e.g., three) days.
%  
% Input:
%   tx: temperature, a N-by-1 or 1-by-N vector
%   t0: threshold, a single number or a vector (N-by-1 or 1-by-N, same as tx) 
%   minDur: the shortest duration of a heatwave (e.g., 3)
%   isPlot: binary variable (i.e., true or false) to indicate showing the results
%
% Output:
%   hwCount: number of heatwave
%   hwDays: occurence date of heatwave. It is a two-column variable with the 
%           first one indicating the first day of a heatwave and the second 
%           indicating the last day of heatwave. Each row indicate one heat
%           wave.
%
%
% This script is implimented by by Dr. Ming Luo at Sun Yat-sen University. 
%
% For those using this script, your are recommended to cite the following 
%   papers in your work: 
%   Luo, M. & N.-C. Lau (2017) Heat waves in southern China: Synoptic 
%       behavior, long-term change, and urbanization effects. Journal of 
%       Climate, 30, 703–720, https://doi.org/10.1175/JCLI-D-16-0269.1
%   Luo, M., & Lau, N.-C. (2018). Increasing heat stress in urban areas of 
%       eastern China: Acceleration by urbanization. Geophysical Research 
%       Letters, 45: 13060-13069, https://doi.org/10.1029/2018GL080306
%

%
% Please contact us via email: luo.ming@hotmail.com if you have any
% questions or comments on this script.
%


% Search for the value where tmax >= t0
flag = (tx - t0) >= 0;
flag = reshape(flag, 1, []);


% Search for the start day when tmax >= t0
day1 = find(diff([0, flag]) == 1);


% Search for the last day when tmax >= t0
day2 = find(diff([flag, 0]) == -1);


% Obtain the durations of all possible heat waves
durations = day2 - day1 + 1;


% Search for heat waves longer than minDur
idxHW = find(durations >= minDur);


% Save the results
hwCount = length(idxHW);
hwDays = [day1(idxHW)', day2(idxHW)'];


if isPlot
    % show the orginal tmax series
    plot(tx,'.-b', 'displayName',  'tx');
    hold on;
    
    % show the threshold for identifying heat waves
    if length(t0) == 1
        plot(repmat(t0, size(tx)), '--k','displayName',  't0');
    else
        plot(t0, '--k', 'displayName',  't0');
    end
    
    % show the identified heat waves
    for i=1:hwCount
        day1 = hwDays(i, 1);
        day2 = hwDays(i, 2);
        
        plot(day1:day2, tx(day1:day2), '.-r', 'displayName',  'Heat wave');
    end
    
    hold off;
    set(gca, 'xlim', [1, length(tx)]);
    xlabel('Day');
    ylabel('Temperature');
end
