"        ________ ++     ________
"       /VVVVVVVV\++++  /VVVVVVVV\
"       \VVVVVVVV/++++++\VVVVVVVV/
"        |VVVVVV|++++++++/VVVVV/'
"        |VVVVVV|++++++/VVVVV/'
"       +|VVVVVV|++++/VVVVV/'+
"     +++|VVVVVV|++/VVVVV/'+++++
"   +++++|VVVVVV|/VVVVV/'+++++++++
"     +++|VVVVVVVVVVV/'+++++++++
"       +|VVVVVVVVV/'+++++++++
"        |VVVVVVV/'+++++++++
"        |VVVVV/'+++++++++
"        |VVV/'+++++++++
"        'V/'   ++++++
"                 ++	BY VDEDIOS.
"

"--- Plugings list ---{{{
	call plug#begin('~/.vim/autoload')
	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'VundleVim/Vundle.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'rmolin88/pomodoro.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'neoclide/coc.nvim'
	Plug 'sainnhe/forest-night'

	call plug#end()
"}}}

"--- Variable set ---{{{
	set backspace=indent,eol,start
	set nocompatible              " be iMproved, required
	set number
	set cursorline
	set nocompatible
	set splitright
	set splitbelow
	set noerrorbells visualbell t_vb=
	" Forest night theme settings
	set termguicolors
	" Lightline configs
	set laststatus=2
	set noshowmode
	set encoding=UTF-8

	" Added set
	set termguicolors                       
	set smartindent                        
	set hlsearch                            
	set undofile                           
	set undodir=$HOME/.cache/vim/undo     
	set timeoutlen=500                   
	set hidden                          
	set scrolloff=5                    
	set viminfo='1000                       
	
	set wildmenu                          
	set autoread                         
	set foldmethod=indent
	set clipboard=unnamedplus
	set laststatus=2
	set noshowmode
	
	if (expand('%t') == ".vimrc")
	    set foldmethod=marker
	else
	    set foldmethod=indent
	endif
	
	"Debugging options
	set verbosefile=~/.vim/vimdebug.txt
	
	"Specific features for JS
	autocmd Filetype js setlocal tabstop=2
	if has('autocmd')
		autocmd GUIEnter * set visualbell t_vb=
	endif
"}}}

