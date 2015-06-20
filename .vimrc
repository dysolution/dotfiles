" We use a vim
set nocompatible
"
" Colo(u)red or not colo(u)red
" If you want color you should set this to true
"
set hlsearch
let color = "true"

if has("syntax")
    if color == "true"
        autocmd BufEnter * :syntax sync fromstart
        " This will switch colors ON
        so ${VIMRUNTIME}/syntax/syntax.vim
    else
        " this switches colors OFF
        syntax off
        set t_Co=0
    endif
endif
" change colorscheme from default to vividchalk
colorscheme vividchalk

" display the match for a search pattern when halfway typing it
set incsearch

" create a command which toggles highlighted searches on/off
map <F5> :let &hlsearch=!&hlsearch<CR>

" turn on filetype detection
filetype plugin indent on

" display tab characters and end-of-line whitespace
" (unfortunately, the list option is mutually exlusive with
" the linebreak option; it's one or the other!)
"set list
"set listchars=tab:>-,trail:-

" highlight when braces and parens match
set showmatch
set matchtime=2 " default time of 5 tenths of a second too long

" allow backspace to delete characters before the cursor
" the 3 options tell vim to delete white space at start of the line,
" a line break, and the character before where Insert mode started
set backspace=indent,eol,start

" tell vim to repeat indent of previous line
set autoindent

" keep 50 commands and 50 search patterns in the history
set history=1000

" only keep 100 levels of undo
set undolevels=100

" always display the current cursor position in the lower right corner
set ruler

" display incomplete commands in the lower right corner as they are being typed
set showcmd

" map the Q key to the gq command
map Q gq

" a complicated keymapping:
" make "p" in visual mode overwrite the selected text with the previously
" yanked text
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" map the up and down keys so that they work like I'm used to,
" where going up goes up 1 visual line (not necessarily one line of text)
" and going down goes down 1 visual line (not necessarily one lineof text)
"map k gk
"map j gj
map <Up> gk
map <Down> gj

" break lines longer than 78 characters, but only for text files
"autocmd FileType text setlocal textwidth=78

" set wordwrap on and don't allow words to break
set wrap
set linebreak

" set tabs to be equivalent to 4 characters instead of 8 (the default)
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab

" always indent to multiples of the shiftwidth
set shiftround

" show partial last lines at bottom of screen
set display=lastline

" allow cursor keys to move from line to line when going from left to right,
" regardless of whether in or not in insert mode
set whichwrap=b,s,h,l,<,>,[,]

" autocommand: after a file is read, check if the '" mark is defined, and
" jump to it if so; backslashes are used to continue single command lines
" (can only be used in a vim script file, not on the vim command line)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line ("$") |
            \   exe "normal g'\"" |
            \ endif

" allow buffer to be modified by filter commands
set modifiable

" easier access to buffers
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" create command shortcut "Zap" to zap.py script
com -nargs=* -range=% -bar Zap %!zap.py <args> -

" file format detection and interpretation!
set fileformats=unix,dos,mac

" force saves in particular file formats
com Wmac set fileformat=mac | write
com Wdos set fileformat=dos | write
com Wunix set fileformat=unix | write

" confirm operations that would erase unsaved buffer changes
set confirm

" set up default printing options
set printoptions=paper:letter,duplex:off,number:y

" set filebrowser
" the following setting limits tab completion to longest it can find based on
" what you've already typed in; sometimes useful, other times annoying; YMMV
"set wildmode=longest:full
set wildmenu

" use the visualbell instead of the beep on errors
set visualbell

" show line numbers
set number

" highlight the 81st column to visually mark an 80-character line width
set colorcolumn=81

" window resizing
" nmap = :resize +1<CR>
" nmap - :resize -1<CR>
" nmap ] :vertical resize +1<CR>
" nmap [ :vertical resize -1<CR>

" window focusing
nmap <S-Left> <C-w><Left>
nmap <S-Right> <C-w><Right>
nmap <S-Up> <C-w><Up>
nmap <S-Down> <C-w><Down>

" NERDTreeToggle
nmap <C-t> :NERDTreeToggle<CR>

" preserve buffer history when switching
set hidden

" automatically format (indent) xml, html
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
au FileType html exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" format (indent) json
nmap <C-j> :%!python -m json.tool<CR>
vmap <Leader>j :!python -m json.tool<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

execute pathogen#infect()

" display current git branch on statusline
set statusline=%{fugitive#statusline()}

" ~/.vimrc ends here
