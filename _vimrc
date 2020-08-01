" ＠＠
" .vimrc
"---------------------------------------------------------------------------
scriptencoding utf-8

"---------------------------------------------------------------------------
" 文字コード・改行コード設定:

" 文字コードをUFT-8に設定
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
set ambiwidth=double

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
    function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
        let &fileencoding=&encoding
    endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac

"---------------------------------------------------------------------------
" 日本語対応のための設定:

" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自
" 動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについては
" README_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
source $VIM/plugins/kaoriya/encode_japan.vim
" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  set langmenu=japanese
endif
" 日本語入力用のkeymapの設定例 (コメントアウト)
if has('keymap')
  " ローマ字仮名のkeymap
  "silent! set keymap=japanese
  "set iminsert=0 imsearch=0
endif
" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

"---------------------------------------------------------------------------
" Kaoriya版に添付されているプラグインの無効化

" 問題があるものもあるのを無効化します。
" 必要なプラグインは
" let plugin_..._disableの設定行をコメント化(削除)して有効にして下さい。
" ※plugin_..._disableの値を0にしても有効にならない仕様なので注意してください。

" $VIM/plugins/kaoriya/plugin/autodate.vim を無効化
let plugin_autodate_disable  = 1

" $VIM/plugins/kaoriya/plugin/cmdex.vim を無効化
let plugin_cmdex_disable     = 1

" $VIM/plugins/kaoriya/plugin/dicwin.vim を無効化
let plugin_dicwin_disable    = 1

" $VIMRUNTIME/plugin/plugin/format.vim を無効化
let plugin_format_disable    = 1

" $VIM/plugins/kaoriya/plugin/hz_ja.vim を無効化
let plugin_hz_ja_disable     = 1

" $VIM/plugins/kaoriya/plugin/scrnmode.vim を無効化
let plugin_scrnmode_disable  = 1

" $VIM/plugins/kaoriya/plugin/verifyenc.vim を無効化
"let plugin_verifyenc_disable = 1

"---------------------------------------------------------------------------
" 基本設定:

" バックアップファイルを作らない (nowritebackup:上書きする前の一時バックアップも作らない)
set nobackup
set writebackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

" 全角文字専用の設定
set ambiwidth=double

" wildmenuオプションを有効 (vimバーからファイルを選択できる)
set wildmenu

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" ビープ音を可視化
set visualbell

" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect

" すべての数を10進数として扱う
set nrformats=

" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:

" タイトルを表示
set title

" 行番号を表示 (number:表示)
set number

" ルーラーを表示 (noruler:非表示)
set ruler

" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap

" 現在の行を強調表示
set cursorline

" 現在の列を強調表示
" set cursorcolumn

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash

" 対応する括弧やブレースを表示
set showmatch matchtime=1

" インデント方法の変更
set cinoptions+=:0

" 自動的にインデントする (noautoindent:インデントしない)
" set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する (スマートインデント)
set smartindent

" ステータスラインを常に表示
set laststatus=2

" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2

" コマンドラインの補完
set wildmode=list:longest

" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd

" 省略されずに表示
set display=lastline

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:$,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" Tab文字を半角スペースにする
set expandtab

" インデント幅
set shiftwidth=2

" タブキー押下時に挿入される文字幅を指定
set softtabstop=2

" ファイル内にあるタブ文字の表示幅
set tabstop=2

" シンタックスハイライトの有効化
syntax enable

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する (noignorecase:無視しない)
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

"---------------------------------------------------------------------------
" dein.vim settings

if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.vim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"---------------------------------------------------------------------------

