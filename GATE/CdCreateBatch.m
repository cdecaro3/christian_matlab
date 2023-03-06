function runme = CdCreateBatch(parameters, mac_location, save_terminal_output)
% function runme = CdCreateBatch(parameters, mac_location, save_terminal_output)
%
% Create text to run GATE in batch mode for parameterized macros. Create
% file named "runme.sh" and place output text of this function into it.
% Delete quotation marks after copying into runme.sh file.
%
% parameters: Arbitrary number of parameter variables for gate with
%   arbitraty number of values per parameter. 
%   Example: {'energy',[60,70,80]; 'spacing',[1,2,3]; 'width',0.5}
% mac_location: (optional) file location for main mac file.
%   Default: 'mac/main.mac'
% save_terminal_output: (optional) whether the terminal output is saved to
%   a file [true], or not and output to the screen [false]
%   Default: true


if ~exist('mac_location','var')
    % mac_location does not exist, so default it to something
    mac_location = 'mac/main.mac';
end
if ~exist('terminal_output','var')
    % mac_location does not exist, so default it to something
    save_terminal_output = true;
end

runme = "#!/bin/bash" + newline + newline + newline;


elements = parameters(:,2);

% taken from https://www.mathworks.com/matlabcentral/answers/98191-how-can-i-obtain-all-possible-combinations-of-given-vectors-in-matlab#answer_252633
combinations = cell(1, numel(elements)); %set up the varargout result
[combinations{:}] = ndgrid(elements{:});
combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); %there may be a better way to do this
result = [combinations{:}]; % NumberOfCombinations by N matrix. Each row is unique.



% loop through all permutations of variables
for n = 1:size(result,1)

    runme = runme + "Gate -a ";

    %loop through each variable
    for m = 1:size(parameters,1)

        runme = runme + "[" + parameters(m,1) + "," + result(n,m) + "]";

    end

    runme = runme + " " + mac_location;

    if save_terminal_output
        runme = runme + " > terminal_output.txt";
    end
    
    runme = runme + newline;
end