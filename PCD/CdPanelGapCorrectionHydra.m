function corrected_img = CdPanelGapCorrectionHydra(img)
% corrected_img = CdPanelGapCorrectionHydra(img)
% 
% interpolate over the gaps between panels for the Hydra PCD
% 
% corrected_img: image(s) after correction
% img: uncorrected image(s) (64 x 5120 x _)

bad_left = 256:256:4864;
bad_right = 257:256:4865;

corrected_img = img;

corrected_img(:,bad_left,:) = 2/3.*img(:,bad_left-1,:) + 1/3.*img(:,bad_left+2,:);
corrected_img(:,bad_right,:) = 2/3.*img(:,bad_right+1,:) + 1/3.*img(:,bad_right-2,:);

corrected_img = corrected_img(3:62,3:5118,:);

end