function name = CdEquivalentName(name_in)
% name = CdEquivalentName(name_in)
%
% Convert nicknames for materials into the names for XCOM data
% not case sensitive
%
% name: name of element/compund/mixture ['Gd2O2S']
% name_in: potential nicknames or other names ['Gd2O2S','gadox','GOS']

name_in = lower(char(name_in));

file = importdata('material_densities.txt');

% check to see if name_in matches any names already
idx = find(matches(lower(file.rowheaders),name_in));
if any(idx,'all')
    name = file.rowheaders{idx};
    return
end


if ismember(name_in,lower({'gadox','GOS'}))
    name = 'Gd2O2S';
elseif ismember(name_in,lower({'YAS'}))
    name = 'Y3Al5O12';



end



end