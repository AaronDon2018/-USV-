%第三题，计算g1和g2最合适的位置（以面积最大为标准）

M=10000;
lamda=0.8;
max_num1=0; max_num_t=0; t_max=0;   max_num=zeros(1,300); F=zeros(2,300);
fx=10000;
fy=7000;

for t=0:1:300
    max_num1=0;
    
    Cit=90/(t/10);
    if Cit<5 
        Cit=5;
    end
    if Cit>15
        Cit=15;
    end
    
    for i=0:floor(90/Cit)
        Cit2=Cit*i;
        
        fx1=fx-16*cos(Cit2);  
        fy1=fy+16*sin(Cit2);

        O1x=(fx1-(25*t)*lamda*lamda)/(1-lamda*lamda);
        O1y=(fy1-lamda*lamda*M/2)/(1-lamda*lamda);

        radius1=lamda*norm([fx1,fy1]-[25*t,M/2])/(1-lamda*lamda);

        num1=0;

        for i=1:100:10000
            for j=1:100:10000
                if norm([i,j]-[O1x,O1y])<=radius1
                    num1=num1+1;
                end                    
            end
        end
        
        if max_num1<=num1
            max_num1=num1;
            Cit3=Cit2;
        end
        
    end
    
    if max_num_t<max_num1
        max_num_t=max_num1;
        t_max=t;
        fx_max=fx;
        fy_max=fy;
    end
    
    if t>0
        max_num(t)=max_num1;
        F(1,t)=fx;
        F(2,t)=fy;
    end
    
    fx=fx-16*cos(Cit3); 
    fy=fy+16*sin(Cit3);
    
    hold on;
    plot(fx,fy,'*r');
    

    
    %if t>=200 
    %    plot(25*t,5000,'og');
    %    pause(0.1);
    %end

end