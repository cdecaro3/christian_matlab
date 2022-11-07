function image = CdLogNormalization(object, air)
% apply log normalization to image
%
% image: output image of object after log normalization
% object: image of the object
% air: air scan

object(object <= 0) = 0.2;
air(air <= 0) = 0.2;

image = log(air ./ object);