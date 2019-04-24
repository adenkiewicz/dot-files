" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nowrap
set term=xterm-256color

filetype off " for now, Vundle requires it
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" YouCompleteMe is a bit too heavy to keep in git repo, install it yourself
" Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rhysd/vim-clang-format'
Plugin 'nvie/vim-flake8'
call vundle#end()

" now turn on filetype on again
filetype on

syntax on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup 
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number

" Don't use Ex mode, use Q for formatting
map Q gq

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" * Text Formatting -- Specific File Formats
"
" " enable filetype detection:
filetype on
set shiftwidth=3
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=syntax
set foldlevel=0
set foldnestmax=1

" s///g; as default
set gdefault

set autochdir " chdir to where edited file is

" set up tags
set tags=./tags;/

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1

nmap <silent> <C-t> :tabnew<CR>
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>

" start NERDtree if no file provided
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" TagBar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTree<CR>

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" type ':set list' to start showing these

colorscheme desert
set t_Co=256
let g:airline_theme='kolor'
set laststatus=2 
hi ColorColumn ctermbg=LightYellow guibg=LightYellow
let &colorcolumn="80,".join(range(120,999),",") " color 80th column and 120+

" various highlights
" tabs first
hi TabLine ctermfg=White ctermbg=Black
hi TabLineSel ctermfg=Black ctermbg=DarkGreen

au BufRead,BufNewFile *.doxygen set syntax=doxygen

" clang-format plugin configuration
" 'f' in Visual Mode will reformat selected code
xmap f :ClangFormat<CR>
let g:clang_format#detect_style_file = 1
let g:clang_format#code_style = 'mozilla'
" Customization based on:
" https://clang.llvm.org/docs/ClangFormatStyleOptions.html
let g:clang_format#style_options = {
    \ "AccessModifierOffset" : -4,
    \ "AllowShortFunctionsOnASingleLine": "None",
    \ "AlwaysBreakTemplateDeclarations" : "true",
    \ "BreakBeforeBraces" : "Attach",
    \ "DerivePointerAlignment": "true",
    \ "IndentWidth": 3,
    \ "NamespaceIndentation": "All",
    \ "Standard" : "C++11", }

" vim-flake8 plugin configuration
" temporary: remap from F7 to F3 (FIXME)
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_error_marker='EE'
let g:flake8_warning_marker='WW'
" run Flake8() every time python file is saved /** EXPERIMENTAL **/
autocmd BufWritePost *.py call Flake8()

" custom templates
command LoadPwnTemplate :0r ~/.vim/templates/pwn.py

" enable spellcheck for text files
autocmd FileType markdown,md,tex,latex setlocal spell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
