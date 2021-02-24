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
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  " (8.0.1114 でデフォルトになったが念のため残してある)
  "set iminsert=0 imsearch=0
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
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

" wildmenuオプションを有効 (vimバーからファイルを選択できる)
set wildmenu

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" ビープ音を可視化
set visualbell

" ヤンクでクリップボードにコピー
set clipboard=unnamed

" すべての数を10進数として扱う
set nrformats=

" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:

" タイトルを表示
set title

" 行番号を表示
set number

" ルーラーを表示
set ruler

" 長い行を折り返して表示
set wrap

" カーソル行を強調表示
set cursorline

" 現在の列を強調表示
" set cursorcolumn

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" 対応する括弧やブレースを表示
set showmatch matchtime=1

" インデント方法の変更
set cinoptions+=:0

" 自動的にインデントしない
set noautoindent

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

" 画面スクロール
set scroll=3
set scrolljump=1
set scrolloff=5

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

"---------------------------------------------------------------------------
" キー設定:

" ▼ノーマルモード

" 保存・終了
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <Space>ww :<C-u>w<CR>
nnoremap <Space>vq :<C-u>q<CR>

" EXモード"
nnoremap Q <Nop>

" ウィンドウ操作
nnoremap <Space>vs :<C-u>sp<CR><C-w>j
nnoremap <Space>vv :<C-u>vs<CR><C-w>l
nnoremap <Space>vj <C-w>j
nnoremap <Space>vk <C-w>k
nnoremap <Space>vh <C-w>h
nnoremap <Space>vl <C-w>l
nnoremap <Space>vJ <C-w>J
nnoremap <Space>vK <C-w>K
nnoremap <Space>vL <C-w>L
nnoremap <Space>vH <C-w>H
nnoremap <Space>v> <C-w>>
nnoremap <Space>v< <C-w><
nnoremap <Space>v+ <C-w>+
nnoremap <Space>v- <C-w>-
nnoremap <Space>v. <C-w>>
nnoremap <Space>vn <C-w><
nnoremap <Space>vm <C-w>+
nnoremap <Space>v, <C-w>-

" バッファ操作
nnoremap <Space>bl :<C-u>ls<CR>
nnoremap <Space>bn :<C-u>bn<CR>
nnoremap <Space>bp :<C-u>bp<CR>
nnoremap <Space>bd :<C-u>bd<CR>

" タブ操作
nnoremap <Space>tt :<C-u>tabnew<CR>
nnoremap <Space>tn gt
nnoremap <Space>tp gT

" カーソル移動
nnoremap <Space>mm M
nnoremap <Space>mj L
nnoremap <Space>mk H
nnoremap <Space>mh 0
nnoremap <Space>ml $
nnoremap <Space>j 10j
nnoremap <Space>k 10k
nnoremap <Space>h 10h
nnoremap <Space>l 10l
nnoremap <Space>jj 50j
nnoremap <Space>kk 50k
nnoremap <Space>hh 50h
nnoremap <Space>ll 50l
nnoremap <Space>jjj 80j
nnoremap <Space>kkk 80k
nnoremap <Space>hhh 80h
nnoremap <Space>lll 80l
nnoremap <Space>J 100j
nnoremap <Space>K 100k
nnoremap <Space>H 100h
nnoremap <Space>L 100l

" 画面スクロール
nnoremap <Space>vg zz
nnoremap <Space>vt zt
nnoremap <Space>vb zb

" カーソル移動のShiftボタンを無効にする
nnoremap J <Nop>
nnoremap K <Nop>
nnoremap H <Nop>
nnoremap L <Nop>

" 空行追加（ノーマルモードでも改行はできるようにする）
nnoremap <CR> o<ESC>
nnoremap <Space><CR> O<ESC>

" 行連結
nnoremap <Space>+ J

" 行分割
nnoremap <Space>; i<CR><ESC>

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" ハイライト消去
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" カーソル位置から行末までヤンク
nnoremap Y y$

