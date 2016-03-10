%##########################################################################
%Description: This program is used for detecting lane_change by use of GPS.
%Author: Maoxu Liu
%Contact:maoxul@umich.com
%Version:
%Copyright: University of Michigan Dearborn
%Date: 8/12/2015       Last modified date:
%##########################################################################
%%
close all;
clear;
clc;
v1=xlsread('v33.csv','C:D');
v2=xlsread('v44.csv','C:D');
v1_lat = v1(:,1);%LonVec
v1_lon = v1(:,2);%LatVec
v2_lat = v2(:,1);%LonVec
v2_lon = v2(:,2);%LatVec
fig=1;
%%
figure(fig);
hold on
plot(v1_lon,v1_lat,'.r','MarkerSize',10);
plot(v2_lon,v2_lat,'.b','MarkerSize',10);
hold off
plot_google_map;