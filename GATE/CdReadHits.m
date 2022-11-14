function hits = CdReadHits(filename, system_type)
% hits = CdReadHits(filename, system_type)
%
% read in the ASCII hits file from GATE
%
% hits: output table of the hits
% filename: filename including path of hits .dat file
% system_type: (optional) GATE scanner type, defaults to the general "scanner"

if nargin < 2
    system_type = "scanner";
end

switch system_type
    case "scanner"
        % Set up the Import Options and import the data
        opts = delimitedTextImportOptions("NumVariables", 27);

        % Specify range and delimiter
        opts.DataLines = [1, Inf];
        opts.Delimiter = " ";

        % Specify column names and types
        opts.VariableNames = ["ID_run", "ID_event", "Var3", "Var4", "Var5", "Var6", "ID_vol_1", "ID_vol_2", "ID_vol_3", "ID_vol_4", "ID_vol_5", "timestamp", "energy_deposited", "Var14", "x_position", "y_position", "z_position", "G4_particle_code", "Var19", "Var20", "Var21", "Var22", "Var23", "process_name", "Var25", "Var26", "Var27"];
        opts.SelectedVariableNames = ["ID_run", "ID_event", "ID_vol_1", "ID_vol_2", "ID_vol_3", "ID_vol_4", "ID_vol_5", "timestamp", "energy_deposited", "x_position", "y_position", "z_position", "G4_particle_code", "process_name"];
        opts.VariableTypes = ["double", "double", "string", "string", "string", "string", "double", "double", "double", "double", "double", "double", "double", "string", "double", "double", "double", "double", "string", "string", "string", "string", "string", "string", "string", "string", "string"];

        % Specify file level properties
        opts.ExtraColumnsRule = "ignore";
        opts.EmptyLineRule = "read";
        opts.ConsecutiveDelimitersRule = "join";
        opts.LeadingDelimitersRule = "ignore";

        % Specify variable properties
        opts = setvaropts(opts, ["Var3", "Var4", "Var5", "Var6", "Var14", "Var19", "Var20", "Var21", "Var22", "Var23", "process_name", "Var25", "Var26", "Var27"], "WhitespaceRule", "preserve");
        opts = setvaropts(opts, ["Var3", "Var4", "Var5", "Var6", "Var14", "Var19", "Var20", "Var21", "Var22", "Var23", "process_name", "Var25", "Var26", "Var27"], "EmptyFieldRule", "auto");
        opts = setvaropts(opts, "ID_run", "TrimNonNumeric", true);
        opts = setvaropts(opts, "ID_run", "ThousandsSeparator", ",");

        % Import the data
        hits = readtable(filename, opts);
    otherwise
        error("I don't know system_type '%s'. Check spelling or add to function.",system_type)
end