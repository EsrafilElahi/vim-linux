" Set background color to dark
set background=dark

" Map Ctrl+G to go to a specific line
nnoremap <C-L> :call GotoLine()<CR>

" Function to prompt for line number and jump to it
function! GotoLine()
    let lnum = input('Go to line: ')
    execute 'normal! ' . lnum . 'G'
endfunction

" Map \g to go to a specific line
nnoremap <Leader>l :call GotoLine()<CR>

" Set text color
" highlight Normal guifg=Green ctermfg=Green

" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Enable mouse support
set mouse=a

" Enable clipboard integration (requires Vim to be compiled with +clipboard)
set clipboard=unnamedplus

" Enable incremental search
set incsearch

" Highlight search results as you type
set hlsearch

" Enable case-insensitive searching
set ignorecase
set smartcase

" Set tab settings
set tabstop=2
set shiftwidth=2
set expandtab

" Enable file type detection
filetype plugin indent on
filetype plugin on

" Enable autocompletion
set wildmenu
set wildmode=list:longest

" Set dictionary for keyword completion
set dictionary+=/path/to/your/dictionary/file

" Enable file path completion
set path+=/path/to/your/project/**

" Enable omni-completion
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Enable line and column numbers in the status line
set ruler

" NERDTree settings (updated mappings)
nnoremap <C-p> :Files<CR>
nnoremap <C-]> :NERDTreeFind<CR>
nnoremap <C-[> :NERDTreeToggle<CR>
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
nnoremap <Leader>u:s/^#//<CR>
vnoremap <Leader>u:s/^#//<CR>gv

" Map Git commands for quick access
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gl :Gpull<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '\.swp$', '\.swo$', '\.git$']

" Airline status bar
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Auto-close HTML and XML tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Set up an autocommand to trigger AutoSave every minute
autocmd BufWritePost * call AutoSave()

" Enable auto-save
let g:auto_save = 1

augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END

set noswapfile

" Session Management
set sessionoptions+=tabpages,globals
autocmd VimLeave * mksession! ~/.vim/session.vim
autocmd VimEnter * nested if argc() == 0 && filereadable('~/.vim/session.vim') | source ~/.vim/session.vim | endif

" NERDCommenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Comment shortcuts (Ctrl+/ style)
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle
" Alternative mapping for terminals that might not send Ctrl+/
nmap <C-/> <plug>NERDCommenterToggle
vmap <C-/> <plug>NERDCommenterToggle

call plug#begin('~/.vim/plugged')
  " Add your desired plugins here
  Plug 'scrooloose/nerdtree'
  Plug '907th/vim-auto-save'
  Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'preservim/nerdcommenter'
  Plug 'mxw/vim-jsx'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ternjs/tern_for_vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'tpope/vim-fugitive'
  
  " Git integration
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-lua/plenary.nvim'

  " File explorer with Git integration
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Gitsigns configuration
lua << EOF
require('gitsigns').setup {}
EOF
