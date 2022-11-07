function roi = CdGetRoiCircle(img, radius, center)
% roi = CdGetRoiCircle(img, radius, center)
% 
% return the values from a circular ROI in a 1d array given the circle's 
% center location and radius
%
% roi: data roi matrix
% img: input matrix
% radius: radius of circle roi
% center: position of the center of circle roi [Y, X]

[Y,X]=ndgrid(1:size(img,1),1:size(img,2));
X=X-center(2);Y=Y-center(1);%shift coordinate grid
L=sqrt(X.^2+Y.^2)<=radius;
roi = img(L);

end