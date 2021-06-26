set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set noet|retab!
set nocompatible
set list
set listchars=tab:>\ 

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'glepnir/oceanic-material'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" IDE
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Code commenter
Plug 'preservim/nerdcommenter'

" Tabs
Plug 'ap/vim-buftabline'

" Pluggin JavaScript and React
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Telescope extra plugins
Plug 'kyazdani42/nvim-web-devicons'

" Vim floaterm
Plug 'voldikss/vim-floaterm'

call plug#end()
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let mapleader=" "

" Nerdtree setup
nmap <leader>nt :NERDTree<CR>
let NERDTreeQuitOnOpen = 1

nmap <Leader>w :w!<CR>
nmap <Leader>q :q<CR>
nmap <Leader>nf :Neoformat<CR><CR>
nmap <Leader>mf gg=G<C-o><C-o>

" Javascript Configuration
let g:vim_jsx_pretty_colorful_config = 1 " Default 0

" Config fzf
nmap <leader>s /

" Config buffers
nmap <S-Tab> :bn<CR>
nmap <Leader><Tab> :bp<CR>
nmap <Leader>bd :bd<CR>

" Config open files, and tab files
nmap <Tab> :tabn<CR>
nmap <Leader>qt :tabclose<CR>
nmap <Leader>o :tabe

" Config split windows
nmap <Leader>sp :split<CR>
nmap <Leader>vsp :vsplit<CR>
nmap <Leader><Tab> <C-w><C-w>

" Neoformat config file
source /Users/mateooviedo/.config/nvim/neoformat.vim

" Vim airline config
let g:airline_powerline_fonts = 1
set t_Co=256

" Vim fugitive config
nmap <Leader>gdm :Gdiff master<CR>
nmap <Leader>gf :GFiles<CR>
nmap <Leader>gb :Gblame<CR>
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>

if has('termguicolors')
	set termguicolors
endif

" IndetLine config
let g:indentLine_char = '¦'

" Kite
let g:kite_supported_languages = ['javascript', 'python']

" Coc configuration
let g:coc_global_extensions = [
	\ 'coc-emoji', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin',
	\ 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml'
\ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif

function! ShowDocIfNoDiagnostic(timer_id)
	if (coc#float#has_float() == 0)
		silent call CocActionAsync('doHover')
	endif
endfunction

function! s:show_hover_doc()
	call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" Select all
nmap <C-a> ggVG

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if &filetype == "javascript" || &filetype == "python"
	inoremap <c-space> <C-x><C-u>
else
	inoremap <silent><expr> <c-space> coc#refresh()
endif

" Telescope config file
source /Users/mateooviedo/.config/nvim/telescope.vim

colorscheme oceanic_material

" airline theme
let g:airline_theme='fruit_punch'
