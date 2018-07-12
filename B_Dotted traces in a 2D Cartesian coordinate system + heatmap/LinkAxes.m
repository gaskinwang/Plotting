function newPos=LinkAxes(oldPos,xLimOld,yLimOld,xLimNew,yLimNew)
%Mapping for coaxial coordinate system coordinates
newPos=zeros(1,2);
newPos(1)=xLimNew(1)+(xLimNew(2)-xLimNew(1))/(xLimOld(2)-xLimOld(1))*...
    (oldPos(1)-xLimOld(1));
newPos(2)=yLimNew(1)+(yLimNew(2)-yLimNew(1))/(yLimOld(2)-yLimOld(1))*...
    (oldPos(2)-yLimOld(1));
end