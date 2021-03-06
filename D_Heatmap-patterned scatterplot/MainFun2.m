%read data
clear;clf;close all
M=1;
N=2;
YData=cell(M,1);
XData=cell(M,1);
CData=cell(M,1);
for m=1:M
    XData{m}=cell(N,1);
    YData{m}=cell(N,1);
    CData{m}=cell(N,1);
    YData_read=xlsread('data.xls',m);
    for n=1:N
        YData{m}{n}=YData_read(:,n)';
        YData{m}{n}(isnan(YData{m}{n}))=[];
        XData{m}{n}=mapminmax(randn(size(YData{m}{n})),0,1)*80+100*(n-1)+10;
        CData{m}{n}=zeros(size(YData{m}{n}));
    end
end
%calculate the color of points 
radius=0.1;

for m=1:M
    for n=1:N
        num=size(YData{m}{n},2);
        for ind1=1:num
            for ind2=1:num
                CData{m}{n}(ind1)=CData{m}{n}(ind1)+...
                    (abs(YData{m}{n}(ind1)-YData{m}{n}(ind2))<radius);
            end
        end
    end
end

%plot
clf
hold on
for x=100:100:100*N
    plot([x x],[0 1],'k')%Basic frame
end
cmap=cool();
P_save=zeros(M,N);%the variable for debugging 
for m=1:M
    aim=YData{m}{1};
    for n=1:N
        x=XData{m}{n};
        y=YData{m}{n};
        c=cmap(ceil(CData{m}{n}/max(CData{m}{n})*size(cmap,1)),:);
        scatter(x,y,20,c,'filled')        
        plot_mean_sem(mean(x),mean(y),std(y));
        [~,P]=ttest2(aim',y');
        P_save(m,n)=P;
        if n~=1;plot_star(mean(x),mean(y)+0.5,P);end
    end
end
colormap cool
colorbar()
disp(P_save)
% 
%

set(gca, 'YLim',[3.5 5]); 