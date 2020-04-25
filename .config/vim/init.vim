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

" Set tab as spaces
  set tabstop=2
  set shiftwidth=2
  set expandtab

" vim-markdown
" Disable conceal regardless of conceallevel setting
  let g:vim_markdown_conceal = 0
" Disable folding configuration
  let g:vim_markdown_folding_disabled = 1

" Copy and paste to clipboard
  vnoremap <C-C> :w !xclip -i -selection primary<CR><CR>
  nnoremap <C-V> :r !xclip -o -selection primary<CR><CR>

" Vimagit
  if getcwd() == $HOME
    let g:magit_git_cmd="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
  endif
  autocmd VimEnter * nnoremap ,M :call magit#show_magit('h')<CR>

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e

" Ignore .gitignore files
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" When shortcut files are updated, renew bash and vifm configs with new material:
"  autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