"--- Mappings ---{{{
	inoremap jj <ESC>
	inoremap { {<CR>}<Esc>ko
	inoremap <  <><ESC>hli
	inoremap "  ""<ESC>hli
	inoremap '  ''<ESC>hli
	inoremap [  []<ESC>hli
	inoremap (  ()<ESC>hli
	nnoremap :w :wa
	nnoremap :%y + :yy
	map <C-l> gt
	map <C-h> gT
	map  r <C-r>
	map <D-k> h
	map <D-K> h
	map <A-k> h
	map <A-K> h
	" Split window mapping
	if bufwinnr(1)
		map H <C-W>h
		map J <C-W>j
		map K <C-W>k
		map L <C-W>l
		map * <C-W>>
		map _ <C-W><
		map + <C-W>+
		map - <C-W>-
	endif
"}}}

"--- functions ---{{{
	function! PomodoroStatus() abort"{{{
	    if pomo#remaining_time() ==# '0'
	        return "\ue001"
	    else
	        return "\ue003 ".pomo#remaining_time()
	    endif
	endfunction"}}}
	function! CocCurrentFunction()"{{{
	    return get(b:, 'coc_current_function', '')
	endfunction"}}}
	function! Devicons_Filetype()"{{{
	    " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
	    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
	endfunction"}}}
	function! Devicons_Fileformat()"{{{
	    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
	endfunction"}}}
	function! Tab_num(n) abort"{{{
	    return a:n." \ue0bb"
	endfunction"}}}
	function! Gitbranch() abort"{{{
	    if gitbranch#name() !=# ''
	        return gitbranch#name()." \ue725"
	    else
	        return "\ue61b"
	    endif
	endfunction"}}}
	function! Artify_inactive_tab_num(n) abort"{{{
	    return Artify(a:n, 'double_struck')." \ue0bb"
	endfunction"}}}
	function! Artify_lightline_tab_filename(s) abort"{{{
	    return Artify(lightline#tab#filename(a:s), 'monospace')
	endfunction"}}}
	function! Artify_lightline_mode() abort"{{{
	    return Artify(lightline#mode(), 'monospace')
	endfunction"}}}
	function! Artify_line_percent() abort"{{{
	    return Artify(string((100*line('.'))/line('$')), 'bold')
	endfunction"}}}
	function! Artify_line_num() abort"{{{
	    return Artify(string(line('.')), 'bold')
	endfunction"}}}
	function! Artify_col_num() abort"{{{
	    return Artify(string(getcurpos()[2]), 'bold')
	endfunction"}}}
	function! Artify_gitbranch() abort"{{{
	    if gitbranch#name() !=# ''
	        return Artify(gitbranch#name(), 'monospace')." \ue725"
	    else
	        return "\ue61b"
	    endif
	endfunction"}}}
"}}}

"--- Plugin configs ---{{{
	let g:netrw_liststyle = 3
	let g:webdevicons_enable_vimfiler = 1
	let g:lightline = {}
	let g:lightline.colorscheme = 'forest_night'
	let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
	let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
	let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
	let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
	let g:lightline#ale#indicator_checking = "\uf110"
	let g:lightline#ale#indicator_warnings = "\uf529"
	let g:lightline#ale#indicator_errors = "\uf00d"
	let g:lightline#ale#indicator_ok = "\uf00c"
	let g:lightline#asyncrun#indicator_none = ''
	let g:lightline#asyncrun#indicator_run = 'Running...'
	let g:lightline.active = {
	            \ 'left': [ [ 'mode', 'paste' ],
	            \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
	            \ 'right': [ [ 'lineinfo' ],
	            \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
	            \           [ 'asyncrun_status', 'coc_status' ] ]
	            \ }
	let g:lightline.inactive = {
	            \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
	            \ 'right': [ [ 'lineinfo' ] ]
	            \ }
	let g:lightline.tabline = {
	            \ 'left': [ [ 'vim_logo', 'tabs' ] ],
	            \ 'right': [ [ 'gitbranch' ],
	            \ [ 'gitstatus' ] ]
	            \ }
	let g:lightline.tab = {
	            \ 'active': [ 'tabnum', 'filename', 'modified' ],
	            \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
	let g:lightline.tab_component = {
	            \ }
	let g:lightline.tab_component_function = {
	            \ 'artify_activetabnum': 'Artify_active_tab_num',
	            \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
	            \ 'artify_filename': 'Artify_lightline_tab_filename',
	            \ 'filename': 'lightline#tab#filename',
	            \ 'modified': 'lightline#tab#modified',
	            \ 'readonly': 'lightline#tab#readonly',
	            \ 'tabnum': 'Tab_num'
	            \ }
	let g:lightline.component = {
	            \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
	            \ 'artify_mode': '%{Artify_lightline_mode()}',
	            \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
	            \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
	            \ 'vim_logo': "\ue7c5",
	            \ 'pomodoro': '%{PomodoroStatus()}',
	            \ 'mode': '%{lightline#mode()}',
	            \ 'absolutepath': '%F',
	            \ 'relativepath': '%f',
	            \ 'filename': '%t',
	            \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
	            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
	            \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
	            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
	            \ 'modified': '%M',
	            \ 'bufnum': '%n',
	            \ 'paste': '%{&paste?"PASTE":""}',
	            \ 'readonly': '%R',
	            \ 'charvalue': '%b',
	            \ 'charvaluehex': '%B',
	            \ 'percent': '%2p%%',
	            \ 'percentwin': '%P',
	            \ 'spell': '%{&spell?&spelllang:""}',
	            \ 'lineinfo': '%2p%% %3l:%-2v',
	            \ 'line': '%l',
	            \ 'column': '%c',
	            \ 'close': '%999X X ',
	            \ 'winnr': '%{winnr()}'
	            \ }
	let g:lightline.component_function = {
	            \ 'gitbranch': 'Gitbranch',
	            \ 'devicons_filetype': 'Devicons_Filetype',
	            \ 'devicons_fileformat': 'Devicons_Fileformat',
	            \ 'coc_status': 'coc#status',
	            \ 'coc_currentfunction': 'CocCurrentFunction'
	            \ }
	let g:lightline.component_expand = {
	            \ 'linter_checking': 'lightline#ale#checking',
	            \ 'linter_warnings': 'lightline#ale#warnings',
	            \ 'linter_errors': 'lightline#ale#errors',
	            \ 'linter_ok': 'lightline#ale#ok',
	            \ 'asyncrun_status': 'lightline#asyncrun#status'
	            \ }
	let g:lightline.component_type = {
	            \ 'linter_warnings': 'warning',
	            \ 'linter_errors': 'error'
	            \ }
	
	"Pomodoro config
	" Duration of a pomodoro in minutes (default: 25)
	let g:pomodoro_time_work = 52
	" Duration of a break in minutes (default: 5)
	let g:pomodoro_time_slack = 15 
"}}}

syntax on
colorscheme forest-night
filetype off                 " required
filetype plugin indent on    " required

augroup lightlineCustom
    autocmd!
    autocmd BufWritePost * call lightline#update()
augroup END
