" https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim?rq=1
" sudo apt install vim-gtk3

set nomodeline
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

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

" Spelling
set spell
set spell spelllang=en_us
set complete+=kspell
set dictionary+=/usr/share/dict/american-english

set wrap           " Break lines at window width
set linebreak      " Don't split words across lines
"set showbreak=\|_\ " String to put at the start of wrapped lines
set autoindent     " Copy indent from current line when starting a new line
set shiftwidth=2   " Number of spaces to use for each step of (auto)indent

set nowrapscan     " Searches wrap around the end of the file
set ignorecase     " Ignore case in patterns
set smartcase      " Override 'ignorecase' when pattern has uppercase characters

set tabstop=8      " # of spaces a <Tab> in the file counts for
set softtabstop=2  " # of spaces a <Tab> counts for while editing
set expandtab      " Use the appropriate number of spaces to insert a <Tab>
set display+=lastline,uhex

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

" vim-pandoc
let vim_pandoc_syntax_exists = 1

" For DataCamp exercise files
runtime plugin/highlights.vim
if !exists(':Highlight')
  echo "Sorry some initializations will be ignored as Highlight is nowhere to be found"
else
  Highlight 4 \*\*\* =hint
  Highlight 5 \*\*\* =solution
  Highlight 4 \*\*\* =instructions
  Highlight 7 VideoExercise
  Highlight 8 NormalExercise
  Highlight 9 MultipleChoiceExercise
endif

" Markdown syntax highlighting
au BufRead,BufNewFile *.md set filetype=markdown
" Pandoc code block folding
let g:pandoc#folding#fold_fenced_codeclocks = 1

" better whitespace
let better_whitespace_skip_empty_lines=1
let better_whitespace_skip_comment_lines=1
let strip_only_modified_lines=1
let strip_whitelines_at_eof=1

" https://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git
" Show trailing white pace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
