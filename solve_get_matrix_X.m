function [ matrix_X ] = solve_get_matrix_X( n )
    tmpSymArray = zeros(0);
    matrix_X = zeros(0);
    for i = 1:n
        for j = 1:n
            tmpStr = ['x' num2str(n * i + j)];
            tmpSymArray = [tmpSymArray; sym(tmpStr)];
        end
        matrix_X = [matrix_X tmpSymArray];
        tmpSymArray = zeros(0);
    end
end

