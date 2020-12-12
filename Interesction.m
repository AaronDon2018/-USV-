%根据给出的e和p点坐标计算交点、阿波圆半径、阿波圆心、d1、d2信息

function [moreY1,lessY1,moreY2,lessY2,O,radius,lamda,dis]=Interesction(ex,ey,p) 

syms x y;
    e=[ex,ey];
    dis=sqrt((p(:,1)-e(1)).^2+(p(:,2)-e(2)).^2);  %计算所有p点和e点的距离
    %vp=20;ve=25;
    lamda=0.4;    %计算lamda
    radius=lamda*dis/(1-lamda*lamda)+200;  %计算所有阿波罗尼奥斯圆的半径
    O=[(p(:,1)-lamda*lamda*e(1))/(1-lamda*lamda),(p(:,2)-lamda*lamda*e(2))/(1-lamda*lamda)];    %计算所有阿波罗尼奥斯圆的圆心
    s=solve((x-O(1,1))^2/radius(1)^2+(y-O(1,2))^2/radius(1)^2==1,x==10000,x,y);
    moreY1=max(double(s.y));
    lessY1=min(double(s.y));
    s=solve((x-O(2,1))^2/radius(2)^2+(y-O(2,2))^2/radius(2)^2==1,x==10000,x,y);
    moreY2=max(double(s.y));
    lessY2=min(double(s.y));

        
end