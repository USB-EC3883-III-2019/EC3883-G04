clear all
cla
clc
step = 3.75;
top = 31;
top_grade = step*top;

theta = -1*(-pi/2+pi/180*[-top_grade:step:top_grade]);


r = 80*ones(1,length(theta));
%r = zeros(1,length(theta));
r(1)=80;
r(32)=80;
r(63)=80;
[x y] = pol2cart(theta,r);

stem(x,y,'.','r','LineStyle','none')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xticks([-90:10:90])
%xticklabels(-90:10:90)
yticks([-50:10:90])
%set(gca,'XMinorTick','on','YMinorTick','on')
xlim([-90 90])
ylim([-50 90])
grid on
hold on 



