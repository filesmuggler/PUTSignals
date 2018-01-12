## Copyright (C) 2017 Krzysztof Stezala <krzste09@outlook.com>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.
##
## Purpose of the program:
## Signals analysis for SaDS laboratories at Poznan University of Technology

### TASK 1 ###
## CLEANUP
clear;
clc;
close all;

## DATA
m_value = -4.2;                             % mean value
std = 2.3;                                  % standard deviation
num_sam = 20000;                            % number of samples

## OPERATIONS
data = std.*randn(num_sam,1)+m_value;       % generate random signal with 20 samples and given requirements

#### NON-NORMALIZED
[heights,locations] = hist(data,10);        % getting histogram heights in the locations
width = locations(2) - locations(1);        % getting width of the single location
sh1 = sum(heights)
pdf = heights / num_sam;                    % some weird shit normalizing the histogram with respect to the probablity density function (PDF)
sp1 = sum(pdf)
bar(locations,heights,'hist');              % 'baring' histogram
hold on;                                    % keeping histogram on the figure
n = [locations(1):width:locations(10)];     % creating vector for PDF
plot(n,pdf,'-r');                           % plotting PDF
title("NON-NORMALIZED");
xlabel("values");
ylabel("number of samples");
grid on;


#### NORMALIZED
figure(2);
[heights,locations] = hist(data,10);        % getting histogram heights in the locations
width = locations(2) - locations(1);        % getting width of the single location
sh2 = sum(heights)
pdf = heights / (num_sam*width);            % some weird shit normalizing the histogram with respect to the probablity density function (PDF)
sp2 = sum(pdf)
bar(locations,heights,'hist');              % 'baring' histogram
hold on;                                    % keeping histogram on the figure
n = [locations(1):width:locations(10)];     % creating vector for PDF
plot(n,heights,'-r');                       % plotting PDF (not visible much, click autoscale to see)
title("NORMALIZED");
xlabel("values");
ylabel("number of samples");
grid on;
