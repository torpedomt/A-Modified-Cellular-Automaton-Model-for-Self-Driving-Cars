figure(2);
for q=0:0.1:1
flag=500;
n=4;
m=100;
cars=zeros(4,m);
v=zeros(4,m);
id=zeros(4,m);
vmax=2;

p=0.2;
p_c1=0.5;
p_c2=1;
q1=1;
q2=1;
q3=1;
q4=1;
sumv=0;
ncar=0;
rho1=0;rho2=0;rho3=0;rho4=0;
rho=0;
da=0;
rhoc=0;
va=0;
J=0;
J1=0;
J2=0;

cars_out=0;
cars_in=0;
cars_on1=0;cars_on2=0;cars_on3=0;cars_on4=0;
cars_on=0;




while flag>0
    
        temp_cars=cars;
        temp_v=v;
        temp_id=id;
        cars=zeros(4,m);
        v=zeros(4,m);
        id=zeros(4,m);
        cars_out=cars_out+sum(temp_cars(:,m));
                         % alway out when car in in the last cell   
        for ii=m-1:-1:1  % update from back to front
            %% update lane 4
            if temp_cars(4,ii)==1 
                    d=0;  
                    if cars(4,ii+1:m)==0
                        d=vmax;
                    else
                        for jj=ii+1:m
                            if cars(4,jj)==0
                                d=d+1;
                            else
                                break;
                            end
                        end
                    end
                    
                    l=min(temp_v(4,ii)+1,vmax);
                    d_o=0; 
                    d_b=0; 
                    if d<l
                        if cars(3,ii+1:m)==0
                            d_o=vmax;
                        else
                            for jj=ii+1:m
                                if cars(3,jj)==0
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
                                if cars(3,jj)==0
                                    d_b=d_b+1;
                                else
                                    break
                                end
                            end
                        end
                    end
                 if temp_id(4,ii)==1
                    if rand(1)<p
                       l=max(l-1,0);
                    end
                    if d<l && d_o>d && d_b>0 && rand(1)<p_c1
                        temp_vv=min([l,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(4,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    else
                        temp_vv=min([l,vmax,d]);
                        if ii+temp_vv<=m
                            cars(4,ii+temp_vv)=1;
                            v(4,ii+temp_vv)=temp_vv;
                            id(4,ii+temp_vv)=temp_id(4,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    end
                    else %id(5,ii)==2
                   if d<l && d_o>d && d_b>1 && rand(1)<p_c2
                       temp_vv=min([temp_v(4,ii)+1,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(4,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        else
                        temp_vv=min([temp_v(4,ii)+1,vmax,d]);
                        if ii+temp_vv<=m
                            cars(4,ii+temp_vv)=1;
                            v(4,ii+temp_vv)=temp_vv;
                            id(4,ii+temp_vv)=temp_id(4,ii);
                        else
                            cars_out=cars_out+1;
                        end
                   end
                 end      
            end
         
        
            %% update lane 3
            if temp_cars(3,ii)==1
                    d=0;  
                    if cars(3,ii+1:m)==0
                        d=vmax;
                    else
                        for jj=ii+1:m
                            if cars(3,jj)==0
                                d=d+1;
                            else
                                break;
                            end
                        end
                    end
                    
                    d_r=0; 
                    d_r_b=0; 
                    
                    if cars(4,ii+1:m)==0
                        d_r=vmax;
                    else
                        for jj=ii+1:m
                            if cars(4,jj)==0
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
                            if cars(4,jj)==0
                                d_r_b=d_r_b+1;
                            else
                                break
                            end
                        end
                    end
                    
                    l=min(temp_v(3,ii)+1,vmax);
                    d_o=0; 
                    d_b=0; 
                    if d<l
                        if cars(2,ii+1:m)==0
                            d_o=vmax;
                        else
                            for jj=ii+1:m
                                if cars(2,jj)==0
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
                                if cars(2,jj)==0
                                    d_b=d_b+1;
                                else
                                    break
                                end
                            end
                        end
                    end
                    
                    
               if temp_id(3,ii)==1
                    if rand(1)<p
                       l=max(l-1,0);
                    end
                    if  d<l && d_r>d && d_r_b>0 && d_o>d && d_b>0 && rand(1)<p_c1 
                        if rand(1)<0.5
                        temp_vv=min([l,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(4,ii+temp_vv)=1;
                            v(4,ii+temp_vv)=temp_vv;
                            id(4,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        else
                            temp_vv=min([l,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        end
                    elseif d<l && d_o>d && d_b>0 && d_r<=d && rand(1)<p_c1
                        temp_vv=min([l,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    elseif d<l && d_r>d && d_r_b>0 && d_o<=d && rand(1)<p_c1
                        temp_vv=min([l,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(4,ii+temp_vv)=1;
                            v(4,ii+temp_vv)=temp_vv;
                            id(4,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    else
                        temp_vv=min([l,vmax,d]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    end
                 else %temp_id==2
                   if  d<l && d_r>d && d_r_b>0 && d_o>d && d_b>0 && rand(1)<p_c2 
                        if rand(1)<0.5
                        temp_vv=min([temp_v(3,ii)+1,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(4,ii+temp_vv)=1;
                            v(4,ii+temp_vv)=temp_vv;
                            id(4,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        else
                            temp_vv=min([temp_v(3,ii)+1,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        end
                    elseif d<l && d_o>d && d_b>1 && d_r<=d && rand(1)<p_c2
                        temp_vv=min([temp_v(3,ii)+1,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(2,ii+temp_vv)=1;
                            v(2,ii+temp_vv)=temp_vv;
                            id(2,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    elseif d<l && d_r>d && d_r_b>1 && d_o<=d && rand(1)<p_c2
                        temp_vv=min([temp_v(3,ii)+1,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(4,ii+temp_vv)=1;
                            v(4,ii+temp_vv)=temp_vv;
                            id(4,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    else
                        temp_vv=min([temp_v(3,ii)+1,vmax,d]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                   end
               end
                 
            end
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
                    
                    d_r=0; 
                    d_r_b=0; 
                    
                    if cars(3,ii+1:m)==0
                        d_r=vmax;
                    else
                        for jj=ii+1:m
                            if cars(3,jj)==0
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
                            if cars(3,jj)==0
                                d_r_b=d_r_b+1;
                            else
                                break
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
                                if cars(1,jj)==0
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
                    if  d<l && d_r>d && d_r_b>0 && d_o>d && d_b>0 && rand(1)<p_c1 
                        if rand(1)<0.5
                        temp_vv=min([l,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(3,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        else
                            temp_vv=min([l,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        end
                    elseif d<l && d_o>d && d_b>0 && d_r<=d && rand(1)<p_c1
                        temp_vv=min([l,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(1,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    elseif d<l && d_r>d && d_r_b>0 && d_o<=d && rand(1)<p_c1
                        temp_vv=min([l,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(2,ii);
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
                 else %temp_id==2
                   if  d<l && d_r>d && d_r_b>0 && d_o>d && d_b>0 && rand(1)<p_c2 
                        if rand(1)<0.5
                        temp_vv=min([temp_v(2,ii)+1,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        else
                            temp_vv=min([temp_v(2,ii)+1,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                        end
                    elseif d<l && d_o>d && d_b>1 && d_r<=d && rand(1)<p_c2
                        temp_vv=min([temp_v(2,ii)+1,vmax,d_o]);
                        if ii+temp_vv<=m
                            cars(1,ii+temp_vv)=1;
                            v(1,ii+temp_vv)=temp_vv;
                            id(1,ii+temp_vv)=temp_id(2,ii);
                        else
                            cars_out=cars_out+1;
                        end
                    elseif d<l && d_r>d && d_r_b>1 && d_o<=d && rand(1)<p_c2
                        temp_vv=min([temp_v(2,ii)+1,vmax,d_r]);
                        if ii+temp_vv<=m
                            cars(3,ii+temp_vv)=1;
                            v(3,ii+temp_vv)=temp_vv;
                            id(3,ii+temp_vv)=temp_id(2,ii);
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
                            if cars(2,jj)==0
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
                    if d<l && d_r>d && d_r_b>0 && rand(1)<p_c1
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
                   if d<l && d_r>d && d_r_b>1 && rand(1)<p_c2
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
        if rand(1)<q3
            if cars(3,1)==0
                cars(3, 1)=1;
                v(3,1)=randi(vmax,1);
                 if rand(1)>q       
                 id(3,1)=1;
                 else
                 id(3,1)=2;
                 end
                cars_in=cars_in+1;
            end
        end
       if rand(1)<q4
            if cars(4,1)==0
                cars(4, 1)=1;
                v(4,1)=randi(vmax,1);
                if rand(1)>q       
                id(4,1)=1;
                else
                id(4,1)=2; 
                end
                cars_in=cars_in+1;
            end
       end

        
        cars_on=sum(cars(:));
        sumv=sum(v(:));
        cars_on4=sum(cars(4,:));
        cars_on3=sum(cars(3,:));
        cars_on2=sum(cars(2,:));
        cars_on1=sum(cars(1,:));
        rho1=cars_on1/m;
        rho2=cars_on2/m;
        rho3=cars_on3/m;
        rho4=cars_on4/m;
        rho=(rho1+rho2+rho3+rho4)/4;
        J=rho*vmax;
        J1=sumv/(m*4);
        flag=flag-1;
   
end
y=cars_in;
plot(q,rho,'xk-')
hold on;
end
