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
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'rmolin88/pomodoro.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'neoclide/coc.nvim'
	Plug 'sainnhe/forest-night'
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'voldikss/vim-floaterm'
  Plug 'altercation/vim-colors-solarized'
	
	call plug#end()
"}}}

"--- Variable set ---{{{
	set nocompatible              " be iMproved, required
	set backspace=indent,eol,start
	set number
	set cursorline
	set splitright
	set splitbelow
	set noerrorbells visualbell t_vb=
	" Forest night theme settings
	set termguicolors
	" Lightline configs
	set laststatus=2
	set noshowmode
	set encoding=UTF-8

	" Tabs
	  "NormiTabs
	  ""set tabstop=4
	  ""set shiftwidth=4
	  ""set noexpandtab
	  set tabstop=2
	  set shiftwidth=2
	  set expandtab

	"Better search
	  ""set ignorecase
	  ""set smartcase
	  ""set incsearch
	  ""set showmatch
	  ""set smartindent                        
	  ""set hlsearch                            

	set undofile                           
	set undodir=$HOME/.cache/vim/undo     
	set timeoutlen=500                   
	set hidden                          
	set scrolloff=5                    
	set viminfo='1000                       
	
	set wildmenu                          
	set autoread                         
	set foldmethod=indent
	set clipboard=unnamed
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
	inoremap { {}<Esc>i
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

	" === Denite shorcuts === "
	  "   ;         - Browser currently open buffers
	  "   <leader>t - Browse list of files in current directory
	  "   <leader>g - Search current directory for occurences of given term and close window if no results
	  "   <leader>j - Search current directory for occurences of word under cursor
	  nmap ; :Denite buffer<CR>
	  nmap , :DeniteProjectDir file/rec<CR>i
	  nnoremap <C-k> :<C-u>Denite grep:. -no-empty<CR>
	  nnoremap <C-j> :<C-u>DeniteCursorWord grep:.<CR>
	  
	  " Define mappings while in 'filter' mode
	  "   <C-o>         - Switch to normal mode inside of search results
	  "   <Esc>         - Exit denite window in any mode
	  "   <CR>          - Open currently selected file in any mode
	  "   <C-t>         - Open currently selected file in a new tab
	  "   <C-v>         - Open currently selected file a vertical split
	  "   <C-h>         - Open currently selected file in a horizontal split
	  autocmd FileType denite-filter call s:denite_filter_my_settings()
	  function! s:denite_filter_my_settings() abort
	    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	    inoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
	    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
	    inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
	    inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
	    inoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')
	  endfunction
	  
	  " Define mappings while in denite window
	  "   <CR>        - Opens currently selected file
	  "   q or <Esc>  - Quit Denite window
	  "   d           - Delete currenly selected file
	  "   p           - Preview currently selected file
	  "   <C-o> or i  - Switch to insert mode inside of filter prompt
	  "   <C-t>       - Open currently selected file in a new tab
	  "   <C-v>       - Open currently selected file a vertical split
	  "   <C-h>       - Open currently selected file in a horizontal split
	  autocmd FileType denite call s:denite_my_settings()
	  function! s:denite_my_settings() abort
	    nnoremap <silent><buffer><expr> <CR>
	    \ denite#do_map('do_action')
	    nnoremap <silent><buffer><expr> q
	    \ denite#do_map('quit')
	    nnoremap <silent><buffer><expr> <Esc>
	    \ denite#do_map('quit')
	    nnoremap <silent><buffer><expr> d
	    \ denite#do_map('do_action', 'delete')
	    nnoremap <silent><buffer><expr> p
	    \ denite#do_map('do_action', 'preview')
	    nnoremap <silent><buffer><expr> i
	    \ denite#do_map('open_filter_buffer')
	    nnoremap <silent><buffer><expr> <C-o>
	    \ denite#do_map('open_filter_buffer')
	    nnoremap <silent><buffer><expr> <C-t>
	    \ denite#do_map('do_action', 'tabopen')
	    nnoremap <silent><buffer><expr> <C-v>
	    \ denite#do_map('do_action', 'vsplit')
	    nnoremap <silent><buffer><expr> <C-h>
	    \ denite#do_map('do_action', 'split')
	  endfunction

  " === Floaterm shortcuts === 
    " File Explorer
    nnoremap f :FloatermNew lf<CR>
    nnoremap t :FloatermNew<CR>
    nnoremap <C-s> :FloatermNew spt<CR>
    "":FloatermPrev or :FloatermNext
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

  "" lightline
	  let g:lightline = {}
	  let g:lightline.colorscheme = 'forest_night'
	  ""let g:lightline.colorscheme = 'solarized'
	  let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
	  let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
	  let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
	  let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
	  let g:lightline#ale#indicator_checking = "\uf110"
	  let g:lightline#ale#indicator_warnings = "\uf529"
	  let g:lightline#ale#indicator_errors = "\uf00d"
	  let g:lightline#ale#indicator_ok = "\uf00c"
	  let g:lightline#asyncrun#indicator_none = ''
	  let g:lightline#asyncrun#indicator_run = 'running...'
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
	              \ 'artify_activetabnum': 'artify_active_tab_num',
	              \ 'artify_inactivetabnum': 'artify_inactive_tab_num',
	              \ 'artify_filename': 'artify_lightline_tab_filename',
	              \ 'filename': 'lightline#tab#filename',
	              \ 'modified': 'lightline#tab#modified',
	              \ 'readonly': 'lightline#tab#readonly',
	              \ 'tabnum': 'tab_num'
	              \ }
	  let g:lightline.component = {
	              \ 'artify_gitbranch' : '%{artify_gitbranch()}',
	              \ 'artify_mode': '%{artify_lightline_mode()}',
	              \ 'artify_lineinfo': "%2{artify_line_percent()}\uf295 %3{artify_line_num()}:%-2{artify_col_num()}",
	              \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
	              \ 'vim_logo': "\ue7c5",
	              \ 'pomodoro': '%{pomodorostatus()}',
	              \ 'mode': '%{lightline#mode()}',
	              \ 'absolutepath': '%f',
	              \ 'relativepath': '%f',
	              \ 'filename': '%t',
	              \ 'filesize': "%{humansize(line2byte('$') + len(getline('$')))}",
	              \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
	              \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
	              \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
	              \ 'modified': '%m',
	              \ 'bufnum': '%n',
	              \ 'paste': '%{&paste?"paste":""}',
	              \ 'readonly': '%r',
	              \ 'charvalue': '%b',
	              \ 'charvaluehex': '%b',
	              \ 'percent': '%2p%%',
	              \ 'percentwin': '%p',
	              \ 'spell': '%{&spell?&spelllang:""}',
	              \ 'lineinfo': '%2p%% %3l:%-2v',
	              \ 'line': '%l',
	              \ 'column': '%c',
	              \ 'close': '%999x x ',
	              \ 'winnr': '%{winnr()}'
	              \ }
	  let g:lightline.component_function = {
	              \ 'gitbranch': 'gitbranch',
	              \ 'devicons_filetype': 'devicons_filetype',
	              \ 'devicons_fileformat': 'devicons_fileformat',
	              \ 'coc_status': 'coc#status',
	              \ 'coc_currentfunction': 'coccurrentfunction'
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

	"Denite configs
		" Wrap in try/catch to avoid errors on initial install before plugin is available
		try
		" === Denite setup ==="
		" Use ripgrep for searching current directory for files
		" By default, ripgrep will respect rules in .gitignore
		"   --files: Print each file that would be searched (but don't search)
		"   --glob:  Include or exclues files for searching that match the given glob
		"            (aka ignore .git files)
		"
		call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
		
		" Use ripgrep in place of "grep"
		call denite#custom#var('grep', 'command', ['rg'])
		
		" Custom options for ripgrep
		"   --vimgrep:  Show results with every match on it's own line
		"   --hidden:   Search hidden directories and files
		"   --heading:  Show the file name above clusters of matches from each file
		"   --S:        Search case insensitively if the pattern is all lowercase
		call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
		
		" Recommended defaults for ripgrep via Denite docs
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])
		
		" Remove date from buffer list
		call denite#custom#var('buffer', 'date_format', '')
		
		" Custom options for Denite
		"   auto_resize             - Auto resize the Denite window height automatically.
		"   prompt                  - Customize denite prompt
		"   direction               - Specify Denite window direction as directly below current pane
		"   winminheight            - Specify min height for Denite window
		"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
		"   prompt_highlight        - Specify color of prompt
		"   highlight_matched_char  - Matched characters highlight
		"   highlight_matched_range - matched range highlight
		"
		
		let s:denite_options = {
		      \ 'prompt' : '>',
		      \ 'split': 'floating',
		      \ 'start_filter': 1,
		      \ 'auto_resize': 1,
		      \ 'source_names': 'short',
		      \ 'direction': 'botright',
		      \ 'highlight_filter_background': 'CursorLine',
		      \ 'highlight_matched_char': 'Type',
		      \ }

		" Loop through denite options and enable them
		function! s:profile(opts) abort
		  for l:fname in keys(a:opts)
		    for l:dopt in keys(a:opts[l:fname])
		      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
		    endfor
		  endfor
		endfunction
		
		call s:profile(s:denite_options)
		catch
		  echo 'Denite not installed. It should work after running :PlugInstall'
		endtry

	"Floaterm configs
		let g:floaterm_wintype = 'popup'
    let g:floaterm_keymap_kill = '<Esc>'
    let g:floaterm_keymap_toggle = '<C-t>'
    let g:floaterm_keymap_new = '<C-n>'

    let g:floaterm_keymap_prev = '<C-k>'
    let g:floaterm_keymap_next = '<C-j>'
    ""let g:floaterm_keymap_hide = '<C-m>'
    ""let g:floaterm_keymap_show = '<C-n>'
"}}}

syntax on
colorscheme forest-night
""syntax enable
""set background=light
""colorscheme solarized

filetype off                 " required
filetype plugin indent on    " required

augroup lightlineCustom
    autocmd!
    autocmd BufWritePost * call lightline#update()
augroup END

"Prevent backups when editing system files
au BufWrite /private/tmp/crontab.* set nowritebackup
au BufWrite /private/etc/pw.* set nowritebackup
