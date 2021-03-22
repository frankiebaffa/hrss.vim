" Vim Syntax File
" Language: HRSS
" Maintainer: Frankie Baffa
" Latest Revision 18 Mar 2021

if exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax spell toplevel

syn case ignore

" table definitions
syn region hrss_table_con start="<<<TABLE" end="TABLE>>>"
			\ contains=hrss_col_delim,hrss_row_delim,hrss_cell_data_con
syn match hrss_col_delim "\(\\\)\@<!|" keepend contained
			\ containedin=hrss_table_con
syn match hrss_row_delim "\(^\)\@<=\s*-[\-\s]*\($\)\@=" keepend contained
			\ containedin=hrss_table_con
syn region hrss_cell_data_con start="\(\(\\\)\@<!|\)\@<=." end="\(.\(\(\\\)\@<!|\)\@=\)"
			\ keepend oneline contains=hrss_cell_data,hrss_fn contained containedin=hrss_table_con
syn match hrss_cell_data ".\+" keepend contained containedin=hrss_cell_data_con
			\ contains=hrss_fn
syn match hrss_fn "\(\$[a-z0-9]\+\)" keepend contained containedin=hrss_cell_data
" function definitions
syn region hrss_def_con start="<<<FN" end="FN>>>" contains=hrss_def
syn match hrss_def "\$[a-z0-9]\+\(\s*=\s*{\)\@=" contained containedin=hrss_def_con
syn region hrss_def start="\$[a-z0-9]\+\s*=\s*{" end="\(}\)\@<=$" keepend
			\ contained containedin=hrss_def_con contains=hrss_def_calc
syn region hrss_def_calc start="\(\$[a-z0-9]\+\s*=\s*{\)\@<=$" end="^\(}\)\@=" contained containedin=hrss_def
" highlighting
hi def link hrss_table_con Special
hi def link hrss_def_con Special
hi def link hrss_col_delim Comment
hi def link hrss_row_delim Comment
hi def link hrss_def_con_row_delim Comment
hi def link hrss_cell_data Number
hi def link hrss_fn PreProc
hi def link hrss_def PreProc
hi def link hrss_def_calc Number

"hi def link config PreProc
"hi def link configkey Number
"hi def link configdelim PreProc
"hi def link configVal Special
"hi def link tagbar Number
"hi def link tagname Special
"hi def link classname Title
"hi def link tagname Number
"hi def link tagmodval PreProc
"hi def link textstart Comment
"hi def link textblock None
"hi def link formatchars PreProc
