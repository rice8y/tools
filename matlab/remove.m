targetDir = './data/';
allFiles = dir(fullfile(targetDir, '*.*'));
deletedFiles = struct();

for i = 1:numel(allFiles)
    if allFiles(i).isdir
        continue;
    end
    
    [~, ~, ext] = fileparts(allFiles(i).name);
    ext = lower(ext(2:end));
    filePath = fullfile(targetDir, allFiles(i).name);

    try
        delete(filePath);
        if isfield(deletedFiles, ext)
            deletedFiles.(ext) = deletedFiles.(ext) + 1;
        else
            deletedFiles.(ext) = 1;
        end
    catch ME
        fprintf('Error: Failed to delete %s. %s\n', filePath, ME.message);
    end
end

fields = fieldnames(deletedFiles);
if isempty(fields)
    fprintf('No files were deleted.\n');
else
    for i = 1:numel(fields)
        numFiles = deletedFiles.(fields{i});
        if numFiles == 1
            fprintf('1 %s file has been deleted.\n', upper(fields{i}));
        else
            fprintf('%d %s files have been deleted.\n', numFiles, upper(fields{i}));
        end
    end
end
