"vim-plug
call plug#begin('~/.local/share/nvim/plugged')

"Everyday
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
:match MatchParen '\%>79v.\+'

"Fileview
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Completion
Plug 'cohama/lexima.vim'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
let g:ycm_server_python_interpreter = 'python'
"let g:ycm_clangd_binary_path = "/usr/bin/clangd"
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

"Rust
autocmd Filetype rs set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab

"Python
Plug 'davidhalter/jedi-vim'
autocmd Filetype py match MatchParen '\%>79v.\+'
autocmd Filetype py set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

"C++
Plug 'octol/vim-cpp-enhanced-highlight'
autocmd Filetype cpp match MatchParen '\%>79v.\+'
autocmd Filetype cpp set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
autocmd Filetype hpp set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
Plug 'rhysd/vim-clang-format'
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format_on_insert_leave=1
autocmd Filetype cpp let g:clang_format#style_options = { "BasedOnStyle" : "Google"}

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"UML
Plug 'aklt/plantuml-syntax'
call plug#end()

" Inside terminal-mode
:tnoremap <C-[> <C-\><C-n>
:autocmd TermOpen :set nonumber

" All the other stuff
set number
set completeopt=preview,menu,longest
set shiftwidth=4
set mouse=a
set textwidth=0 
set wrapmargin=0
set nowrap
:colorscheme delek

" lightline
set noshowmode
let g:lightline = {
	    \ 'active': {
	    \   'left': [ [ 'mode' ],
	    \             [ 'relativepath', 'modified' ] ],
	    \ 'right': [ ]
	    \ },
	    \ 'inactive': {
	    \ 'left': [ ['filename'] ],
	    \ 'right': []
	    \},
	    \ 'component_function': {
	    \ },
	    \ 'mode_map': {
	    \ 'n' : 'NORMALNY',
	    \ 'i' : 'WPROWADZANIE',
	    \ 'R' : 'ZAMIANA',
	    \ 'v' : 'VIZUALNY',
	    \ 'V' : 'VIZUALNY-LINIOWY',
	    \ "\<C-v>": 'VIZUALNY-BLOKOWY',
	    \ 'c' : 'POLECENIE',
	    \ 's' : 'WYBÓR',
	    \ 'S' : 'S-LINIOWY',
	    \ "\<C-s>": 'S-BLOKOWY',
	    \ 't': 'TERMINAL',
	    \}
	    \ }


