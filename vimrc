
""""""""""""""""""""""""Begin Vundle"""""""""""""""""
" Required Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle - package manager
Plugin 'VundleVim/Vundle.vim'
" NERDTree - file browser
Plugin 'scrooloose/nerdtree.git'
" ctrlp - fuzzy file finder
Plugin 'kien/ctrlp.vim'
"matchit - makes % powerful
Plugin 'tmhedberg/matchit.git'
" tComment - smart commenting
Plugin 'vim-scripts/tComment'
" easymotion - fast movemenet
Plugin 'Lokaltog/vim-easymotion'
"surround - bracket replacement
Plugin 'tpope/vim-surround'
"Autocompletion
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
"Snippets
" Plugin 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
" Auto-resize splits
" Bundle 'roman/golden-ratio'
" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Statusline
Plugin 'bling/vim-bufferline'
" Auto-add delimiters
Plugin 'Raimondi/delimitMate'
"Latex
"Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
" Bundle 'vim-scripts/TeX-9'
" ROS
Bundle 'taketwo/vim-ros'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""End Vundle"""""""""""""""""
set visualbell t_vb=
syntax enable
filetype plugin on
filetype on
filetype indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
"set smartindent
"set cindent
set ignorecase
set smartcase   " Do smart case matching
"set linebreak
set showmatch
set incsearch
set hlsearch 
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
"set number  " line numbers
set viminfo='20,\"1000
" enables pasting using right click
set pastetoggle=<F2>
" replaces all instances without having to type /g at the end
set gdefault

" Line wrap (hard)
:set tw=79
au FileType tex,txt,doc set tw=78
:set formatoptions+=t

" Leader mappings
:let maplocalleader = ","

" Autocompletion and Supertab

" Limit popup menu height
set pumheight=15
" " SuperTab option for context aware completion
" let g:SuperTabDefaultCompletionType = "context"
" " Disable auto popup, use <Tab> to autocomplete
" let g:clang_complete_auto=0
" " Show clang errors in the quickfix window
" let g:clang_complete_copen=1
" "let g:clang_complete_auto = 1
" let g:clang_use_library=1
" "let g:clang_library_path = "/opt/local/lib"
" let g:clang_user_options='|| exit 0'
" let g:clang_auto_select=1

"beautification
colorscheme molokai
set bg=light
let g:molokai_original = 1
let g:rehash256 = 1
hi Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline

" Fix the delete key problem in insert mode
set backspace+=indent,eol,start

if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal g'\"" | endif
endif

"get xml syntax highlighting for ROS launch files
au BufNewFile,BufRead *.launch set filetype=xml

"matchit scipt for matlab
source $VIMRUNTIME/macros/matchit.vim
filetype indent on
autocmd BufEnter *.m    compiler mlint

if has("autocmd")
filetype indent on
endif

map q :wq<return>
map <space> :w<return>
imap hh <esc>:w<return>

if has('gui_running') 
      set background=dark
    colorscheme solarized
else
endif
"search files and buffers
"set runtimepath^=~/.vim/bundle/ctrlp.vim
nmap <leader>; :CtrlPBuffer<CR>
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 1
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 'ra' 
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

" t_comment
nmap <leader>c :TComment<CR>
nmap <leader>= :TCommentBlock<CR>
vmap <leader>c :TComment<CR>
vmap <leader>= :TCommentBlock<CR>

let g:EasyMotion_do_mapping = 1
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-w)
"nmap s <Plug>(easymotion-s)
"nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"YouCompleteMe
" let g:ycm_global_ycm_extra_conf = #"~/.vim/.ycm_extra_conf_ros.py"
" let g:ycm_global_ycm_extra_conf = #"/usr0/home/venkatrn/hydro_workspace/src/perception/sbpl_perception/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_semantic_triggers = {
" \   'roslaunch' : ['="', '$(', '/'],
" \   'rosmsg,rossrv,rosaction' : ['re!^'],
" \ }
" let g:ycm_semantic_triggers = {'cpp': ['->', '.', '::', 're![a-zA-Z0-9_]']}


"
"Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest

"Syntax checking
let g:loaded_youcompleteme = 1
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_confirm_extra_conf = 0 "don't show confirmation messages

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>


" ycm-ultisnips magic
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"multiple cursors
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

"bufferline
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  0 "always second (default)

"latex
" let g:tex_flavor = 'latex'
let g:tex_nine_config = {
      \'compiler': 'pdflatex',
      \'viewer': {'app':'xdg-open', 'target':'pdf'},
      \}


"delimiters
inoremap {<CR> {<CR>}<C-o>O
" Disable autocompletion for < in C-family languages
au FileType c,cpp,python let b:delimitMate_matchpairs = "(:),[:],{:}"
" Rely on snippets for latex
au FileType tex,latex let b:delimitMate_matchpairs = ""

" Use astyle for autoindenting c,cpp
au FileType c,cpp,python set equalprg=astyle
" set equalprg=astyle

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72

" split screen movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" switch to alternate buffer
nmap ; <c-^>

