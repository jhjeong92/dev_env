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
"if has('gui_running')
"	set background=light
"else
"	set background=dark
"endif
"colorscheme solarized
colorscheme railscasts

set cursorline
hi CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE guibg=darkred guifg=white

set ts=4
set sw=4
set hlsearch
set cindent
set ai
set smartindent
set autoread
set laststatus=2
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set ruler

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