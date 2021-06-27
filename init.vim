"vim-plug
call plug#begin('~/.local/share/nvim/plugged')

"Everyday
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
:set spelllang=en_us,pl
:set spell
":match MatchParen '\%>80v.\+'
"Automatically break lines at 80 chars
":set tw=80
autocmd Filetype py match :set tw=120
:set fo+=t
"Expand tabs
:set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab tw=79
" Copy to and from system clipboard by default
:set clipboard^=unnamedplus

" Show trailing whitespace
" :set list listchars=trail:·

"Highlight words on double clicking
:noremap <2-LeftMouse> * <c-o>
:inoremap <2-LeftMouse> <c-[>* <c-o> i

"Fileview
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Completion
" Brackets
Plug 'cohama/lexima.vim'

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
let g:ycm_server_python_interpreter = 'python'
let g:ycm_always_populate_location_list = 1
"let g:ycm_clangd_binary_path = "/usr/bin/clangd"
let g:ycm_clangd_args = ['-cross-file-rename']
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<TAB>']
" https://vi.stackexchange.com/questions/13795/how-to-see-a-whole-message-in-status-bar-in-vim
Plug 'Valloric/ListToggle'

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter RefactorRename 
nnoremap <leader><leader> :YcmCompleter GoToReferences<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger='<leader><TAB>'
let g:UltiSnipsJumpForwardTrigger='<TAB>'
let g:UltiSnipsJumpBackwardTrigger="<s-TAB>"

"Python
Plug 'davidhalter/jedi-vim'
autocmd Filetype py match MatchParen '\%>79v.\+'

"C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
autocmd Filetype cpp let g:clang_format#style_options = { "BasedOnStyle" : "Google"}
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format_on_insert_leave=1

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"UML
Plug 'aklt/plantuml-syntax'
call plug#end()

" Flex and bison syntax highlighting
Plug 'calincru/flex-bison-syntax'

" Inside terminal-mode
:tnoremap <C-[> <C-\><C-n>
:autocmd TermOpen :set nonumber

" All the other stuff
set number
"YCM overrides menu with menuone
"set completeopt=preview,menu,longest

set mouse=a
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

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
