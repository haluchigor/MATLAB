% Przedmiot: Techniki Obliczeniowe 
% Kierunek studiów: Mechatronika 
% Semestr: 2
% Rok akademicki: 2019/2020
% Data (dzieñ-miesi¹c-rok): <<14-06-2020>>
%
% Imiê:             <<Igor>>
% Nazwisko:         <<Haluch>>
% Numer albumu ZUT: <<46746>>
[y, fs] = audioread('C:\Users\igi10\Downloads\bang_1.wav');
y = y(:,1);
sound(y, fs);
N = length(y);
Delta = 1 ./ fs; 
x = (0:(N-1))' .* Delta;
subplot(2, 1, 1); 
plot(x,y); 
title('dane'); 
xlabel('t [sekundy]')
f = (-N/2:N/2)' ./ (N .* Delta);
F = fft(y) .* Delta;
p  = 2.0*abs(F).^2;
p  = p(f >= 0);
pf = f(f >= 0);
subplot(2, 1, 2); 
semilogx(pf, p, '-r'); 
title('PSD'); 
xlabel('f [Hz]'); 
xlim([10, 10000]);