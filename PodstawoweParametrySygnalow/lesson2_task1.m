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
ts = 0.0001;                    % unit time step
fs = 1/ts;                      % sampling frequency
A = 5.12;                       % amplitude
f = 5;                          % frequency of signal
k = 20000;                      % time amplification coefficient
delta_t = 1/fs;                 % some shit delta time (apparently equal to ts 0.o)
t = [0:delta_t:k*ts-delta_t];   % time vector
l_t = length(t);                % length (num of samples) of time vector

## OPERATIONS
y = sawtooth(2*pi*f*t).*A;      % creating sawtooth signal with proper amplitude (if want triangular wave use triplot() function)
plot(t,y,'-r');                 % plotting the samples (use stem() to see if no shift)

avg = mean(abs(y))              % calculating average value of the signal (arithmetic avg of absolute values of the signal)
E = sum(y.^2)                   % calculating energy of the signal (sum of squared modules of signal)
P = E/l_t                       % calculating power of the signal (energy of signal / number of samplings)
B = sqrt(P)                     % rms value of power
ff = B/avg                      % form factor of signal


