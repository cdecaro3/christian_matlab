function singles = CdReadSingles(filename, system_type)
% singles = CdReadSingles(filename, system_type)
%
% read in the ASCII singles file from GATE
%
% singles: output table of the singles
% filename: filename including path of singles .dat file
% system_type: (optional) GATE scanner type, defaults to the general "scanner"

switch system_type
    case "scanner"
%         Auto-generated by MATLAB on 2022/10/31 10:46:42
        % Open the text file.
        fileID = fopen(filename,'r');

        % Read columns of data according to the format.
        % This call is based on the structure of the file used to generate this code. If an error occurs for a different file, try regenerating the code from the Import Tool.
        dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
        for block=2:length(startRow)
            frewind(fileID);
            dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
            for col=1:length(dataArray)
                dataArray{col} = [dataArray{col};dataArrayBlock{col}];
            end
        end

        % Remove white space around all cell columns.
        dataArray{23} = strtrim(dataArray{23});
        dataArray{24} = strtrim(dataArray{24});

        % Close the text file.
        fclose(fileID);

        % Post processing for unimportable data.
        % No unimportable data rules were applied during the import, so no post processing code is included. To generate code which works for unimportable data, select unimportable cells in a file and regenerate the script.

        % Create output variable
        singles = table(dataArray{1:end-1}, 'VariableNames', {'ID_run','ID_event','ID_source','source_X','source_Y','source_Z','volume_ID_1','volume_ID_2','volume_ID_3','volume_ID_4','volume_ID_5','volume_ID_6','volume_ID_7','timestamp','energy_dep','X','Y','Z','num_compton_phantom','num_compton_detector','num_rayleigh_phantom','num_rayleigh_detector','phantom_name_compton','phantom_name_rayleigh'});
    otherwise
        error("I don't know system_type '%s'. Check spelling or add to function.",system_type)
end