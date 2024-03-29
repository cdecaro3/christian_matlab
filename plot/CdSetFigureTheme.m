function r = CdSetFigureTheme(theme)
% r = CdSetFigureTheme(theme)
%
% Set the theme for all figures
%
% theme: name of the theme. Including:
%   dark: black background, for presentations
%   light: white background, for journal papers
%   default: reset to Matlab defaults

switch theme
    case "dark"
        colors = [%255, 255, 255;        % white
            0, 143, 237;
            237, 94, 0;
            24, 237, 0;
            213, 0, 237;

            0, 114, 189;
            189, 75, 0;
            20, 189, 0;
            169, 0, 189;


            0, 168, 255;        % blue
            255, 87, 0;         % oragin
            40, 255, 0;         % green
            215, 0, 255;        % pink
            251, 197, 49;       % yellow
            76, 209, 55;        % green
            156, 136, 255;      % purple

            %255, 192, 0;                % orange
            0, 191, 191;                % dark teal
            191, 0, 0;                  % red
            0, 191, 0;                  % Green
            191, 0, 191;                % purple

            127, 237, 54;
            255, 0, 59;
            0, 208, 255;
            161, 0, 255;
            255, 153, 0;
            0, 255, 237;
            0, 255, 161;
            238, 0, 255;

            240, 196, 25;
            78, 186, 111;
            241, 90, 90;
            45, 149, 191;
            149, 91, 165]/255;

        set(groot, 'DefaultFigureColor', 'black');
        set(groot, 'DefaultFigureInvertHardcopy', 'off');
        set(groot, 'DefaultAxesColor', 'black');
        set(groot, 'DefaultTextColor', 'white');

        set(groot, 'DefaultAxesColorOrder', colors);
        set(groot, 'DefaultLineLineWidth', 1);

        %     set(groot, 'DefaultTextInterpreter', 'LaTeX');
        %     set(groot, 'DefaultAxesTickLabelInterpreter', 'LaTeX');
        %     set(groot, 'DefaultAxesFontName', 'LaTeX');
        %     set(groot, 'DefaultLegendInterpreter', 'LaTeX');

        set(groot, 'DefaultAxesXColor', 'white');
        set(groot, 'DefaultAxesYColor', 'white');
        set(groot, 'DefaultAxesZColor', 'white');

        set(groot, 'DefaultTextFontSize', 16);
        set(groot, 'DefaultAxesFontSize', 16);

        set(groot, 'DefaultTextFontName', 'remove');
        set(groot, 'DefaultAxesFontName', 'remove');

    case "light"

        set(groot, 'DefaultAxesColor', 'white');
        set(groot, 'DefaultFigureColor', 'white');
        set(groot, 'DefaultFigureInvertHardcopy', 'remove');

        %     set(groot, 'DefaultFigureColor', 'none');
        %     set(groot, 'DefaultFigureInvertHardcopy', 'off');
        %     set(groot, 'DefaultAxesColor', 'none');

        set(groot, 'DefaultAxesColorOrder', 'remove');
        set(groot, 'DefaultLineLineWidth', 1);

        set(groot, 'DefaultTextInterpreter', 'remove');
        set(groot, 'DefaultAxesTickLabelInterpreter', 'remove');
        set(groot, 'DefaultAxesFontName', 'remove');
        set(groot, 'DefaultLegendInterpreter', 'remove');

        %     set(groot, 'DefaultAxesXColor', 'remove');
        %     set(groot, 'DefaultAxesYColor', 'remove');
        %     set(groot, 'DefaultAxesZColor', 'remove');
        set(groot,{'DefaultAxesXColor','DefaultAxesYColor','DefaultAxesZColor'},{'k','k','k'})

        set(groot, 'DefaultTextColor', 'remove');

        set(groot, 'DefaultTextFontSize', 13);
        set(groot, 'DefaultAxesFontSize', 13);

        set(groot, 'DefaultTextFontName', 'Times New Roman');
        set(groot, 'DefaultAxesFontName', 'Times New Roman');

    case "default"
        reset(groot)
    otherwise
        error("Do not have theme '%s', only have 'dark', 'light' and 'default'.\n", theme);
end

r = groot;
end