" 削除・変更でヤンクしない
"nnoremap d "_d
"nnoremap D "_D
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C
nnoremap s "_s
nnoremap S "_S

" 日本語入力がオンのままでも使えるコマンド（Enterキーは必要）
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
nnoremap し[ ci[
nnoremap し( ci(
nnoremap し{ ci{
nnoremap し” ci"
nnoremap し’ ci'
nnoremap し` ci`
nnoremap しt cit

" カーソル下の単語をハイライトする
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" カーソル下の単語をハイライトしてから置換する
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

" タイポ修正
" teh の e で <Space>t を押して the に直す
nnoremap <Space>t xp

" インクリメント・デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" ▼インサートモード

" ノーマルモードに戻る（ESCの代替）
inoremap <silent> jj <ESC><Right>
inoremap <silent> っj <ESC><Right>
inoremap <silent> っｊ <ESC><Right>
inoremap <silent> ｊｊ <ESC><Right>

" アンドゥしてノーマルモードに戻る
inoremap <silent> uuuu <ESC>u<Right>
inoremap <silent> うううう <ESC>u<Right>

" Delete, Backspace
inoremap <C-d> <Del>
inoremap <C-b> <BS>

" カーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" [ と打ったら [] と入力し、かっこの中にカーソルを移動する
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap < <><left>
inoremap （ （）<left>
inoremap 「 「」<left>
inoremap 『 『』<left>
inoremap 【 【】<left>
inoremap ＜ ＜＞<left>

" [! と打ったら 1つだけ [ を入力する
inoremap [! [
inoremap (! (
inoremap {! {
inoremap "! "
inoremap '! '
inoremap `! `
inoremap <! <
inoremap （！ （
inoremap 「！ 「
inoremap 『！ 『
inoremap 【！ 【
inoremap ＜！ ＜

" タイポ修正
" teh まで打ったあと the に直す
inoremap <C-t> <Esc><Left>"zx"zpa

" ▼ビジュアルモード

" ESCの代替（右にESCする）
vnoremap <C-]> <Esc><Right>

" カーソル移動
vnoremap <Space>mm M
vnoremap <Space>mj L
vnoremap <Space>mk H
vnoremap <Space>mh 0
vnoremap <Space>ml $
vnoremap <Space>j 10j
vnoremap <Space>k 10k
vnoremap <Space>h 10h
vnoremap <Space>l 10l
vnoremap <Space>jj 50j
vnoremap <Space>kk 50k
vnoremap <Space>hh 50h
vnoremap <Space>ll 50l
vnoremap <Space>jjj 80j
vnoremap <Space>kkk 80k
vnoremap <Space>hhh 80h
vnoremap <Space>lll 80l
vnoremap <Space>J 100j
vnoremap <Space>K 100k
vnoremap <Space>H 100h
vnoremap <Space>L 100l

" インデントの調整後にビジュアルモードを解除しない
vnoremap < <gv
vnoremap > >gv

" 削除・変更でヤンクしない
"vnoremap d "_d
"vnoremap D "_D
vnoremap x "_x
vnoremap X "_X
vnoremap c "_c
vnoremap C "_C
vnoremap s "_s
vnoremap S "_S

" インクリメント・デクリメント
vnoremap + <C-a>gv
vnoremap - <C-x>gv

" ビジュアルモードで連続してペースト
xnoremap <expr> p 'pgv"'.v:register.'y`>'

" ビジュアルモードでハイライト・置換
xnoremap <silent> <Space> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xnoremap * :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
xmap # <Space>:%s/<C-r>///g<Left><Left>

function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction

" ▼コマンドラインモード

" Delete, Backspace
cnoremap <C-d> <Del>
cnoremap <C-b> <BS>

" カーソル移動
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっ
" ている時の挙動)があるのでデフォルトでは設定しない。Windowsではmousehide
" が、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラする
" という問題を引き起す。
"
" どのモードでもマウスを使えるようにする
set mouse=a

" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替える)
set nomousefocus

" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide

" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

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

