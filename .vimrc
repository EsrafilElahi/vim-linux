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

" NERDTree settings
nnoremap <C-]> :NERDTreeToggle<CR>
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



" Set up an autocommand to trigger AutoSave every minute (adjust as needed)
autocmd BufWritePost * call AutoSave()

" Enable auto-save
let g:auto_save = 1

augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END


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

  " Add more plugins as needed
call plug#end()





