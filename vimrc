" System config "============================================================
" font and colortheme
let g:with_nerd_font = v:true
let color_theme = "tokyonight"
let airline_theme = "tokyonight"
set guifont=PlemolJPConsoleNF-Regular:h14

" key map -------------------------------------------------------------------
let mapleader = "\<Space>"
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <silent> <C-t> :term ++curwin ++noclose<CR>
autocmd FileType text setlocal textwidth=0
set mouse=a
" window visual -------------------------------------------------------------
set number
set nowrap
set cursorline
set belloff=all
hi clear CursorLine
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[2 q"
set t_Co=256
set background=dark
syntax on
" tab and indent ------------------------------------------------------------
set expandtab
set tw=0
set formatoptions=q
set tabstop=4
set shiftwidth=4
set showmatch
set matchtime=1
set pumheight=10
set laststatus=2
set splitbelow
set completeopt=menuone,noinsert
set backspace=indent,eol,start
" clipboard -----------------------------------------------------------------
set clipboard=unnamed
" backup --------------------------------------------------------------------
set noswapfile
set nobackup
set nowritebackup
set noundofile
" encode --------------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
" search --------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch

" Plugin Manager =============================================================
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1}
Jetpack 'easymotion/vim-easymotion'
Jetpack 'tpope/vim-surround'
Jetpack 'tpope/vim-commentary'
Jetpack 'raimondi/delimitmate'
Jetpack 'scrooloose/nerdtree'
Jetpack 'iamcco/markdown-preview.nvim',
            \ { 'do': 'cd app && npx --yes yarn install' }
" Colorscheme
Jetpack 'tomasr/molokai'
Jetpack 'ku1ik/vim-monokai'
Jetpack 'ghifarit53/tokyonight-vim'
" Search
Jetpack 'junegunn/fzf', { 'do': { -> fzf#install() } }
Jetpack 'junegunn/fzf.vim'
" Interfaces
Jetpack 'vim-airline/vim-airline'
Jetpack 'vim-airline/vim-airline-themes'
if with_nerd_font
    Jetpack 'ryanoasis/vim-devicons'
endif
" Coc and extensions
Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
Jetpack 'neoclide/coc-snippets'
Jetpack 'fannheyward/coc-markdownlint'
Jetpack 'kkiyama117/coc-toml'
Jetpack 'fannheyward/coc-pyright'
Jetpack 'fannheyward/coc-rust-analyzer'
Jetpack 'neoclide/coc-tsserver'
Jetpack 'neoclide/coc-prettier'
Jetpack 'neoclide/coc-eslint'
" Python
Jetpack 'jmcantrell/vim-virtualenv'
call jetpack#end()

" Plugin config " ============================================================
" colorschme plugins " -------------------------------------------------------
function! CheckColorScheme(scheme) abort
    " get available colorschme file path list
    let schemes = globpath(&rtp, 'colors/*.vim', 0, 1) 
    " extract colorscheme names from path list
    let scheme_names = map(schemes, {_, v -> fnamemodify(v, ':t:r')})
    " if scheme exists in scheme_names, return the index, otherwise return -1
    let result =index(scheme_names, a:scheme) 
    return  result >= 0
endfunction

if CheckColorScheme(color_theme)
    if color_theme == "tokyonight" || airline_theme == "tokyonight"
        let g:tokyonight_style = 'storm' " available: night, storm
        let g:tokyonight_enable_italic = 1
        execute "colorscheme " . color_theme
    else
        execute "colorscheme " . color_theme
    endif
endif

" lazygit (external program) -------------------------------------------------
nnoremap <silent> <Leader>g :term ++curwin ++noclose lazygit<CR>

" Fussy Finder ---------------------------------------------------------------
" fzf " ----------------------------------------------------------------------
nnoremap <silent> <Leader>ff :Files<CR>

" Filer ----------------------------------------------------------------------
" nerdtree
nnoremap <C-b> :NERDTreeToggle<CR>

" coc.nvim " -----------------------------------------------------------------
let g:coc_global_extensions = [
            \ "coc-snippets",
            \ "coc-markdownlint",
            \ "coc-toml",
            \ "coc-rust-analyzer",
            \ "coc-pyright",
            \ "coc-tsserver",
            \ "coc-eslint",
            \ "coc-prettier",
            \ "coc-lua"
            \  ]
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
autocmd BufWritePre *.py :CocCommand python.sortImports
nnoremap <silent>gd, "call CocAction('jumpDefinition')<CR>"
nnoremap <silent>gh, "call CocAction('doHover')<CR>"
nnoremap <silent>gr, "call CocAction('rename')<CR>"
inoremap <silent><C-l> <Plug>(coc-snippets-expand)

" virtualenv -----------------------------------------------------------------
let g:virtualenv_directory="~/.venv"

" vim air line " --------------------------------------------------------------
let g:airline_theme= airline_theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if with_nerd_font
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.colnr = ' ℅:'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ' :'
    let g:airline_symbols.maxlinenr = '☰ '
    let g:airline_symbols.dirty='⚡'
else
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    let g:airline_symbols.colnr = ' ㏇:'
    let g:airline_symbols.colnr = ' ℅:'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
endif

" youcompleteme
let g:ycm_global_ycm_extra_conf = "${HOME}/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

