%第三题，计算g1和g2最合适的位置（以面积最大为标准）

M=10000;
lamda=0.8;
max_num1=0; max_num2=0;

for g2=0:200:5000
    
    g1=10000-g2;

    O1x=(9800-0)/(1-lamda*lamda);
    O1y=(g1-lamda*lamda*M/2)/(1-lamda*lamda);
    O2x=(9800-0)/(1-lamda*lamda);
    O2y=(g2-lamda*lamda*M/2)/(1-lamda*lamda);
    radius1=lamda*norm([9800,g1]-[0,M/2])/(1-lamda*lamda);
    radius2=lamda*norm([9800,g2]-[0,M/2])/(1-lamda*lamda);

    num1=0; num2=0;
    
    for i=1:100:10000
        for j=1:100:10000
            if norm([i,j]-[O1x,O1y])<=radius1 || norm([i,j]-[O2x,O2y])<=radius2
                num1=num1+1;
            end        
            
            if norm([i,j]-[O1x,O1y])<=radius1 || norm([i,j]-[O2x,O2y])<=radius2
                num2=num2+1;
            end      
            
        end
    end
    
    if max_num1<=num1
        max_num1=num1;
        g(1)=g1;
    end
     if max_num2<=num2
        max_num2=num2;
        g(2)=g2;
     end

end