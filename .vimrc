syntax on
colorscheme molokai
set t_Co=256
let g:rehash256 = 1
set background=dark

let g:quickrun_config = {}

" Tab
set tabstop=2
set expandtab
set smarttab
set shiftround
set nowrap
set shiftwidth=2
set autoindent
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"クリップボードの共有
set clipboard+=autoselect
set clipboard+=unnamed

" スクロール幅？
set guifont=18
"ルーラー,行番号を表示
set ruler
set cmdheight=2
set laststatus=2
set wildmenu

set ambiwidth=double

" insertモードから抜ける
inoremap <silent> <C-j> <ESC>

" 行末移動方向をキー
nnoremap 9 $
nnoremap d9 d$

set grepprg=grep\ -nH

" カーソル行をハイライト
set cursorline

set noswapfile                    "swapをつくらない
set nobackup
set autoread                      "外部でファイルに変更がされた場合は読みなおす
set noundofile
set confirm                       " 保存されていないファイルがあるときは終了前に保存確認
set backspace=indent,eol,start    "backspaceで消せるようにする
set vb t_vb=                      "ビープ音を鳴らさない
set clipboard=unnamed             "OSのクリップボードを使用する
set mouse=a                       " マウスの入力を受け付ける

"全角スペースを可視化
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue " 全角スペースの定義
match ZenkakuSpace /　/

"filetype off
if 0 | endif
if &compatible
   set nocompatible               " Be iMproved
endif
set runtimepath^=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'Townk/vim-autoclose'
" emmet <c-y>, で実行
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticscafe/vim-less-autocompile' " less -> css用
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'

call neobundle#end()

"if has('vim_starting')
"  set runtimepath+=~/.vim/bundle/neobundle.vim
"  call neobundle#begin(expand('~/.vim/bundle/'))
"endif
filetype plugin indent on

" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-----------------------------
"  rails.vim
"-----------------------------

let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>h :Rhelper<Space>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END

let mapleader = " "

"-----------------------
" less
"-----------------------
autocmd BufRead,BufNewFile *.less set filetype=less
"自動で変換
let g:less_autocompile=1
"圧縮しない
let g:less_compress=0

" この設定入れるとshiftwidthを2にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 2
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1
