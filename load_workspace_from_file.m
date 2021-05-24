function [ output_args ] = load_workspace_from_file( handles, filename )

global solution;
global edit_start edit_end edit_iter_count edit_step edit_t;
global edit_prec_in edit_prec_out;
global popupmenu_in popupmenu_out;
global table_task table_cond table_start_p;
global edit_task_name edit_task_comment;

load(filename, 'solution', 'edit_iter_count', 'table_task', 'table_cond', 'edit_start', 'edit_end', 'edit_step', 'edit_prec_out', 'edit_prec_in', 'popupmenu_out', 'popupmenu_in','edit_t', 'table_start_p', 'buttons', 'edit_task_name', 'edit_task_comment');
    
set(handles.table_task, 'Data', table_task);
set(handles.table_cond, 'Data', table_cond);
set(handles.edit_start, 'String', edit_start);
set(handles.edit_end, 'String', edit_end);
set(handles.edit_iter_count, 'String', edit_iter_count);
set(handles.edit_step, 'String', edit_step);
set(handles.edit_prec_out, 'String', edit_prec_out);
set(handles.edit_prec_in, 'String', edit_prec_in);
set(handles.popupmenu_out, 'Value', popupmenu_out);
set(handles.popupmenu_in, 'Value', popupmenu_in);
set(handles.edit_t, 'String', edit_t);
set(handles.table_start_p, 'Data', table_start_p);
set(handles.edit_task_name, 'String', edit_task_name);
set(handles.edit_task_comment, 'String', edit_task_comment);
set(handles.pushbutton_sol, 'Enable', char(buttons(1, 1)));
set(handles.pushbutton_clear, 'Enable', char(buttons(2, 1)));
set(handles.pushbutton_res, 'Enable', char(buttons(3, 1)));

end

