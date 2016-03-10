function d=disMethod4(lat1,lon1,lat2,lon2)
    a=111.3237*(lat2-lat1);
    b=111.1350*(lon2-lon1)*cos((lat2+lat1)*pi/360);
    d=sqrt(a^2+b^2);
end