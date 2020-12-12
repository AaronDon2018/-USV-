function [yp1,yp2]=calculatePy(M)

    vp=20;ve=25;
    lamda=vp/ve;
    syms yp

    %M=3500;
    xp=10000;xe=0;ye=M/2;

    O1=(xp-lamda*lamda*xe)/(1-lamda*lamda);
    O2=(yp-lamda*lamda*ye)/(1-lamda*lamda);

    r=lamda*norm([xp,yp]-[xe,ye])/(1-lamda*lamda);

    %(M-O2)*(M-O2) == r*r-(10000-O1)*(10000-O1)
    yp=solve((M-O2)*(M-O2) == r*r-(10000-O1)*(10000-O1));
    %yp=solve(((25*yp)/9 - 1190000/9)^2 == (400*abs(yp - 35000)^2)/81 + 241591910399999527/1358954496);
    yp1=min(double(yp));
    % 其上交点在y=M/2的位置，通过这种方法能够求出
    yp=solve((0-O2)*(0-O2) == r*r-(10000-O1)*(10000-O1));
    yp2=max(double(yp));

end

