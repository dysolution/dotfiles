" We use a vim
set nocompatible

" set tabs to be equivalent to 4 characters instead of 8 (the default)
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab

let mapleader=","
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap gd :GoDef<CR>

nnoremap <leader><leader> <c-^>
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

" display the match for a search pattern when halfway typing it
set incsearch
" case-insensitive search
set ignorecase
set smartcase


" create a command which toggles highlighted searches on/off
map <F5> :let &hlsearch=!&hlsearch<CR>

" display tab characters and end-of-line whitespace
" (unfortunately, the list option is mutually exlusive with
" the linebreak option; it's one or the other!)
"set list
"set listchars=tab:>-,trail:-

" highlight when braces and parens match
set showmatch
set matchtime=1 " default time of 5 tenths of a second too long

" allow backspace to delete characters before the cursor
" the 3 options tell vim to delete white space at start of the line,
" a line break, and the character before where Insert mode started
set backspace=indent,eol,start

" tell vim to repeat indent of previous line
set autoindent

" keep 50 commands and 50 search patterns in the history
set history=1000

" keep 1000 levels of undo
set undolevels=1000

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
" autocmd FileType text setlocal textwidth=78

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=8
set winminheight=8
set winheight=999

" AsciiDoc filetype
autocmd BufNewFile,BufRead *.{ad,adoc,asciidoc} set filetype=asciidoc
autocmd FileType asciidoc setlocal nolist autoindent

" C# filetype
autocmd BufNewFile,BufRead *.s set formatprg=astyle\ -T4pb

" Golang filetype
autocmd BufNewFile,BufRead *.go set filetype=go

" YAML filetype
autocmd BufNewFile,BufReadPost,BufRead *.{yaml,yml,.yml.src} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" set wordwrap on and don't allow words to break
set wrap
set linebreak

autocmd FileType go setlocal tabstop=8

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

" file format detection and interpretation!
set fileformats=unix,dos,mac

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
set colorcolumn=80

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

" preserve buffer history when switching
set hidden

" automatically format (indent) xml, html
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
" au FileType html exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" format (indent) json
" autocmd FileType json autocmd BufWritePre <buffer> :%!jq '.'
" nmap <C-j> :%!python -m json.tool<CR>
" vmap <Leader>j :!python -m json.tool<CR>


autocmd FileType python setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2

autocmd FileType cs setlocal expandtab softtabstop=4 shiftwidth=4 tabstop=4


" CtrlP
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ''

set path=$PWD/**

execute pathogen#infect()
syntax enable
" turn on filetype detection
filetype plugin indent on


" git commit auto-wrap at 72 columns
au FileType gitcommit set tw=72
" when git committing, show a guide to help keep commit messages to 72 columns
au FileType gitcommit set colorcolumn=72

" Ruby
let g:ruby_indent_assignment_style = 'variable'
"
" display current git branch on statusline
set statusline=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4
let g:syntastic_html_checkers=['']
let g:airline_powerline_fonts = 1
let g:syntastic_python_checkers = ['pylint']

" Elm
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_setup_keybindings = 1
let g:elm_syntastic_show_warnings = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" gopls
let g:go_def_mode='gopls'

" vim-go
let g:go_def_mapping_enabled = 0
" let g:go_def_mode = "godef"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_list_type = "quickfix"
let g:hybrid_use_Xresources = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:go_metalinter_autosave = 1

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1


let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" let g:go_bin_path = "/usr/local/bin/go"
set autowrite

" set cursorcolumn
" set cursorline

" set relativenumber

" disable swap file
set noswapfile
set nobackup

" cd to the dir of the currently-open file
" set autochdir

" NERDTreeToggle
nmap <C-t> :NERDTreeToggle<CR>

" vim-flog
" :silent exe "g:flog_enable"

" neocomplete
" let g:neocomplete#enable_at_startup = 1

autocmd FileType tf setlocal shiftwidth=2 tabstop=2
let g:terraform_align=1

" Ack / ag (The Silver Searcher)
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" vim-plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'elmcast/elm-vim'
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Coc intellisense engine
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" fzf
set rtp+=/usr/local/opt/fzf
nmap <C-p> :Files<CR>

" save and restore folds upon reopening
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Ale
let g:ale_lint_on_text_change = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {
  \ 'ruby': ['rubocop'],
  \ }
"  \ 'javascript': [],
" \ 'ruby': ['rubocop'],
" \ 'ruby': [],
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier_standard'],
      \ }
" let g:ale_fix_on_save = 1

set tags=./tags;

"netrw
" let g:netrw_banner = 2

" Reset syntastic highlighting
highlight clear SpellBad
highlight clear SpellCap
highlight SpellBad cterm=bold
highlight SpellCap cterm=bold

" Allow long linter suggestions to wrap to a second line
set cmdheight=2

" Conquer of Completion
nmap <silent> gd <Plug>(coc-definition)

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ~/.vimrc ends here
