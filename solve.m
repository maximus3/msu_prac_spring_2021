function solution = solve( start_t, end_t, iter_count, step, t_star, prec_in, prec_out, method_in, method_out, table_task, table_cond, table_start_p, h)
    ftx = table_task;
    ftx = ftx(1:end-1, 2);
    n = size(ftx, 1);
    dftx = solve_dftx(ftx);

    matrix_X = solve_get_matrix_X(n);
    tmp_matrix = eye(n, n);
    init_cond_for_matrix_X = reshape(tmp_matrix, [n*n, 1]);
    init_cond_for_matrix_X = init_cond_for_matrix_X';
    init_cond_for_in_task = [table_start_p init_cond_for_matrix_X];
    DX = dftx * matrix_X;
    
    solve_tmp_to_file( DX, n, ftx);
    
    charFP = table_cond;
    FP = solve_make_FP(charFP, start_t, end_t);
    p0 = table_start_p;
    
    global DRXA XAP DRXB XBP FP0;
    symArray1 = sym('xa%d', [1 n]);
    symArray1 = [symArray1 sym('xb%d', [1 n])];
    symArray1 = num2cell(symArray1);
    symArray2 = sym('xa%d', [1 n]);
    symArray3 = sym('xb%d', [1 n]);
    
    step_in = 0.01;
    for i = 1:iter_count
            for j = 0:step:(1-step)
                switch method_in
                    case 1
                        func_to_eval = 'ode45';
                    case 2
                        func_to_eval = 'ode23';
                    case 3
                        func_to_eval = 'ode23t';
                    case 4
                        func_to_eval = 'ode113';
                    case 5
                        func_to_eval = 'ode23s';
                    case 6
                        func_to_eval = 'ode15s';
                end
                if t_star == start_t
                    params = '(@systemTemp, [start_t:step_in:end_t], init_cond_for_in_task, odeset(''RelTol'', prec_in))';
                    to_eval = strcat(func_to_eval, params);
                    [T, X] = eval(to_eval);
                elseif t_star == end_t
                    params = '(@systemTemp, [end_t:-step_in:start_t], init_cond_for_in_task, odeset(''RelTol'', prec_in))';
                    to_eval = strcat(func_to_eval, params);
                    [T, X] = eval(to_eval);
                    T = T(end:-1:1, :);
                    X = X(end:-1:1, :);
                else 
                    params1 = '(@systemTemp, [t_star:-step_in:start_t], init_cond_for_in_task, odeset(''RelTol'', prec_in))';
                    params2 = '(@systemTemp, [t_star:step_in:end_t], init_cond_for_in_task, odeset(''RelTol'', prec_in))';
                    to_eval1 = strcat(func_to_eval, params1);
                    to_eval2 = strcat(func_to_eval, params2);
                    [T1, X1] = eval(to_eval1);
                    [T2, X2] = eval(to_eval2);
                    T = [T1(end:-1:2); T2];
                    X = [X1(end:-1:2, :); X2];
                end

                n = size(FP, 1);

                XAP = X(1, n+1:end);
                XAP = reshape(XAP, [n n]);
                XBP = X(end, n+1:end);
                XBP = reshape(XBP, [n n]);

                XP0 = num2cell([X(1, 1:n) X(end, 1:n)]);

                FP0 = subs(FP(:, 1), symArray1, XP0);
                
                DRXA = jacobian(FP, symArray2);
                DRXB = jacobian(FP, symArray3);
                
                DRXA = subs(DRXA, symArray1, XP0);
                DRXB = subs(DRXB, symArray1, XP0);
                
                switch method_out
                    case 1
                        [mu, p] = ode45(@solve_get_DFP, [j (j+step)], p0, odeset('RelTol', prec_out));
                    case 2
                        [mu, p] = ode23(@solve_get_DFP, [j (j+step)], p0, odeset('RelTol', prec_out));
                    case 3
                        [mu, p] = ode23t(@solve_get_DFP, [j (j+step)], p0, odeset('RelTol', prec_out));
                    case 4
                        [mu, p] = ode113(@solve_get_DFP, [j (j+step)], p0, odeset('RelTol', prec_out));
                    case 5
                        [mu, p] = ode23s(@solve_get_DFP, [j (j+step)], p0, odeset('RelTol', prec_out));
                    case 6
                        [mu, p] = ode15s(@solve_get_DFP, [j (j+step)], p0, odeset('RelTol', prec_out));
                    case 7
                        p = (solve_get_DFP*step+p0')';
                end
                p(end, :);
                p0 = p(end, :);
                init_cond_for_in_task = [p0 init_cond_for_matrix_X];
                waitbar((j / iter_count) + ((i - 1) / iter_count), h);
            end
    end  
    solution = [T(:, :), X(:, 1:n)];
end