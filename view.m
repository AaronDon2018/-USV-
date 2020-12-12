%绘制单个点的阿波圆及边界交点的切线
%|| lessY1>=0 || moreY2<=M

M=7000;

rectangle('position',[0 0 10000 M] );
axis([0 10000 0 7000]);
hold on;

N=7;
a=2*pi/N;
r=50/sin(a/2);

nCircles=2;
p=[10000,5000];
ex=8750;ey=3300;
p=[p;10000,2000];
p(:,2)=p(:,2)-r;

vp=20;ve=25;
cmap = hsv(nCircles); %// define colors. You could change `hsv` to `jet`, `cool`, ...
%定义坐标、速度、颜色

[moreY1,lessY1,moreY2,lessY2,O,radius,lamda,dis]=Interesction(ex,ey,p);
%调用函数计算交点等信息

plot(p(1,1),p(1,2),'Pr');
plot(p(2,1),p(2,2),'Pb');

point2=[];
num1=0;
for i=1:100:10000
    for j=1:100:10000
        if norm([i,j]-[O(1,1),O(1,2)])<=radius(1) || norm([i,j]-[O(2,1),O(2,2)])<=radius(2) ...
                || norm([i,j]-[O(3,1),O(3,2)])<=radius(3) || norm([i,j]-[O(4,1),O(4,2)])<=radius(4)
            num1=num1+1;
        end                 
    end
end


if lessY2>=moreY1 
    plot(ex,ey,'*');
end

    for i = 1 : nCircles
        rectangle('Curvature', [1 1], ...
            'Position', [O(i,1)-radius(i),O(i,2)-radius(i),2*radius(i),2*radius(i)], ...
           'facecolor', 'none', 'edgecolor', cmap(i,:)) %// plot filled circle
    end


%k=-(O(1,1)-10000)/(O(1,2)-lessY1);
%k2=-(O(2,1)-10000)/(O(2,2)-moreY2);
%x=1:10000;
%plot(x,(k*(x-10000)+lessY1));
%plot(x,(k2*(x-10000)+moreY2));
%plot(ex,ey,'*');

%syms x y;
%ezplot((x-a)(x0-a)+(y-b)(y0-b)-r^2);

%rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1])


