%##########################################################################
%Description:This function calculate moving direction of vehicle by 3
%adjacent GPS points.
%Author: Maoxu Liu
%Contact:maoxul@umich.com
%Version:
%Copyright: University of Michigan Dearborn
%Date: 8/12/2015       Last modified date:8/20/2015
%##########################################################################
%%
clear;clc;
close all;
load('V1_GPS.mat');
degree=[];
degree2=[];
degree(1)= vectorDegree(V1_lat(1),V1_lon(1),V1_lat(2),V1_lon(2));
degree(length(V1_lat))= vectorDegree(V1_lat(601),V1_lon(601),V1_lat(602),V1_lon(602));
for i=2:1:(length(V1_lat)-1)
    latC=V1_lat(i);lonC=V1_lon(i);
    latCnext=V1_lat(i+1);lonCnext=V1_lon(i+1);
    latCbefore=V1_lat(i-1);lonCbefore=V1_lon(i-1);
    D1(i)=vectorDegree(latC,lonC,latCnext,lonCnext);
    D2(i)=vectorDegree(latCbefore,lonCbefore,latC,lonC);
    degree(i)=(D1(i)+D2(i))/2;
end
%% Second method for moving direction.
for m=1:(length(V1_lat)-1)
    latC2=V1_lat(m);
    lonC2=V1_lon(m);
    latC2next=V1_lat(m+1);
    lonC2next=V1_lon(m+1);
    degree2(m)=vectorDegree(latC2,lonC2,latC2next,lonC2next);
end
degree2(length(V1_lat))=degree2(length(V1_lat)-1);