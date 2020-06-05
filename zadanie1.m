f1 = @(x)   2 + 1 ./ (1 + x.^2);
f2 = @(x)   2 + sin(x);
a = 0.0;    % najmniejsza wartoœæ x na wykresie
b = 4.0;    % najwiêksza wartoœæ x na wykresie
c = 5.0;
N = 1000;   % liczba punktów)
x = linspace(a, b, N);
figure(1);
clf;
plot(x, f1(x));
grid on;
grid minor;
hold on;plot(x, f2(x));
f21 = @(x) f2(x) - f1(x);
for i = 1:(N-1)
    try
        xL = fzero(f21, [x(i), x(i+1)]);
        break
    catch
    end
end
for i = N:-1:2
    try
        xR = fzero(f21, [x(i-1), x(i)]);
        break
    catch
    end
end
xLR = linspace(xL, xR, N);  % x do lewej do prawej w przedziale (xL, xR)
xRL = flip(xLR);            % x od prawej do lewej w przedziale (xL, xR)

yLR = f2(xLR);  % od lewej do prawej (rosn¹ce x) idziemy po krzywej f2
yRL = f1(xRL);  % od prawej do lewej (malej¹ce x) idziemy po krzywej f1
xi = [xLR, xRL];
yi = [yLR, yRL];
fill(xi, yi, 'y');
ylim([1.2 5]);
format long;
quadgk(f21, xL, xR)


