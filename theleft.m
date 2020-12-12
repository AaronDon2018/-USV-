%|| lessY1>=0 || moreY2<=M

M=7000;

rectangle('position',[0 0 10000 M] );
axis([0 10000 0 M]);
hold on;


nCircles=2;
p=[10000,5000];
ex=8500;ey=3500;
p=[p;10000,2000];
vp=20;ve=25;
cmap = hsv(nCircles); %// define colors. You could change `hsv` to `jet`, `cool`, ...
syms x y;
%定义坐标、速度、颜色

plot(10000,2000,'P');
plot(10000,5000,'P');

lamda=vp/ve;    %计算lamda
biaoji=0;
for ex=8000:50:8500
    e=[ex,ey];
    dis=sqrt((p(:,1)-e(1)).^2+(p(:,2)-e(2)).^2);  %计算所有p点和e点的距离
    radius=lamda*dis/(1-lamda*lamda)+200;  %计算所有阿波罗尼奥斯圆的半径
    O=[(p(:,1)-lamda*lamda*e(1))/(1-lamda*lamda),(p(:,2)-lamda*lamda*e(2))/(1-lamda*lamda)];    %计算所有阿波罗尼奥斯圆的圆心
    s=solve((x-O(1,1))^2/radius(1)^2+(y-O(1,2))^2/radius(1)^2==1,x==10000,x,y);
    moreY1=max(double(s.y));
    lessY1=min(double(s.y));
    s=solve((x-O(2,1))^2/radius(2)^2+(y-O(2,2))^2/radius(2)^2==1,x==10000,x,y);
    moreY2=max(double(s.y));
    lessY2=min(double(s.y));
    if abs(moreY2-lessY1 )<100 && lessY1>=moreY2
        plot(ex,ey,'*');
        biaoji=1;
        break;        
    end

end





if biaoji==1
    for i = 1 : nCircles
        rectangle('Curvature', [1 1], ...
            'Position', [O(i,1)-radius(i),O(i,2)-radius(i),2*radius(i),2*radius(i)], ...
            'facecolor', 'none', 'edgecolor', cmap(i,:)) %// plot filled circle

    end
end


%rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1])


