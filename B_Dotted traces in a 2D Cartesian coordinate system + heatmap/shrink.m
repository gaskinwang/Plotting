function [XLimNew,YLimNew]=shrink(XLimOld,YLimOld,degree)
XLimNew=zeros(1,2);
YLimNew=zeros(1,2);
centralx=(XLimOld(1)+XLimOld(2))/2;
centraly=(YLimOld(1)+YLimOld(2))/2;
XLimNew(1)=centralx-(XLimOld(2)-XLimOld(1))/2*degree;
XLimNew(2)=centralx+(XLimOld(2)-XLimOld(1))/2*degree;
YLimNew(1)=centraly-(YLimOld(2)-YLimOld(1))/2*degree;
YLimNew(2)=centraly+(YLimOld(2)-YLimOld(1))/2*degree;
end