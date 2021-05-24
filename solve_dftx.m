function dftx = solve_dftx( ftx )
    symArray = sym('x%d', [1 size(ftx, 1)]);
    %syms(symArray);
    dftx = jacobian(ftx, symArray);
end

