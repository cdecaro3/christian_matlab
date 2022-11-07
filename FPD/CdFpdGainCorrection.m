function corrected_img = CdFpdGainCorrection(image, air_image)
% corrected_img = CdFpdGainCorrection(image, air_image)
%
% apply gain correction to FPD image
%
% corrected_img: image after gain correction
% image: input image / stack of images
% air_image: air scan image / stack of images


corrected_img = image .* mean(air_image,'all') ./ mean(air_image,3);

end