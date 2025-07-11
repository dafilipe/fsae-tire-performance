function [FZ, FX] = read_calspan_data()
    FZ = [];
    FX = [];

    minficher = 50;
    maxficher = 79;

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

        idx_FZ = find(strcmp(column_names, 'FZ'));
        idx_FX = find(strcmp(column_names, 'FX'));

        if isempty(idx_FZ) || isempty(idx_FX)
            fclose(fid);
            continue;
        end

        data = textscan(fid, repmat('%f', 1, numel(column_names)), 'Delimiter', '\t');
        fclose(fid);

        fz = abs(data{idx_FZ});  % garantir sempre positivo
        fx = data{idx_FX};

        FZ = [FZ; fz];
        FX = [FX; fx];
    end
end

