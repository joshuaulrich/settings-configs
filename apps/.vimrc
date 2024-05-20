" https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim?rq=1
" sudo apt install vim-gtk3

set nomodeline
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim

set guioptions-=T " No toolbar
set guioptions-=m " No menu bar
set guioptions-=r " No right scroll bar

set foldmethod=marker
set foldmarker={{{,}}}
set foldlevelstart=10

set nobackup      " No backup file (*.ext~)
" Put undo files here, so they don't clutter working directory
set undodir=~/.vim/undo
" Ensure undo directory exists
silent !mkdir ~/.vim/undo > /dev/null 2>&1

" copy to Shift+Ins
vmap <S-y> "+y
" copy to middle-click
"vmap <S-y> "*y
"vmap <C-x> "*d
"vmap <C-v> c<ESC>"*p
"imap <C-v> <ESC>"*pa

" Spelling
set nospell
augroup mdSpell
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
augroup END
augroup txtSpell
    autocmd!
    autocmd FileType text setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
augroup END
set complete+=kspell
set dictionary+=/usr/share/dict/american-english

set wrap           " Break lines at window width
set linebreak      " Don't split words across lines
"set showbreak=\|_\ " String to put at the start of wrapped lines
set autoindent     " Copy indent from current line when starting a new line
set shiftwidth=4   " Number of spaces to use for each step of (auto)indent

set nowrapscan     " Searches wrap around the end of the file
set ignorecase     " Ignore case in patterns
set smartcase      " Override 'ignorecase' when pattern has uppercase characters

set tabstop=8      " # of spaces a <Tab> in the file counts for
set softtabstop=2  " # of spaces a <Tab> counts for while editing
set expandtab      " Use the appropriate number of spaces to insert a <Tab>
set display+=lastline,uhex

" resize splits and highlight copy
set mouse=n

" southernlights colorscheme
" mkdir -p ~/.vim/colors
" wget https://raw.githubusercontent.com/jalvesaq/southernlights/master/colors/southernlights.vim -O ~/.vim/colors/southernlights.vim
colorscheme southernlights

map <down> gj
map <up> gk
imap <down> <esc>lgji
imap <up> <esc>lgki

" Pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on
" install pathogen plugins via:
" VIM_PLUGIN='vim-sensible' \
" PLUGIN_REPO=https://github.com/tpope/${VIM_PLUGIN}.git \
" && git clone ${PLUGIN_REPO} ~/.vim/bundle/${VIM_PLUGIN}

" ----------------------------------------------------------------------
" Nvim
"
" (other settings in ~/.Rprofile)
" https://github.com/jamespeapen/Nvim-R/wiki/options#disable-nvim-r-commands
"let R_external_term = 1 " Run R in an external terminal (or Rgui.exe)
"let R_external_term = 'xterm' " Run R in in xterm
let R_app = "/home/josh/.local/bin/radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

" don't replace "_" with "<-", ever
let R_assign = 0

" Change Leader and LocalLeader keys:
let maplocalleader = ','
"let mapleader = ';'

" Use Ctrl+Space to do omni completion:
if has('nvim') || has('gui_running')
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" Press Space to send lines and selection to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" ----------------------------------------------------------------------

" split navigation
" resize splits: https://vi.stackexchange.com/questions/16984/
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map jk to Esc
imap jk <Esc>

" vim built-in R syntax
let r_indent_align_args = 1
let r_indent_ess_compatible = 1

" Nvim-R
let R_assign = 0
"let maplocalleader = ","
"let r_syntax_folding = 1

let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

" vim-pandoc (clone these into ~/.vim/bundle)
" https://github.com/vim-pandoc/vim-pandoc
" https://github.com/vim-pandoc/vim-pandoc-syntax
let vim_pandoc_syntax_exists = 1

" For DataCamp exercise files
"runtime plugin/highlights.vim
"if !exists(':Highlight')
"  echo "Sorry some initializations will be ignored as Highlight is nowhere to be found"
"else
"  Highlight 4 \*\*\* =hint
"  Highlight 5 \*\*\* =solution
"  Highlight 4 \*\*\* =instructions
"  Highlight 7 VideoExercise
"  Highlight 8 NormalExercise
"  Highlight 9 MultipleChoiceExercise
"endif

" Markdown syntax highlighting
au BufRead,BufNewFile *.md set filetype=markdown
" https://github.com/preservim/vim-markdown (clone into ~/.vim/bundle)
let g:vim_markdown_fenced_languages = ['r', 'html', 'python', 'bash=sh']
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0

" Pandoc code block folding
let g:pandoc#folding#fold_fenced_codeclocks = 1

" better whitespace
" https://github.com/ntpeters/vim-better-whitespace (clone into ~/.vim/bundle)
let better_whitespace_skip_empty_lines=1
let better_whitespace_skip_comment_lines=1
let strip_only_modified_lines=1
let strip_whitelines_at_eof=1

" https://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git
" Show trailing white pace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:autocmd InsertLeave * match ExtraWhitespace /\s\+$/
