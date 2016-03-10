function list=vDis(v1,v2)
%##########################################################################
%Description:This program is uesd for generating the overlapping part of
%two routes.This function is to generate the first table
% INPUT: v1 and v2 are N*6 raw data table with normalized time 1s or 0.1s
% OUTPUT:the time overlap information of two vehicles
%and output contains the time, distance(km), relative position degree
% PS: it takes the one which goes first as master vehicle
%Author: YIFU LIU
%Contact:maoxul@umich.com
%Version:
%Copyright: University of Michigan Dearborn
%Date: 8/12/2015       Last modified date:8/20/2015
%##########################################################################
if v1(1,5)>=v2(1,5)
    temp=v1;
    v1=v2;
    v2=temp;
end
n1=length(v1);
n2=length(v2);
for k=1:n1
    if v1(k,5)==v2(1,5)
        break
    end
end
list=zeros(n1+n2,3);
i=1;
a=0;    % a and b is increment order to avoid time line missing
b=0;
for k2=k:n1
    if k2-k+1+b<=n2 && k2+a<=n1
        if(v1(k2+a,5)==v2(k2-k+1+b,5))
            list(i,1)=v1(k2+a,5);
            list(i,2)=disMethod4(v1(k2+a,3),v1(k2+a,4),v2(k2-k+1+b,3),v2(k2-k+1+b,4));
            list(i,3)=vectorDegree(v1(k2+a,3),v1(k2+a,4),v2(k2-k+1+b,3),v2(k2-k+1+b,4));
            i=i+1;
        elseif v1(k2+a,5)<v2(k2-k+1+b,5)
            a=a+1;
        elseif v1(k2+a,5)>v2(k2-k+1+b,5)
            b=b+1;
        end
    end
end
list(i:end,:)=[];
end