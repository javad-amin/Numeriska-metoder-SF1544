clear all;close all;clc;

% A
d = 75;
vm = 25;
x = linspace(-500,500,5000);
y = f(x,vm,d);
figure;
plot(x,y)
xlabel('x');ylabel('y')
ylim([-20 50])

% B
h = 5; %increment
t = 40;    % sec
N = round(t / h); % step numbers
m = 10;    % number of cars
%% Brake
x = zeros(10,N);
for i = 1:m
    x(i,1) = d * i;
end
g = 5;
x1 = Euler(x,h,g,vm,d);

for n=1:N
plot(x1(:,n),zeros(1,m),'r*');
sum(diff(x1(:,n)) < 0)
axis([0 1000 -1 1])
drawnow
pause(h)
end
%% acc
x = zeros(10,N);
for i = 1:m
    x(i,1) = 10 * i;
end
g = vm;
x2 = Euler(x,h,g,vm,d);

for n=1:N
plot(x2(:,n),zeros(1,m),'r*');
axis([0 1000 -1 1])
drawnow
pause(h)
end
%% Brake reverse
x = zeros(10,N);
for i = 1:m
    x(i,1) = d * i;
end
g = 5;
x1 = Backward_Euler2(x,h,g,vm,d);
% Brake fixed point
x2 = Backward_Euler(x,h,g,vm,d,40);

for n=1:N
semilogx(x1(:,n),zeros(1,m),'r*');
hold on;
semilogx(x2(:,n),ones(1,m),'b*');
hold off;
axis([0 1000 -1 2])
drawnow
pause(h/10)
end
%% acc
x = zeros(10,N);
for i = 1:m
    x(i,1) = 10 * i;
end
g = vm;
x2 = Backward_Euler2(x,h,g,vm,d);

for n=1:N
plot(x2(:,n),zeros(1,m),'r*');
axis([0 1000 -1 1])
drawnow
pause(h/10)
end
