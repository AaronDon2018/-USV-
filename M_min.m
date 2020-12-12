%绘制单个点的阿波圆及边界交点的切线
%|| lessY1>=0 || moreY2<=M

nCircles=2;
vp=20;ve=25;
cmap = hsv(nCircles); %// define colors. You could change `hsv` to `jet`, `cool`, ...
%定义坐标、速度、颜色
%rectangle('position',[0 0 10000 M] );
figure;
title('二分法计算M-min');
hold on;


M=9168;
%for M=9100:10:9200

    %if i>=2 && mod(i,2)==0
    %    M=2*moreY1-M;
    %end
    %if i>=2 && mod(i,2)==1
    %    M=M+abs(lessY1-moreY2);
    %end
    
    
    %[yp1,yp2]=calculatePy(M);
    yp1=170;
    yp2=170;
    
    p=[10000,yp1;10000,yp2];
    ex=0;ey=M/2;

    [moreY1,lessY1,moreY2,lessY2,O,radius,lamda,dis]=Interesction(ex,ey,p);
    %调用函数计算交点等信息
    
    
    plot(10000,yp1,'Pr');
    plot(10000,yp2,'Pb');
    axis([0 10000 0 M]);

    for j= 1 : nCircles
        rectangle('Curvature', [1 1], ...
            'Position', [O(j,1)-radius(j),O(j,2)-radius(j),2*radius(j),2*radius(j)], ...
           'facecolor', 'none', 'edgecolor', cmap(j,:)) %// plot filled circle
    end

    
    k2=-(O(2,1)-10000)/(O(2,2)-moreY2);
    x=1:10000;
    plot(x,(k2*(x-10000)+moreY2));
    plot(ex,ey,'*');
    M/2-(k2*(0-10000)+moreY2)
    %rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1])
    %if abs(moreY2-M)<M*0.001
    %    break;
    %end
    
%end

