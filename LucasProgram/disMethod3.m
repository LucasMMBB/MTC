function d=disMethod3(lat1,lon1,lat2,lon2)
    theta1=(90-lat1)*pi/180;
    theta2=(90-lat2)*pi/180;
    lon1=lon1*pi/180;
    lon2=lon2*pi/180;
    deltaLon=lon2-lon1;
    d=6371.009*sqrt(theta1^2+theta2^2-2*theta1*theta2*cos(deltaLon));
end