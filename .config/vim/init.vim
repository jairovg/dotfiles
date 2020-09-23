let mapleader=","

if ! filereadable(expand('~/.config/vim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/vim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/vim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'mboughaba/i3config.vim'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/vcscommand.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
Plug 'gabesoft/vim-ags'
Plug 'yggdroot/indentline'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" Some basics:
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set number relativenumber

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" vim-airline
  let g:airline_powerline_fonts=1

 " Vim colors
  let g:color16_uniform_status_lines = 1
  let g:color16_bold_vertical_split_line = 1
  let g:color16_uniform_diff_background = 1
  set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
  set t_8b=[48;2;%lu;%lu;%lum        " set background color
  colorscheme color16
  set t_Co=256
  set termguicolors                    " Enable GUI colors for the terminal to get truecolor

" Set tab as spaces
  set tabstop=2
  set shiftwidth=2
  set expandtab

  if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also https://sunaku.github.io/vim-256color-bce.html
    set t_ut=
  endif

" vim-markdown
" Disable conceal regardless of conceallevel setting
  let g:vim_markdown_conceal = 0
" Disable folding configuration
  let g:vim_markdown_folding_disabled = 1

" Silver search
  " Setup a default line numbers context
  let g:ags_agcontext = 0
  " Search for the word under cursor
  nnoremap <Leader>s :Ags<Space>-C<Space>0<Space><C-R>=expand('<cword>')<CR><CR>
  " Search for the visually selected text
  vnoremap <Leader>s y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
  " Run Ags
  nnoremap <Leader>a :Ags<Space>
  " Quit Ags
  nnoremap <Leader><Leader>a :AgsQuit<CR>
  " Default ag params
  let g:ags_agargs = {
    \ '--break'             : [ '', '' ],
    \ '--color'             : [ '', '' ],
    \ '--color-line-number' : [ '"1;30"', '' ],
    \ '--color-match'       : [ '"32;40"', '' ],
    \ '--color-path'        : [ '"1;31"', '' ],
    \ '--column'            : [ '', '' ],
    \ '--context'           : [ 'g:ags_agcontext', '-C' ],
    \ '--filename'          : [ '', '' ],
    \ '--ignore'            : [ 'package-lock.json', '--ignore' ],
    \ '--group'             : [ '', '' ],
    \ '--heading'           : [ '', '-H' ],
    \ '--max-count'         : [ 'g:ags_agmaxcount', '-m' ],
    \ '--numbers'           : [ '', '' ]
    \ }

" Copy and paste to clipboard
  vnoremap <C-C> :w !xclip -i -selection primary<CR><CR>
  nnoremap <C-V> :r !xclip -o -selection primary<CR><CR>

" Vimagit & CTRLP
  if getcwd() == $HOME && ! isdirectory('.git')
    let g:magit_git_cmd="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
    " Ignore .gitignore files
    let g:ctrlp_user_command = ['.cfg', 'cd %s && /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME ls-files -co --exclude-standard']
  else
    " Ignore .gitignore files
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  endif
  autocmd VimEnter * nnoremap ,M :call magit#show_magit('h')<CR>

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e


" When shortcut files are updated, renew bash and vifm configs with new material:
"  autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
