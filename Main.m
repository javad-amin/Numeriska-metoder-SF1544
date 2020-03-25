clear all;close all;clc;
addpath('.');
addpath('functions');

% A
d = 75;
vm = 25;
x = linspace(-500,500,5000);
y = f(x,vm,d);
figure('Name','Uppgift A');
plot(x,y)
xlabel('x'); ylabel('y');
ylim([-20 50]);
pause; close all;

% B och C parametrar
h = 0.1; %increment
t = 40;   % sec
N = round(t / h); % step numbers
m = 10;    % number of cars
%% B Inbromsning
x = zeros(m,N);
for i = 1:m
    x(i,1) = d * i;
end
g = 5;
x1 = Euler(x,h,g,vm,d);

figure('Name','Uppgift B, Inbromsning');
for i = 1:m
    x = linspace(0,40,size(x1,2));
    y = x1(i,:);
    plot(x, y, 'DisplayName', strcat(num2str(i)))
    xlabel('x'); ylabel('y');
    hold on;
end
legend show
pause; close all;

%% B Acceleration
x = zeros(m,N);
for i = 1:m
    x(i,1) = 10 * i;
end
g = vm;
x2 = Euler(x,h,g,vm,d);

figure('Name','Uppgift B, Acceleration');
for i = 1:m
    x = linspace(0,40,size(x2,2));
    y = x2(i,:);
    plot(x, y, 'DisplayName', strcat(num2str(i)))
    xlabel('x'); ylabel('y');
    hold on;
end
legend show
pause; close all;


%H
%% Inbromsning
x = zeros(10,N);
for i = 1:m
    x(i,1) = d * i;
end
g = 5;
x3 = Backward_Euler(x,h,g,vm,d);

figure('Name','Uppgift H, Inbromsning');
for i = 1:m
    x = linspace(0,40,size(x1,2));
    y = x3(i,:);
    plot(x, y, 'DisplayName', strcat(num2str(i)))
    xlabel('x'); ylabel('y');
    hold on;
end
legend show
pause; close all;

%% Acceleration
x = zeros(10,N);
for i = 1:m
    x(i,1) = 10 * i;
end
g = vm;
x4 = Backward_Euler(x,h,g,vm,d);

figure('Name','Uppgift H, Acceleration');
for i = 1:m
    x = linspace(0,40,size(x2,2));
    y = x4(i,:);
    plot(x, y, 'DisplayName', strcat(num2str(i)))
    xlabel('x'); ylabel('y');
    hold on;
end
legend show
pause; close all;


% C Inbromsning
figure('Name','Uppgift C, Inbromsning');
for n=1:N
    plot(x1(:,n),zeros(1,m),'r*');
    axis([0 1000 -1 1]);
    drawnow
    pause(h)
end
pause; close all;

% C Acceleration
figure('Name','Uppgift C, Acceleration');
for n=1:N
    plot(x2(:,n),zeros(1,m),'r*');
    axis([0 1000 -1 1]);
    drawnow
    pause(h)
end
