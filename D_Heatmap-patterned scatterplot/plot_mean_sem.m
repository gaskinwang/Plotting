function plot_mean_sem(meanx,meany,stdy)
color=[0 0 1];
ld=1;
plot([meanx-40 meanx+40],[meany meany],'color',color,'linewidth',ld)
plot([meanx-30 meanx+30],[meany-stdy meany-stdy],'color',color,'linewidth',ld)
plot([meanx-30 meanx+30],[meany+stdy meany+stdy],'color',color,'linewidth',ld)
plot([meanx meanx],[meany-stdy meany+stdy],'color',color,'linewidth',ld)
end