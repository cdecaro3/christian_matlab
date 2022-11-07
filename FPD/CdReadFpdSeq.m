function image = CdReadFpdSeq(filename, rows, cols, frames)
% read in the .seq file produced by the video functionality of the FPD
%
% filename: the name of the file
% rows: number of rows (image height)
% cols: number of columns (image width)
% frames: number of image frames (pages)

image = MgReadRawFile(filename, rows, cols, frames, 2048, 0, 'uint16');