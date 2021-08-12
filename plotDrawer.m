clc;
close all;

f = input('Enter Carrier Frequency [800-2000MHz] ');
d = input('Enter receiver-transmitter distance [m] ');
numThin = input('Enter number of thin walls ');
numThick = input('Enter number of thick walls ');
numFloors = input('Enter number of floors ');

loss = mwm(f, d, numThin, numThick, numFloors);