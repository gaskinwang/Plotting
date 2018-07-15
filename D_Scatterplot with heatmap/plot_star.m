function plot_star(x,y,P)
marker='*r';
color=[1 0 0];
if P<0.005
    plot(linspace(x-10,x+10,4),repmat(y,4,1),marker,'MarkerFaceColor',color);
elseif P<0.01
    plot(linspace(x-20,x+20,3),repmat(y,3,1),marker,'MarkerFaceColor',color);
elseif P<0.05
    plot(linspace(x-10,x+10,2),repmat(y,2,1),marker,'MarkerFaceColor',color);
% else 
%     plot(x,y,marker,'MarkerFaceColor',color);
% else
%    disp('Maybe there is something wrong'); 
end
end