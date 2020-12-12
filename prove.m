%对存在不同区域的证明，用红色标注可直线逃脱，绿色标注不可直线逃脱但有缺口
%

M=7000;

rectangle('position',[0 0 10000 M] );
axis([0 10000 0 M]);
hold on;


nCircles=2;
p=[10000,5000];
ex=8500;ey=3500;
p=[p;10000,2000];
cmap = hsv(nCircles); %// define colors. You could change `hsv` to `jet`, `cool`, ...
%定义坐标、速度、颜色

plot(10000,2000,'P');
plot(10000,5000,'P');

num=0;
num2=0;
H=[];
X=10000;
for ex=5500:100:10000
    for ey=3500:100:7000
        
        if norm([ex,ey]-[10200,5000])<1000 || norm([ex,ey]-[10200,2000])<1000
            continue;
        end
        
        [moreY1,lessY1,moreY2,lessY2,O,radius,lamda,dis]=Interesction(ex,ey,p);

        k12=-(O(1,1)-X)/(O(1,2)-lessY1);
        k11=-(O(1,1)-X)/(O(1,2)-moreY1);
        
        k21=-(O(2,1)-X)/(O(2,2)-moreY2);
        k22=-(O(2,1)-X)/(O(2,2)-lessY2);
        
        if moreY2<=lessY1 || moreY1<=M || lessY2>=0
            num=num+1;
            if (ey<(k12*(ex-X)+lessY1) && ey>(k21*(ex-X)+moreY2)) || (ey>(k11*(ex-X)+moreY1))  || (ey<(k22*(ex-X)+lessY2))
                H=[H;plot(ex,ey,'*r')];
                H=[H;plot(ex,7000-ey,'*r')];
                num2=num2+1;
            else
                H=[H;plot(ex,ey,'*g')];
                H=[H;plot(ex,7000-ey,'*g')];
            end
        end        
        
    end
end

%   20个有缺口的点只有16个满足ey<(k*(ex-X)+lessY1) && ey>(k2*(ex-X)+moreY2)
%   四个特殊点分别是：(9450,5000)/()/()/()
