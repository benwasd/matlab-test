clear;

% Task 2:
% 0.08+0.42-0.5, expected = 0, actual = 0
r1 = 0.08+0.42-0.5;
% 0.42-0.5+0.08, expected = 0, actual = -1.3878 * 10^-17
r2 = 0.42-0.5+0.08;
% MATLAB Arbeitet Standartmässig mit floating point Datentypen => double
% keine der Varianten ist merklich besser.
r2 = round(r2, 2);


% Task 3:
a = 0:14; % Zahlen von 0 bis und mit 14
b = [1:7 8 7:-1:1]; % Zahlen von 1 bis 7 dann 8 dann von 7 zurück auf 1
a + b;   % Eine neue Sequenz bestehend aus den Summen der jeweiligen Elementen:
         % 1  3  5  7  9  11  13  15  15  15  15  15  15  15  15
a .* b;  % Eine neue Sequenz bestehend aus der Multipikation der jeweiligen Elementen:
         % 0  2  6  12  20  30  42  56  56  54  50  44  36  26  14
[a, b];  % Eine neue verkettete Sequenz, Also Zahlen von 0 bis 14 dann 1 bis 8 und zurück auf 1 => 30 Elemente
mean(b); % Durchschnitt über alle Elemente in b, actual = 4.2667
plot(a,b);  % Anhand der Doku wird a als X achse verwendet 1:14 und b als Y,
            % so wird man die Werte in b sehr gut sehen.
plot(a,b,'+'); % Anhand der Doku wird die LineSpec mit einem Plus definiert. 
               % Da Plus in der Marker Tabelle aufgelistet ist wird wohl
               % ein Plus geplottet zu jedem (x/y)
plot(b,a,'*'); % Gleich wie oben, nur das b jetz die X-Achse definiert => von 1:8
               % * wird als Marker verwendet.
min([a,b]);    % Die kleinste Zahl innerhalb a und b => 0, actual = 0
plot(a,b.^2);  % A als X-Achse und für Y die Quadrierten B-Werte. Also gibt es etwa ein Punkt (7/64)
a(a>8);        % a(4) gibt das 4te Element, also könnte a>8 ein Subsequenz geben welche nur Elemente grösser als 8 enthält
b(b<6);        % Gleich wie oben alle Elemente kleiner als 6, also entsteht eine Sequentz wie b ohne die 7 und 8
size(a.');     % Nach Docs transposed ' die Matrix (https://en.wikipedia.org/wiki/Transpose)
               % Die Size gibt die Dimensionen der neuen Matrix zurück: 15-hoch, 1 breit

               
% Task 4:
v1 = [3:3:10];  % Beginnend mit 3 erhöht um jeweils 3 bis >= 10
v2 = [12:-2:5]; % Beginnend mit 12 verkleinern um jeweils 2 bis <= 5
v = [v1,v2];    % Verbindet diese Matrizen in matrix v
w = v(v<=9);    % Erstellt eine neue Matrix mit allen Werten kleiner als 9 in w

% Task 5:
x = rand(1,50);
hist(x, 8);

% Task 6:
syms x;
f(x) = exp(x/5) * sin(2*x);
g(x) = sin(x^2);

fplot(f, [0 8], 'Linewidth', 2);
hold on
fplot(g, [0 8], 'Linewidth', 1);
hold off

