%##########################################################################
%Description:This function calculate the direction degree of two GPS points
%The degree is the vector Degree from point 1 to point 2.
%Author: Yifu Liu
%Modified by Maoxu Liu
%Contact:maoxul@umich.com
%Version:
%Copyright: University of Michigan Dearborn
%Date: 8/12/2015       Last modified date:8/20/2015
%##########################################################################
function degree= vectorDegree(lat1,lon1,lat2,lon2)
    c=disMethod4(lat1,lon1,lat2,lon2);
    a=disMethod4(lat1,lon1,lat1,lon2);
    deg=acos(a/c);
    if lat1==lat2 && lon1==lon2
        degree=360;
    elseif lat1==lat2 && lon1<lon2
        degree=0;
    elseif lat1==lat2 && lon1>lon2
        degree=180;
    elseif lat1<lat2 && lon1==lon2
        degree=90;
    elseif lat1>lat2 && lon1==lon2
        degree=270;        
    elseif lat1<lat2 && lon1<lon2
        degree=(deg/pi)*180;        
    elseif lat1<lat2 && lon1>lon2
        degree=180-(deg/pi)*180;
    elseif lat1>lat2 && lon1>lon2
        degree=180+(deg/pi)*180;
    else % lat1>lat2 && lon1<lon2
        degree=360-(deg/pi)*180;
    end
end