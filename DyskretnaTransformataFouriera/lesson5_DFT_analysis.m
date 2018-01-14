
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

### DFT ANALYSIS ACCORDING TO THE FILES ON MOODLE.PUT.POZNAN.PL ###

## CLEANUP
clear;
clc;
close all;

% Resolution and discrimination range
% M - length of the signal segment
% N - length of DFT
% resolution is equal to fs/M
% discrimination is equal to fs/N
%
% to make visible deltaf then: M>fs/deltaf

f1 = 10;                    % first frequency, cannot exceed fs/2
f2 = 20;                    % second frequency, cannot exceed fs/2

fs = 50;                    % sampling frequency
ts = 1/fs;                  % sampling time

disp(['Sampling period ts = ',num2str(ts),' s'])
% change M and N to observe FFT
M = 10;                     % number of original number of samples
N = 100;                    % fft size for this transform
deltaf = fs/N;              % resolution between stripes
deltar = fs/M;              % resolution to observe discrimination

disp(['Resolution of spectrum (width between stripes) deltaf = ', num2str(deltaf), ' Hz.'])
disp(['Discrimation in spectrum (difference of frequency) deltar = ', num2str(deltar), ' Hz.'])

x = 0;
t_1 = [0:ts:(M-1)*ts];      % time of original Signals
x1 = exp(1i*2*pi*f1*t_1);     % first signal (complex)
x2 = exp(1i*2*pi*f2*t_1);     % second signal (complex)

x = x1 + x2;                % sum of Signals
x = [x zeros(1,(N-M))];     % zero-padding the the vector of Signals
t_2 = [0:ts:(N-1)*ts];      % time vector + zeros
subplot(211);
plot(t_2, imag(x));
xlabel('time [s]');
ylabel('imaginary part from x(t)');
subplot(212);
F = [0:fs/N:(N-1)*fs/N];    % vector of spectrum
stem(F,abs(fft(x)),'r-');   % plotting the FFT
xlabel('Hz');
ylabel('Amplitude spectrum');
disp('********************************************');










