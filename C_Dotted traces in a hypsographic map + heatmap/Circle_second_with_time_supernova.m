clear;close all;
%可以尝试吧三角形改为虚线..............................
DataSet=xlsread('data in one5.xlsx',1);
PlugSet=xlsread('data in one5.xlsx',2);
DataAmount=size(PlugSet,2);

%% 基础坐标系部分
theta=(0:0.001:2*pi);
r_range=4.2-(3.8:0.05:4.2)';
circle_x=bsxfun(@times,r_range,cos(theta));
circle_y=bsxfun(@times,r_range,sin(theta));
figure
cmap_bo=bone();
cmap_bo=cmap_bo(1:floor(size(cmap_bo,1)*0.75),:);
cmap_bo=flipud(cmap_bo);
hold on
for mark=1:size(r_range,1)
    plot(circle_x(mark,:),circle_y(mark,:));
end
axis equal

%% 数据部分
% 先做一下颜色
% 改动: 做两个colorbar, 一个0-1, 一个1-10
ExpendLineColorMap1=autumn();
ExpendLineColorMap2=summer();
ExpendLineColorMap2(:, 3) = 0;
ExpendLineColorMap2 = flipud(ExpendLineColorMap2);      % 黄色接上
TimeMax=-inf;% 最大的时间值
for tmp=1
    Data=DataSet;
    Plug=PlugSet;
    LineAmount=size(Data,2)/2;
    for tmp2=1:LineAmount
        %线数据
        r=abs(4.2-Data(:,2*tmp2));
        theta=-Data(:,2*tmp2-1)*pi/2;
        TimeMax=max(TimeMax,max(Data(:,2*tmp2-1)));
        theta(isnan(r))=[];
        r(isnan(r))=[];        
        x=r.*cos(theta);
        y=r.*sin(theta);
        h1=plot(x,y);
        set(h1,'color',[0.5 0.5 0.9])
        if tmp2==1;set(h1,'color',[0 0.9 0.9]);end
%         set(h1,'color',ind2rgb(floor(tmp2/(LineAmount)*64),hsv()))
        rotate(h1,[0 0 1],-90*(tmp-1)-(tmp2-1)*360/(size(Data,2)/2),[0 0 0])
%         h4=patch([x(end) +0.1/6 -0.1/6],[y(end) -0.4 -0.4],'--k');
%         set(h4,'EdgeColor','none','facealpha',0.65,...
%                'facecolor',ind2rgb(floor(tmp2/(LineAmount)*size(cmap_bo,1)),cmap_bo))

        % 绘制圆点
        h4=plot(x(end),y(end),'.','markersize',10,'color',...
            ind2rgb(floor(tmp2/(LineAmount)*size(cmap_bo,1)),hsv()));
        rotate(h4,[0 0 1],-90*(tmp-1)-(tmp2-1)*360/(size(Data,2)/2),[0 0 0])
        % 绘制虚线
        h4=plot([x(end) 0],[y(end) -0.4],':','color',[0.6 0.6 0.6]);
        rotate(h4,[0 0 1],-90*(tmp-1)-(tmp2-1)*360/(size(Data,2)/2),[0 0 0])
        % 绘制结束时间
        h4=text(x(end),y(end),sprintf('%.1f',Data(length(x),2*tmp2-1)),'fontsize',2);
        rotate(h4,[0 0 1],-90*(tmp-1)-(tmp2-1)*360/(size(Data,2)/2),[0 0 0])
        % 外挂
        h3=cell(size(Plug,1),1);
        for tmp3=1:size(Plug,1)
            offset=0.1/6;
            centralx=0.4+offset+offset*2*(tmp3-1);
            [xx,yy]=Block([centralx,0],offset);
            
            % 改动在此: 1-10的选2，0-1选1
            if Plug(tmp3,tmp2)>=1
                c=ind2rgb(floor((Plug(tmp3,tmp2)-1)/9*64),ExpendLineColorMap2);       % 比例要仔细确认
            else
                c=ind2rgb(floor(Plug(tmp3,tmp2)/1*64),ExpendLineColorMap1);
            end
            % 改动结束
            
            h3{tmp3}=patch(xx,yy,c);
        end
        rotate([h3{:}],[0 0 1],-90*(tmp-1)-(tmp2-1)*360/(size(Data,2)/2)-90,[0 0 0])    % 这个 -90，这样对应的吗
    end
end
hh=gca;
set(gca,'visible','off')

%% colorbar
% ticks=linspace(0,TimeMax,11);
% ticksCell=cell(1,11);
% for mark=1:11
%     ticksCell{mark}=sprintf('%.1f',ticks(mark));
% end
h_axes1=gca;
h_axes2=axes('visible','off');
% colormap(h_axes1,hsv());%颜色对应关系
% colormap(h_axes2,cmap_bo);%颜色对应关系
% caxis(h_axes1,[0 10]);
% caxis(h_axes2,[0 10])%颜色刻度


% h_colorbar=colorbar(h_axes2);
% set(h_colorbar,'Position',[0.05 0.1 0.05 0.825],...
%                'ticks',0:10,...
%                'ticklabels',ticksCell)

% 生成大于1的colorbar
ticks=1:10;
ticksCell1=cell(1,10);
for mark=1:10
    ticksCell1{mark}=num2str(ticks(mark));
end

% 生成小于1的colorbar
ticks2=0:0.1:0.9;
ticksCell2=cell(1,10);
for mark=1:10
    ticksCell2{mark}=num2str(ticks2(mark));
end

colormap([ExpendLineColorMap1;ExpendLineColorMap2])

% 定制的colorbar
h_colorbar=colorbar();
caxis([0 10])
set(h_colorbar,'Position',[0.9 0.1 0.05 0.825],...
    'ticks',[0:0.5:4.5, linspace(5, 10, 10)],...
    'ticklabels',[ticksCell2, ticksCell1]);
% h_colorbar2=colorbar(h_axes1);
% set(h_colorbar2,'Position',[0.9 0.1 0.05 0.825]);