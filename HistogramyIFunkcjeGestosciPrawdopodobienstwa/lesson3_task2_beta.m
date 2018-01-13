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

### TASK 2 ###
## CLEANUP
clear;
clc;
close all;


#### SUBTASK 1 ####                             % just extract and buil histogram
#  ## DATA                                     
#   columnsTotal = 10;                          % total number of columns in csv file
#   columToExtractFrom = 5;                     % index of column to extract from to get next columns only
#   numberOfBins = 49;                          % number of bins, precision of histogram    
#   A = dlmread('lotto.csv',';',0,0);           % reading csv file
#   B = A(:,columToExtractFrom:columnsTotal);   % extracting and asigning the last 6 columns of csv file to new matrix

#   ## OPERATIONS
#   data = B(:);                                % vectorizing matrix
#   hist(data,numberOfBins);                    % displaying simple histogram of values

#### SUBTASK 2 ####                                 % added PDF checking
#    ## DATA                                     
#    columnsTotal = 10;                              % total number of columns in csv file
#    columToExtractFrom = 5;                         % index of column to extract from to get next columns only
#    numberOfBins = 49;                              % number of bins, precision of histogram    

#    A = dlmread('lotto.csv',';',0,0);               % reading csv file
#    B = A(:,columToExtractFrom:columnsTotal);       % extracting and asigning the last 6 columns of csv file to new matrix

#   ## OPERATIONS
#    data = B(:);                                    % vectorizing matrix
#    num_sam = length(data);
#    hist(data,numberOfBins);                        % displaying simple histogram of values
#    [heights,locations] = hist(data,numberOfBins);  %hist returns the data from graph
#    width = locations(2) - locations(1);            % getting width of the single location
#    sh1 = sum(heights)                          
#    pdf = heights / num_sam;                        % some weird shit normalizing the histogram with respect to the probablity density function (PDF)
#    sp1 = sum(pdf)
#    bar(locations,heights,'hist');                  % 'baring' histogram
#    hold on;                                        % keeping histogram on the figure
#    n = [locations(1):width:locations(numberOfBins)];     % creating vector for PDF
#    plot(n,pdf,'-r');                               % plotting PDF
#    title("NON-NORMALIZED");
#    xlabel("values");
#    ylabel("number of samples");
#    grid on;
#    [val,ind]=max(pdf)
#    mean(data)

#### SUBTASK 3 ####                                  % normalized subtask 2 
#    ## DATA                                     
#    columnsTotal = 10;                              % total number of columns in csv file
#    columToExtractFrom = 5;                         % index of column to extract from to get next columns only
#    numberOfBins = 49;                              % number of bins, precision of histogram    

#    A = dlmread('lotto.csv',';',0,0);               % reading csv file
#    B = A(:,columToExtractFrom:columnsTotal);       % extracting and asigning the last 6 columns of csv file to new matrix

#   ## OPERATIONS
#    data = B(:);                                    % vectorizing matrix
#    num_sam = length(data);
#    hist(data,numberOfBins);                        % displaying simple histogram of values
#    [heights,locations] = hist(data,numberOfBins);  %hist returns the data from graph
#    width = locations(2) - locations(1);            % getting width of the single location
#    sh1 = sum(heights)                          
#    pdf = heights / (num_sam*width);                % some weird shit normalizing the histogram with respect to the probablity density function (PDF)
#    sp1 = sum(pdf)                                  % normalized sum is slightly (+0.02) higher than 1, but no idea why
#    bar(locations,heights,'hist');                  % 'baring' histogram
#    hold on;                                        % keeping histogram on the figure
#    n = [locations(1):width:locations(numberOfBins)];     % creating vector for PDF
#    plot(n,heights,'-r');                           % plotting PDF
#    title("NON-NORMALIZED");
#    xlabel("values");
#    ylabel("number of samples");
#    grid on;
#    [val,ind]=max(pdf)
#    mean(data)

