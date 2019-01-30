" To see the VIM run-time directory, use :echo $VIMRUNTIME inside VIM.

" run pathogen
" we need filetype to be off for this part of the file, so it is first
filetype off
call pathogen#infect()

" set the encoding
set encoding=utf-8

" show coords of cursor in the status bar
set ruler
syntax on                           " syntax highlighing
autocmd BufRead,BufNewFile *.md set syntax=off " turn it off for markdown files, since it works poorly
filetype on                          " try to detect filetypes
filetype plugin on
filetype plugin indent on    " enable loading indent file for filetype

" html, css, js indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

" c
autocmd FileType c setlocal shiftwidth=2 tabstop=2

" highlight the current line and column
" turn off cursorline for text and markdown, as it impedes reading!
set cursorline
autocmd BufEnter,BufRead,BufNewFile *.md setlocal nocursorline
autocmd BufEnter,BufRead,BufNewFile *.txt setlocal nocursorline
autocmd BufEnter,BufRead,BufNewFile *.tex setlocal nocursorline

" can exit insert mode without leaving the 'home row' of the keyboard
imap jk <Esc>
" make the spacebar good for something
map <space> :

" split navigations: e.g. Ctrl-J to move to the split below
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split maximisation toggle Ctrl-W o
nnoremap <C-W>o :call MaximizeToggle()<CR>
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" make it apparent which of several splits is the active one
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

" mapping to run flake8 against current buffer
autocmd FileType python map <buffer> <F7> :call Flake8()<CR>

" set number of lines to maintain between cursor and top/bottom of window
set scrolloff=5

"standardise the colour scheme
colorscheme elflord

" PHP files use four space indentation
autocmd FileType php setlocal sts=4 ts=4 sw=4 expandtab

" C++ files use four space indentation
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 expandtab

" don't use a background color when highlighting matching parantheses, since
" otherwise it's hard to see where the cursor is
hi MatchParen cterm=none ctermbg=none ctermfg=green

" shortcuts for inserting and deleting blank lines
" Ctrl-j/k inserts blank lines below/above.
" FIXME we already use these key combinations for window navigation
"nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
