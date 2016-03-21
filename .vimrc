"カラースキーマを設定
colorscheme molokai
syntax on
let g:molokai_original = 1
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

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Townk/vim-autoclose'
" emmet <c-y>, で実行
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticscafe/vim-less-autocompile' " less -> css用
NeoBundle 'jiangmiao/simple-javascript-indenter'
filetype plugin indent on

call neobundle#end()

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
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END

let mapleader = " "
"----------------------------
"  unite.vim
"----------------------------
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

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
