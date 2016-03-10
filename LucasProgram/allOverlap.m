%list: all time overlap trips for each trip
%a: the trip summary table (index)
function list=allOverlap(a)
    n_index=length(a);
    i=1;
    list=cell(50000,8);
    for k1=1:n_index
    % k1 is the order of Unique trip Index

        t1=a{k1,6};
        t2=a{k1,10};
      %t1 and t2 is startTime and endTime of given trip

        t1=datenum(t1);
        t2=datenum(t2);

        vID=a{k1,1};
        tripID=a{k1,2};

        for k2=1:n_index
            if t1<a{k2,7} && a{k2,7}<t2 && t2<a{k2,11}
                list{i,4}=a{k2,2};
                list{i,7}=a{k2,7};
                list{i,8}=t2;


                list{i,3}=a{k2,1};
                list{i,5}=a{k2,6};
                list{i,6}=a{k2,10};  
                list{i,1}=vID;
                list{i,2}=tripID;
                i=i+1;
            elseif t1<a{k2,7} && t2>a{k2,11}
                list{i,4}=a{k2,2};
                list{i,7}=a{k2,7};
                list{i,8}=a{k2,11};


                list{i,3}=a{k2,1};
                list{i,5}=a{k2,6};
                list{i,6}=a{k2,10};       
                            list{i,1}=vID;
                list{i,2}=tripID;
                i=i+1;
            elseif a{k2,7}<t1 && t1<a{k2,11} && t2>a{k2,11}
                list{i,4}=a{k2,2};
                list{i,7}=t1;
                list{i,8}=a{k2,11};  


                list{i,3}=a{k2,1};
                list{i,5}=a{k2,6};
                list{i,6}=a{k2,10};
                            list{i,1}=vID;
                list{i,2}=tripID;
                i=i+1;
            elseif a{k2,7}<t1 && t1<a{k2,11} && a{k2,7}<t2 && t2<a{k2,11}
                list{i,4}=a{k2,2};
                list{i,7}=t1;
                list{i,8}=t2;


                list{i,3}=a{k2,1};
                list{i,5}=a{k2,6};
                list{i,6}=a{k2,10};
                            list{i,1}=vID;
                list{i,2}=tripID;
                i=i+1;

            % for the tripID itself

            else
            end
        end
    end
    
    for k3=1:i-1

         list{k3,7}=datestr(list{k3,7},'yyyy-mm-dd HH:MM:SS');
         list{k3,8}=datestr(list{k3,8},'yyyy-mm-dd HH:MM:SS');
    end
    list(i:50000,:)=[];
end