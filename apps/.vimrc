set nomodeline
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

set guioptions-=T
set foldmethod=marker

set undodir=~/.vim/undo

set spell
set spell spelllang=en_us
set complete+=kspell
set dictionary+=/usr/share/dict/american-english

set wrap nows ai ic scs linebreak display+=lastline,uhex tabstop=4 softtabstop=2 shiftwidth=2 expandtab nobackup
colorscheme pablo
colorscheme default
map <down> gj
map <up> gk
imap <down> <esc>lgji
imap <up> <esc>lgki

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

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

" Pathogen
execute pathogen#infect()

