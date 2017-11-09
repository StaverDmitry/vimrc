set number
set numberwidth=2
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'danchoi/ri.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim.git'
Plugin 'twe4ked/vim-colorscheme-switcher'
Plugin 'ctrlpvim/ctrlp.vim' 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/vim-scripts/ScrollColors'
Plugin 'https://github.com/kassio/neoterm.git'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'git://github.com/jiangmiao/auto-pairs.git'
Plugin 'scrooloose/nerdtree'
Plugin 'git@github.com:szw/vim-tags.git'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'danro/rename.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ervandew/supertab'
Plugin 'lucapette/vim-ruby-doc'
call vundle#end()            " required

"" 23 212 carvedwood
""colorscheme carvedwood
let g:airline_theme='wombat'
"" SuperTab change direction
let g:SuperTabDefaultCompletionType = "<c-n>"

filetype plugin indent on    " required

syntax enable
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set splitright
set nosplitbelow


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" BEGIN save vim session on exit "
"function! MakeSession()
  "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  "if (filewritable(b:sessiondir) != 2)
    "exe 'silent !mkdir -p ' b:sessiondir
    "redraw!
  "endif
  "let b:filename = b:sessiondir . '/session.vim'
  "exe "mksession! " . b:filename
"endfunction
"
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()
"" END save VIM session on exit "


" BEGIN  save on ctrl + s start   
command! -nargs=0 -bar GUpdate if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>GUpdate<CR>
" END SAVE ON CTRL + S  


"" Open rails file in vertical split
nmap <C-w>F <C-w>f<C-w>L


"" LEADER
let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>
"" Nerdtree
map <C-b> :NERDTreeToggle .<CR> 
"" CtrlP clear cache"
nnoremap <C-M-p> :ClearCtrlPCache<CR>
"" Toggle terminal
""nnoremap <silent><C-t> :call InitTerm()<CR>
""tnoremap <silent><C-t> <C-\><C-n>:Ttoggle<CR> 
"" copy paste to clipboard
vmap <Leader>y "+y
vmap <Leader>d "*d
vmap <Leader>p "*p
nmap <Leader>p "*p
nmap <Leader>P "*P
"" insert binding.pry
nmap <Leader>o obinding.pry<esc>k^
nmap <Leader>O kobinding.pry<esc>j^
"" copy inside double quotes
nmap Y vi"y
"" search for the current word
nmap <M-/> viw"sy/<c-r>s<CR>
"" paste in insert mode"
imap <C-V> <C-R>"
"" newlines in insert mode
imap <S-CR> <Up><End><CR>
imap <C-CR> <End><CR>
"" substitude word with yanked"
nmap <M-s> viw"0p
"" yank current word
nmap <M-a> viwy
"" change current word
nmap <M-c> viwc
"" delete current word
nmap <M-d> viwd
"" $ to the EOL without newline_char
vnoremap $ $h
"" TODO разобраться зачем я это делал  Change tabs 
map  <Leader>x :call GoToLastWindow()<CR>  
"" Silversearcher 
nnoremap <silent> <Leader>f :Ack<space>""<left>
"" Window motions
nnoremap <A-h> <C-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
"" Tab motions
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
""Move horizontally
nmap ZL z20l
nmap ZH z20h
"" delete line without yanking"
nnoremap <Leader>d "_dd
nnoremap <Leader>x "_x
vnoremap <Leader>d "_dd
vnoremap <Leader>x "_x
"" remove Ex mode "
nnoremap Q <nop>
"" Delete trailing spaces
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
""Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"" Remove highliting after search
nmap <silent> <leader>h :noh<cr><esc>
nmap <silent> <leader>j :noh<cr><esc>
nmap <silent> <leader>k :noh<cr><esc>
nmap <silent> <leader>l :noh<cr><esc>

"" Change active window to the lowest
function! GoToLastWindow()
  let lastWindow = winnr("$")
  exe winnr('$') 'wincmd w'
endfunction
