function newPos=shrink2(oldPos,degree)
newPos=zeros(1,4);
centralx=(oldPos(1)+oldPos(3))/2;
centraly=(oldPos(2)+oldPos(4))/2;
newPos(1)=centralx-oldPos(3)*degree/2;
newPos(2)=centraly-oldPos(4)*degree/2;
newPos(3)=oldPos(3)*degree;
newPos(4)=oldPos(4)*degree;
end