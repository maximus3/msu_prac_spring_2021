function [] = solve_tmp_to_file( DX, n, ftx )
    strDX = zeros(0);
    tmpStrDX = zeros(0);
    for i = 1:n
        for j = 1:n
            a = char(DX(j, i));
            a = num2cell(a, 2);
            tmpStrDX = [tmpStrDX; a];
        end
        strDX = [strDX tmpStrDX];
        tmpStrDX = zeros(0);
    end
        
    strDX = reshape(strDX, [n*n, 1]);
    system = [ftx; strDX];
    
    fileID = fopen('systemTemp.m', 'w'); 
    fclose(fileID);
    if fileID == -1 
        error('File is not opened'); 
    end
    n = size(system, 1);
    fileID = fopen('systemTemp.m', 'a'); 
    fileHeader = ['function [ dx ] = systemTemp(t, x)\n\tdx = zeros(' num2str(n) ', 1);\n'];
    fprintf(fileID, fileHeader);
    
    for i = 1:n
        strTmp = system(i, 1);
        for j = 1:n
            toReplace = ['x' num2str(n + 1 - j)];
            replacement = ['x(' num2str(n + 1 - j) ')'];
            strTmp = strrep(strTmp, toReplace, replacement); 
        end
        str = ['\tdx(' num2str(i) ') = ' char(strTmp) ';\n'];
        fprintf(fileID, str);
    end
    fprintf(fileID, 'end');
    fclose(fileID);
end

