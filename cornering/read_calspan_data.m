
function [SA, Y, FZ] = read_calspan_data(target_variable, min_SA, max_SA)
    SA = [];
    Y = [];
    FZ = [];
    minficher = 16;
    maxficher = 49;

    % Controla se há filtro de SA
    filter_SA = (nargin >= 3);

    for i = minficher:maxficher
        filename = sprintf('B2356raw%02d.dat', i);
        if ~exist(filename, 'file')
            continue;
        end

        fid = fopen(filename, 'r');
        if fid == -1
            continue;
        end

        first_line = fgetl(fid);
        if isempty(strfind(first_line, 'Hoosier 20.5X7.0-13, R20')) || ...
           isempty(strfind(first_line, 'Rim_Width=7.0'))
            fclose(fid);
            continue;
        end

        column_names_line = fgetl(fid);
        fgetl(fid);  % skip units
        column_names = strsplit(strtrim(column_names_line));
        idx_SA = find(strcmp(column_names, 'SA'));
        idx_Y  = find(strcmp(column_names, target_variable));
        idx_FZ = find(strcmp(column_names, 'FZ'));

        if isempty(idx_SA) || isempty(idx_Y) || isempty(idx_FZ)
            fclose(fid);
            continue;
        end

        data = textscan(fid, repmat('%f', 1, numel(column_names)), 'Delimiter', '\t');
        fclose(fid);

        sa = data{idx_SA};
        y  = data{idx_Y};
        fz = abs(data{idx_FZ});  % always positive

        % Aplica filtro apenas se min_SA e max_SA forem fornecidos
        if filter_SA
            mask = (sa >= min_SA) & (sa <= max_SA);
        else
            mask = true(size(sa));
        end

        SA = [SA; sa(mask)];
        Y  = [Y;  y(mask)];
        FZ = [FZ; fz(mask)];
    end
end

