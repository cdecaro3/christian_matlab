function corrected_img = CdFpdDarkCorrection(image, dark_image)
% corrected_img = CdFpdDarkCorrection(image, dark_image)
%
% apply dark field correction to FPD image
%
% corrected_img: image after dark field correction
% image: input image / stack of images
% dark_image: dark field image / stack of images


dark = mean(dark_image,3);
corrected_img = image - dark;



end