% Flight Data - Group 5
% Author: Design, Build, Crash, LLC.
% Date: April 23, 2014
clear all
close all
clc

data = importdata('Flight_Data.xlsx'); 
time = data.data(1:6129,1)/1000; %ms, time since start
altitude = data.data(1:6129,2); % ft, altimeter altitude
raltitude = altitude + 853; % ft, altitude adjusted for Bremen, IN elevation
speed = data.data(1:6129,3); % mph, speed pitot
A = data.data(1:6129,4); % V, port A
B = data.data(1:6129,5); % V, port B
gpslat = data.data(1:6129,6); % GPS latitude
gpslon = data.data(1:6129,7); % GPS longitude
gpsalt = data.data(1:6129,8); % ft, GPS altitude
gpsspeed = data.data(1:6129,9); % mph, GPS speed
gpscourse = data.data(1:6129,10); % deg, heading
gpsdist = data.data(1:6129,11); % ft, GPS distance from start
gpsutc = data.data(1:6129,12); % GPS UTC time

avg = mean(speed(2500:5000));
max = max(speed(2500:5000));
min = min(speed(2500:5000));
clear data

figure;
subplot(1,2,1)
plot(time(3360:3750),raltitude(3360:3750),'k');
xlabel('TIME (s)');
ylabel('ALTITUDE ABOVE SEA LEVEL (FT)');
title('Trial 1');
grid on
subplot(1,2,2);
plot(time(4100:4600),raltitude(4100:4600),'k');
xlabel('TIME (s)');
ylabel('ALTITUDE ABOVE SEA LEVEL (FT)');
title('Trial 2');
grid on

average(1:2501)=avg;
figure;
plot(time(2500:5000),speed(2500:5000),'k-',time(2500:5000),average,'k-.');
xlabel('TIME (s)');
ylabel('FLIGHT SPEED (MPH)');
axis([250 500 15 50]);
legend('Flight Data','Average Speed');
grid on





