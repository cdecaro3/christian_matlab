function killed = CdReadKillActor(filename)
% killed = CdReadKillActor(filename)
%
% read in the Kill Actor output file from GATE
%
% killed: number of tracks killed
% filename: filename of the .txt file

% Auto-generated by MATLAB on 2022/11/14 16:00:10

%% Initialize variables.
% filename = 'D:\Christian\20221102_RSNA_2022\GATE_hybrid\data\photodiode_1_killActor.txt';

%% Format for each line of text:
%   column4: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*22s%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this code. If an error occurs for a different file, try regenerating the code from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post processing code is included. To generate code which works for unimportable data, select unimportable cells in a file and regenerate the script.

%% Create output variable
killed = table(dataArray{1:end-1}, 'VariableNames', {'VarName4'});
killed = killed.VarName4(1);