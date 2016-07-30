function h = circle2(x,y,r,color,lwidth)
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'Color',color,'LineWidth',lwidth);