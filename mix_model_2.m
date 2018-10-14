   
flag=1000;
n=2;
m=1000;
cars=zeros(2,m);
v=zeros(2,m);
id=zeros(2,m);
vmax_m=4*ones(1,m);
vmax_m(500-10:500+10)=2;
vmax_m(500+10:500+20)=1;



p=0.5;
d2=2;
p_c1=0.3;
p_c2=0.9;
q1=1;
q2=1;
sumv=0;
ncar=0;
rho1=0;rho2=0;rho3=0;rho4=0;rho5=0;
rho=0;
J1=0;


cars_out=0;
cars_in=0;
cars_on1=0;cars_on2=0;cars_on3=0;
cars_on=0;

while flag>0
    
        temp_cars=cars;
        temp_v=v;
        temp_id=id;
        cars=zeros(2,m);
        v=zeros(2,m);
        id=zeros(2,m);
        cars_out=cars_out+sum(temp_cars(:,m));
                         % alway out when car in in the last cell   
        for ii=m-1:-1:1  % update from back to front
            vmax=vmax_m(ii);
            %% update lane 2
            if temp_cars(2,ii)==1 
                    d=0;  
                    if cars(2,ii+1:m)==0
                        d=vmax;
                    else
                        for jj=ii+1:m
                            if cars(2,jj)==0
                                d=d+1;
                            else
                                break;
                            end
                        end
                    end
                    
                    l=min(temp_v(2,ii)+1,vmax);
                    d_o=0; 
                    d_b=0; 
                    if d<l
                        if cars(1,ii+1:m)==0
                            d_o=vmax;
                        else
                            for jj=ii+1:m
                                if cars(1,jj)==0
                                    d_o=d_o+1;
                                else
                                    break;
                                end
                            end
                        end
                        
                        if ii<=vmax
                            d_b=0;
                        else
                            for jj=ii:-1:1
                                if temp_cars(1,jj)==0
                                    d_b=d_b+1;
                                else
                                    break
                                end
                            end
                        end
                    end
                 if temp_id(2,ii)==1
                    if rand(1)<p
                       l=max(l-1,0);
                    end
                    if d<l && d_o>d && d_b>=1 && rand(1)<p_c1
                        temp_vv=min([l,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    else
                        temp_vv=min([l,vmax,d]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    end
                    else %id(5,ii)==2
                   if d<l && d_o>d && d_b>=d2 && rand(1)<p_c2
                       temp_vv=min([temp_v(2,ii)+1,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        else
                        temp_vv=min([temp_v(2,ii)+1,vmax,d]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                   end
                 end      
            end
         
         
      
            %% updata lane 1
            if temp_cars(1,ii)==1 
                d=0;
                    if cars(1,ii+1:m)==0
                        d=vmax;
                    else
                        for jj=ii+1:m
                            if cars(1,jj)==0
                                d=d+1;
                            else
                                break;
                            end
                        end
                    end
                    
                    l=min(temp_v(1,ii)+1,vmax);
                    d_r=0; 
                    d_r_b=0;
                    if d<l
                     if cars(2,ii+1:m)==0
                        d_r=vmax;
                    else
                        for jj=ii+1:m
                            if cars(2,jj)==0
                                d_r=d_r+1;
                            else
                                break
                            end
                        end
                    end
                    
                    if ii<=vmax
                        d_r_b=0;
                    else
                        for jj=ii:-1:1
                            if temp_cars(2,jj)==0
                                d_r_b=d_r_b+1;
                            else
                                break
                            end
                        end
                    end
                    end 
                    
                    
                   if temp_id(1,ii)==1
                    if rand(1)<p
                       l=max(l-1,0);
                    end
                    if d<l && d_r>d && d_r_b>=1 && rand(1)<p_c1
                        temp_vv=min([l,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(1,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    else
                        temp_vv=min([l,vmax,d]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(1,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    end
                    else %id(5,ii)==2
                   if d<l && d_r>d && d_r_b>=d2 && rand(1)<p_c2
                       temp_vv=min([temp_v(1,ii)+1,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(1,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        else
                        temp_vv=min([temp_v(1,ii)+1,vmax,d]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(1,ii);
                        else
                            cars_out=cars_out+1;
                        end
                   end
                   end     
                 
            end
                
        end
      
        %% new car coming
        if rand(1)<q1
            if cars(1,1)==0
                cars(1, 1)=1;
                v(1,1)=randi(vmax,1);
                if rand(1)>q        %1为人类车，2为无人车
                id(1,1)=1;
                else
                id(1,1)=2;
                end
                cars_in=cars_in+1;
            end
        end
        if rand(1)<q2
            if cars(2,1)==0
                cars(2, 1)=1;
                v(2,1)=randi(vmax,1);
                if rand(1)>q       
                id(2,1)=1;
                else
                id(2,1)=2; 
                end
                cars_in=cars_in+1;
            end
        end

        
        cars_on=sum(cars(:));
        sumv=sum(v(:));
        cars_on2=sum(cars(2,:));
        cars_on1=sum(cars(1,:));
        rho1=cars_on1/m;
        rho2=cars_on2/m;
        rho=(rho1+rho2)/2;
        J1=sumv/cars_on;
        flag=flag-1;
    
   
end
