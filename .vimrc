execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

if $TERM == "xterm-256color"
	set t_Co=256
endif

let g:solarized_bold = 0
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme railscasts

let g:ConqueTerm_FastMode = 1
set ts=4
set sw=4
set hlsearch
set cindent
set ai
set smartindent
set autoread
set laststatus=2
set backspace=2
set backspace=indent,eol,start
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:loaded_youcompleteme = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_no_default_include_dirs=1
let g:syntastic_cpp_no_default_include_dirs=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501'

set ruler

map <F1> :ConqueTermVSplit bash<CR>
imap <F1> <ESC>:ConqueTermVSplit bash<CR>
map <F2> :ConqueTermSplit bash<CR>
imap <F2> <ESC>:ConqueTermSplit bash<CR>
map <F3> :ConqueGdbVSplit 
imap <F3> <ESC>:ConqueGdbVSplit 
map <F4> :ConqueGdbSplit 
imap <F4> :ConqueGdbSplit 
map <F5> :NERDTree<CR>
imap <F5> <ESC>:NERDTree<CR>
map <F6> :NERDTreeClose<CR>
imap <F6> <ESC>:NERDTreeClose<CR>
map <F7> :SyntasticCheck<CR>
imap <F7> <ESC>:SyntasticCheck<CR>
map <F8> :SyntasticReset<CR>
imap <F8> <ESC>:SyntasticReset<CR>
map <F9> :resize +1<CR>
imap <F9> <ESC>:resize +1<CR>
map <F10> :resize -1<CR>
imap <F10> <ESC>:resize -1<CR>
map <F11> :vertical resize +1<CR>
imap <F11> <ESC>:vertical resize +1<CR>
map <F12> :vertical resize -1<CR>
imap <F12> <ESC>:vertical resize -1<CR>

au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set tags=./tags,tags;$HOME

set csprg=/usr/bin/cscope 
set csto=0 
set cst 

function! LoadCscope()  
	let db = findfile("cscope.out", ".;")  
if (!empty(db))  
	let path = strpart(db, 0, match(db, "/cscope.out$"))  
	set nocscopeverbose " suppress 'duplicate connection' error  
	exe "cs add " . db . " " . path  
	set cscopeverbose  
	endif  
	endfunction  
	au BufEnter /* call LoadCscope() 

				   "set nocsverb 
				   "if filereadable("cscope.out")
				   "	cs add cscope.out  
				   "elseif $CSCOPE_DB != ""
				   "	cs add $CSCOPE_DB
				   "endif
				   "set csverb
