function [nps, k] = CdNps(image, dx)
% Measure Noise Power Spectrum (NPS) from a given image 3d array
% nps: 2d nps
% k: 1d array of frequency values for nps pixels
% image: input image (n x n x num_frames) (linearized
% dx: pixel size (length e.g. mm)

N = size(image, 1);
num_frames = size(image, 3);

nps = zeros(N, N);

for idx = 1:num_frames
    [x, y] = meshgrid(1:N);
    x = reshape(x, N*N, 1);
    y = reshape(y, N*N, 1);
    img = reshape(image(:,:,idx), N*N, 1);
    
    sf = fit([x, y],img,'poly22');
    
    noise = img - sf(x, y);
    
    noise = reshape(noise, N, N);
    
    nps = nps + abs(fft2(noise)).^2;
end

nps = nps / num_frames;
nps = (dx/N)^2 * nps;

nps = fftshift(nps);

dk = 1/(N*dx);
k = (-N/2):(N/2-1);
k = k * dk;


end