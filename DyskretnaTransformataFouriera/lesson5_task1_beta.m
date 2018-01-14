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

#### SPECTRUM ####
### SUBTASK 1 ###
ts = 0.01;                                      % sampling time
data = load("sawtooth.dat");                    % loading signal
num_sam = length(data);                         % number of samples - getting the lenght of data vector
t = [0:ts:(num_sam-1)*ts];                      % creating the time vector based on the number of samples and time sampling
figure(1);
plot(t,data,'-b');                              % plotting original signal
title("Signal to restore");
xlabel("time [s]");
ylabel("signal value");
grid on;
disp("Figure 1:")
meanValueData = mean(data)                      % debugging the mean value
variance = mean(((data.-mean(data)).^2))        % obtaining variance from definition
standd = sqrt(variance)                         % obtaining standard deviation from definition

### SUBTASK 2 ###
figure(2);
ts = 0.01;                                      % sampling time
data = load("sawtooth.dat");                    % loading signal
num_sam = length(data);                         % number of samples - getting the lenght of data vector
t = [0:ts:(num_sam-1)*ts];                      % creating the time vector based on the number of samples and time sampling
k = 0:num_sam-1;                                % ??? number of some fourier coefficients ???
MX = abs(fft(data));                            % absolute value/ module from fast fourier transform of Signal
stem(MX);                                       % plotting module
title("Module of FFT");
xlabel("samples");
ylabel("value");
grid on;

### SUBTASK 3 ###
figure(3);
ts = 0.01;                                      % sampling time
data = load("sawtooth.dat");                    % loading signal
num_sam = length(data);                         % number of samples - getting the lenght of data vector
t = [0:ts:(num_sam-1)*ts];                      % creating the time vector based on the number of samples and time sampling
k = 0:num_sam-1;                                % ??? number of some fourier coefficients ???
MX = abs(fft(data));                            % absolute value/ module from fast fourier transform of Signal
stem(k,MX);                                     % plotting module
title("Module of FFT (scaled by k)");           % if one takes min(data) and max(data) 
xlabel("samples");
ylabel("value");
grid on;
disp("Figure 3:")
minData = min(data)
maxData = max(data)

### SUBTASK 4 ###
figure(4);
ts = 0.01;                                      % sampling time
data = load("sawtooth.dat");                    % loading signal
data = data - mean(data);                       % balancing discrete values of signals, see in the output
MX = abs(fft(data));                            % absolute value/ module from fast fourier transform of Signal
num_sam = length(data);                         % number of samples - getting the lenght of data vector
k = 0:num_sam-1;                                % ??? number of some fourier coefficients ???
MX = abs(fft(data));                            % absolute value/ module from fast fourier transform of Signal
stem(k,MX);                                     % plotting module
title("Module of FFT (scaled and balanced)");
xlabel("samples");
ylabel("value");
grid on;
disp("Figure 4:")
minData = min(data)
maxData = max(data)

### SUBTASK 5 ###
figure(5);
ts = 0.01;                                      % sampling time
data = load("sawtooth.dat");                    % loading signal
data = data - mean(data);                       % balancing discrete values of signals, see in the output
MX = abs(fft(data));                            % absolute value/ module from fast fourier transform of Signal
num_sam = length(data);                         % number of samples - getting the lenght of data vector
k = 0:num_sam-1;                                % ??? number of some fourier coefficients ???
MX = abs(fft(data));                            % absolute value/ module from fast fourier transform of Signal
subplot(211);
title("Real and Imaginary values of FFT (scaled by k)");
stem(k,real(fft(data)));
grid on;
subplot(212);
stem(k,imag(fft(data)));
grid on;

#### SYNTHESIS ####
### SUBTASK 1 ###
figure(6);                                          
fs = 1/ts;                                      % sampling frequency
data = load("sawtooth.dat");
data = data - mean(data);
data = data(1:length(data)/2);                  % cutting signal in half
num_sam = length(data);
k = 0:1:num_sam-1;
df = fs/num_sam;                                % resolution between samples
t = 0:ts:(num_sam-1)*ts;                        % time of signal restored
f = k*df;                                       % frequency vector
DATA = fft(data);
plot(t,DATA);
title("FFT of data");
xlabel("time");
ylabel("FFT");

### SUBTASK 2 ###
figure (7);
fs = 1/ts;
data = load("sawtooth.dat");
data = data - mean(data);
data = data(1:length(data)/2);
k = 0:1:num_sam-1;
df = fs/num_sam;
n = k;
f = k*df;
DATA = fft(data);
ZEROS = zeros(1,num_sam);                       % zero padding(empty vector to be populated)
m = 24;                                         % harmonics number, m_max = num_sam/2 -1

for i=1:m                                       % restoring signal m-times
    eip = exp(1i*2*pi*i*3*n/num_sam);
    ein = exp(-1i*2*pi*i*3*n/num_sam);
    DATA1 = DATA(3*i+1)*eip/num_sam+conj(DATA(3*i+1))*ein/num_sam;
    ZEROS = ZEROS + DATA1;
    plot(t,ZEROS,'r');
    hold on;
end;


plot(t,data,'-b');
hold on;
title("Different harmonics and original signal");
xlabel("time");
ylabel("signal");

figure(8);
plot(t,data,'-b');
hold on;
plot(t,ZEROS,'-r');
title("Best-fit harmonics and original signal");
xlabel("time");
ylabel("signal");


