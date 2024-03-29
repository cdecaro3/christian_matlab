function image = CdReadSeq(filename, frames)
% image = CdReadSeq(filename, frames)
%
% read in the .seq file produced by the video functionality of the FPD
%
% image: output image of .seq file
% filename: the name of the file
% frames: number of image frames (pages)

image = MgReadRawFile(filename, 1536, 2048, frames, 2048, 0, 'uint16');