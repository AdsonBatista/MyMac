"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"


" Be iMproved
set nocompatible
set nowritebackup
set nobackup


"dois ii vai direito para modo de comando
imap ii <C-[>


if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required
    Plugin 'mcchrish/nnn.vim'
    Plugin 'jeffkreeftmeijer/vim-numbertoggle'

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    "Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
    Plugin 'junegunn/fzf.vim'
    Plugin 'junegunn/fzf'
    Plugin 'luochen1990/rainbow'
    let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
    "Plugin 'easymotion/vim-easymotion'
    "Plugin 'Chiel92/vim-autoformat'
    "noremap <F3> :Autoformat<CR>
    "Plugin 'jiangmiao/auto-pairs'
    "-------------------=== Other ===-------------------------------
    Plugin 'itchyny/lightline.vim'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'ntpeters/vim-better-whitespace'
    "Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    "Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    "Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
    " Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    " Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    "Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'airblade/vim-gitgutter'
    "Plugin 'yggdroot/indentlinel'
    "let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    "-------------------=== Snippets support ===--------------------
    "Plugin 'garbas/vim-snipmate'                " Snippets manager
    "Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    "Plugin 'tomtom/tlib_vim'                    " dependencies #2
    "Plugin 'honza/vim-snippets'                 " snippets repo
    "-------------------=== Languages support ===-------------------
    "Plugin 'tpope/vim-commentary'               " Comment stuff out
    "Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    "Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
    "Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin

    "-------------------=== Python  ===-----------------------------
    Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
    Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
    Plugin 'dense-analysis/ale'
    Plugin 'nvie/vim-flake8'


call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme badwolf
"colorscheme gruvbox                    " set color scheme
set background=dark

"set number                                  " show line numbers
:set number relativenumber

:augroup numbertoggle
  :autocmd!
  :autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  :autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END


set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8                             " utf-8 by default

set nobackup                              " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile                              " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Additional mappings for Esc (useful for MacBook with touch bar)
inoremap jj <Esc>
inoremap jk <Esc>

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
"nmap <F9> :bprev<CR>
"nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch                             " incremental search
set hlsearch                              " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
"let g:airline_theme='badwolf'
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#formatter='unique_tail'
"let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=35
autocmd BufEnter *.py :call tagbar#autoopen(0)

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
"let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================

let g:syntastic_python_python_exec='python'

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

"" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

" YouCompleteMe
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => vim-multiple-cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
"
" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

au Filetype python map <F5> :w<CR>:!python3<space><C-r>%<CR>
au Filetype rmd map <F5> :w<CR>:!echo<space>"require(rmarkdown);<space>render('<C-r>%')"<space>\|<space>R<space>--vanilla<CR>
au Filetype c map <F5> :w<CR>:!gcc<space><C-r>%<CR>:!./<C-r>%<backspace><backspace><CR>
au Filetype tex map <F5> :w<CR>:!pdflatex<space><C-r>%<CR>:!bibtex<space>%:r.aux<CR>:!pdflatex<space><C-r>%<CR>:!pdflatex<space><C-r>%<CR>

" remapping of keys
map <Space> <Leader>
vnoremap y "+y
vnoremap p "+p
vnoremap P "+P
vnoremap x "+x
nnoremap y "+y
nnoremap p "+p
nnoremap P "+P
nnoremap x "+x
nnoremap K i<CR><Esc>
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-j> :e#<CR>
nnoremap <C-k> :e#<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>n <C-w>v<C-w>l
nnoremap <leader><tab> :NERDTreeToggle<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>, :StripWhitespace<CR>
nnoremap <leader><leader> :noh<cr>
