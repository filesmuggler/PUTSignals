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

### TASK 3 ###
## CLEANUP
clear;
clc;
close all;

## DATA
A = load("u.dat");                  % loading signal data
l = length(A);                      % getting length of data column-vector    
s = [0:1:l-1];                      % creating simple sample vector
A = A(:);                           % transform A into row-vector
plot(s,A,'-r');                     % plot input signal of voltage
R = 0.01;

## OPERATIONS
P = A.*A/R;                         % calculating vector of power
avg = mean(abs(P))                  % average power dissipated by resistor