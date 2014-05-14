" Vim config
" @author Likeyn

"" Basic options
set nocompatible " No compatibility with legacy vi
set encoding=utf-8 " Sets the character encoding used inside Vim
set ruler " Show line numbers
set number " Show line numbers
set showcmd " Display incomplete commands
set wildmenu " Show the completion list
syntax enable " Enable syntax highlighting
set laststatus=2 " Always show the status line
set showtabline=2 " Always show the tabs line
set display+=lastline " Show as much as possible of the last line instead of @ chars
filetype plugin indent on " Load file type plugins + indentation
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
	set t_Co=16
endif
silent! colorscheme jellybeans " No error if colorscheme doesn't exist

"" Whitespace
"set nowrap " Don't wrap lines
set smarttab " Insert and delete a shiftwidth worth of space
set textwidth=0 " Don't limit text width
set tabstop=2 shiftwidth=2 expandtab " A tab is two spaces
set list " Show whitespace chars using the listchars below
set listchars=eol:¶,tab:›·,trail:~,extends:>,precedes:<,nbsp:_
set backspace=indent,eol,start " Backspace through everything in insert mode

"" Searching
set hlsearch " Highlight matches
set incsearch " Incremental searching
set ignorecase " Searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

"" File searching
set path+=** " Allow recursive searching in subfolders
set suffixesadd+=.sh,.py,.php,.class.php,.js,.yml " File suffixes
" Use 'ack' as grepprg if exists
if executable('ack')
	set grepprg=ack
elseif executable('ack-grep')
	set grepprg=ack-grep
endif

"" Code options
" let php_folding=1
let php_sql_query=1
set autoindent smartindent " Autoindentation behavior
" Prevent '#' comments to be unindented (:help 'smartindent')
inoremap # X#

"" Plugins
execute pathogen#infect()
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

"" Commands & aliases
cmap !g !git
cmap !sf !./symfony
cmap !scc !./symfony cc
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
