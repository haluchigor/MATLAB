figure(1);
clf;
axis;
d = ginput (5);
x = d(:,1)';
y = d(:,2);
t = 1:length(x);
ti = 1:0.001:length(x);
ti=ti';
xi = interp1(t,x,ti,'spline');
yi = interp1(t,y,ti,'spline');
plot (x,y,'or');
plot([xi;xi(1)],[yi;yi(1)],'r-');
