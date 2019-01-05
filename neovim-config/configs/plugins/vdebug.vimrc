''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' vdebug settings
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

let g:vdebug_options={
	\'port' : 9001,
	\'timeout' : 20,
	\'server' : '',
	\'on_close' : 'stop',
	\'break_on_open' : 1,
	\'ide_key' : '',
	\'debug_window_level' : 0,
	\'debug_file_level' : 0,
	\'debug_file' : '',
	\'path_maps' : {},
	\'watch_window_style' : 'expanded',
	\'marker_default' : '⬦',
	\'marker_closed_tree' : '▸',
	\'marker_open_tree' : '▾',
	\'sign_breakpoint' : '▷',
	\'sign_current' : '▶',
	\'continuous_mode'  : 1
\ }

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' vdebug re-mapping
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

let g:vdebug_keymap={
	\'run' : '<leader>5',
	\'run_to_cursor' : '<leader>9',
	\'step_over' : '<leader>2',
	\'step_into' : '<leader>3',
	\'step_out' : '<leader>4',
	\'close' : '<leader>6',
	\'detach' : '<leader>7',
	\'set_breakpoint' : '<leader>10',
	\'get_context' : '<leader>11',
	\'eval_under_cursor' : '<leader>12',
	\'eval_visual' : '<leader>e',
\ }
