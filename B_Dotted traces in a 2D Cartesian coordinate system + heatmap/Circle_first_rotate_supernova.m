%% read data

clear;close all;
DataSet=xlsread('data in one.xlsx',1);
PlugSet=xlsread('data in one.xlsx',2);
DataAmount=size(PlugSet,2);
%% Basic coordinate system
%%
Ratio1=0.55;%Proportion of the internal coordinate system
Ratio2=3/4;%The ratio of ring-shaped heatmap to circle
Ratio3=0.1;%Proportion of colorbar
offset=2*pi*Ratio1*0.5*Ratio2/DataAmount*0.75;%Side length of each square in the heatmap

figure
set(gcf,'Position',[100 100 500 500]);        
                                              
%% 
% Inner coordinate axis

h_axes1=axes('Position',[0.5*(1-sqrt(2)/2*Ratio1) 0.5*(1-sqrt(2)/2*Ratio1)...
    sqrt(2)*Ratio1/2 sqrt(2)*Ratio1/2],'nextplot','add');
%% 
% Outside coordinate axis

h_axes2=axes('Position',[Ratio3 Ratio3 1-2*Ratio3 1-2*Ratio3],'nextplot','add');
%%
% two colorbars, 0-1, 1-10
ExpendLineColorMap0 = hsv();
ExpendLineColorMap1=autumn();
ExpendLineColorMap2=summer();
ExpendLineColorMap2(:, 3) = 0;
ExpendLineColorMap2 = flipud(ExpendLineColorMap2);      % yellow
initial_angle=pi/2*4;
theta=initial_angle+linspace(0,-Ratio2*2*pi,DataAmount);
InsidePointX=0.5*Ratio1*cos(theta);
InsidePointY=0.5*Ratio1*sin(theta);
for ind=1:DataAmount
    % trace
    x=DataSet(:,ind*2-1);
    y=DataSet(:,ind*2);
    x(isnan(y))=[];y(isnan(y))=[];
    
    plot(h_axes1,x(end),y(end),'.','color',...
        ind2rgb(floor(ind/(DataAmount)*size(ExpendLineColorMap0,1)),...
        ExpendLineColorMap0), 'markersize',8);
    % terminal dots
    plot(h_axes1,x,y,'color',[.6 .6 .6]);
    % heatmap
    h3=cell(size(PlugSet,1),1);
    for ind_of_plug=1:size(PlugSet,1)        
        centralx=Ratio1*0.5+offset/2+offset*(ind_of_plug-1);
        [xx,yy]=Block([0,centralx],offset/2);
        
        %  1-10 select 2; 0-1 select 1
        if PlugSet(ind_of_plug,ind)>=1
            c=ind2rgb(floor((PlugSet(ind_of_plug,ind)-1)/9*64),...
                        ExpendLineColorMap2);       
        else
            c=ind2rgb(floor(PlugSet(ind_of_plug,ind)/1*64),...
                        ExpendLineColorMap1);
        end
        
        
        h3{ind_of_plug}=fill(h_axes2,xx,yy,c);
    end
    rotate([h3{:}],[0 0 1],rad2deg(initial_angle)-90-(ind-1)*(Ratio2*360/(DataAmount-1)),[0 0 0]);
end
% axis(h_axes1,'equal','manual');

axis(h_axes2,[Ratio3-0.5 0.5-Ratio3 Ratio3-0.5 0.5-Ratio3],'manual');
set(h_axes2,'Position',[Ratio3 Ratio3 1-2*Ratio3 1-2*Ratio3],...
    'visible','off');
set(h_axes1,'Position',[0.5*(1-sqrt(2)/2*Ratio1) 0.5*(1-sqrt(2)/2*Ratio1)...
    sqrt(2)*Ratio1/2 sqrt(2)*Ratio1/2]);

for ind=1:DataAmount
    x=DataSet(:,ind*2-1);
    y=DataSet(:,ind*2);
    x(isnan(y))=[];y(isnan(y))=[];
    %bridging line
    [XLimNew,YLimNew]=shrink(h_axes2.XLim,h_axes2.YLim,...
        (sqrt(2)*Ratio1/2)/(1-2*Ratio3));
    newPos=LinkAxes([x(end) y(end)],h_axes1.XLim,h_axes1.YLim,...
                                    XLimNew,YLimNew);
    plot(h_axes2,[newPos(1) InsidePointX(ind)],[newPos(2) InsidePointY(ind)],':','color',...
        ind2rgb(floor(ind/(DataAmount)*size(ExpendLineColorMap1,1)),ExpendLineColorMap1));
end

% 1-10 colorbar
ticks=1:10;
ticksCell1=cell(1,10);
for mark=1:10
    ticksCell1{mark}=num2str(ticks(mark));
end

% 0-1 colorbar
ticks2=0:0.1:0.9;
ticksCell2=cell(1,10);
for mark=1:10
    ticksCell2{mark}=num2str(ticks2(mark));
end

colormap([ExpendLineColorMap1;ExpendLineColorMap2])

% custom colorbar
h_colorbar=colorbar();
caxis([0 10])
set(h_colorbar,'Position',[1-Ratio3+Ratio3*0.05 Ratio3 Ratio3-Ratio3*0.6,1-2*Ratio3],...
    'ticks',[0:0.5:4.5, linspace(5, 10, 10)],...
    'ticklabels',[ticksCell2, ticksCell1]);