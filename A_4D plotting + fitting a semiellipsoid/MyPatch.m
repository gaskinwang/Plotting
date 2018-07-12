close all;clear;clc;
%Êý¾Ý¶ÁÈë
data1=xlsread('xyz.xls');
data2=xlsread('point attribute.xls');
size1=size(data1);
[X,Y]=meshgrid(1:size1(2),1:size1(1));
surf(X,Y,data1,data2);
colorbar
set(gca,'color','none');

x=X(:);
y=Y(:);
z=data1(:);
%Fitting data
p= ellipsoidfit(x,y,z);
%Conversion representation
[center,radii,quat,R] = ellipsoid_im2ex(p);
figure
hold on
%Rotate to be tangential
RotateBack=bsxfun(@plus,bsxfun(@minus,[x,y,z],center')/R,center');
x=RotateBack(:,1);y=RotateBack(:,2);z=RotateBack(:,3);
x=reshape(x,size(X));y=reshape(y,size(Y));z=reshape(z,size(data1));
bias=1.01;
h_surf2=surf(x,y,z*bias,data2);

set(h_surf2,'edgecolor','none')

h_surf=plot_ellipsoid(center(1),center(2),center(3),radii(1),radii(2),radii(3),eye(1));
set(h_surf,'EdgeColor',[0 1 0]);
view( -70, 40 );
%Adjust display

caxis([0 1])
colormap jet
colorbar
axis vis3d;
axis equal
set(gca,'color','none');
set(gca,'ZLim',[center(3),max(data1(:))*1.2])