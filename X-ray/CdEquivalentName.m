function name = CdEquivalentName(name_in)
% name = CdEquivalentName(name_in)
%
% Convert nicknames for materials into the names for XCOM data
% not case sensitive
%
% name: name of element/compund/mixture ['Gd2O2S']
% name_in: potential nicknames or other names ['Gd2O2S','gadox','GOS']

name_in = lower(char(name_in));

opts = delimitedTextImportOptions("NumVariables", 2);
opts.Delimiter = [",", ":"];
opts.VariableTypes = ["string", "string"];
nicknames = readmatrix("material_nicknames.txt", opts);

% check to see if name_in matches any names
idx = find( any(matches(nicknames,name_in,"IgnoreCase",true), 2));
if any(idx,'all')
    name = nicknames(idx,1);
    return
end

error("That name isn't found in the material_nicknames.txt file. Check spelling, add material, or add to nicknames file.")




end