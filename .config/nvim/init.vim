" ＠＠
" init.vim


" ------------------------------------------------------------------------------
" 文字コード・改行コード設定

" 文字コード
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis

set ambiwidth=double

" 改行コードの自動認識
set fileformats=unix,dos,mac


" ------------------------------------------------------------------------------
" キーバインド

let mapleader = "\<Space>"

" ----------------------------------------
" ▼ノーマルモード

" 保存・終了
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <Leader>ww :<C-u>w<CR>
nnoremap <Leader>wq :<C-u>q<CR>
nnoremap <Leader>mq :<C-u>q<CR>

" EXモード"
nnoremap Q <Nop>

" バッファ操作
nnoremap <Leader>mb :<C-u>ls<CR>
nnoremap <Leader>mn :<C-u>bn<CR>
nnoremap <Leader>mp :<C-u>bp<CR>
nnoremap <Leader>md :<C-u>bd<CR>

" ウィンドウ操作
nnoremap <Leader>ms :<C-u>sp<CR><C-w>j
nnoremap <Leader>mv :<C-u>vs<CR><C-w>l
nnoremap <Leader>mj <C-w>j
nnoremap <Leader>mk <C-w>k
nnoremap <Leader>mh <C-w>h
nnoremap <Leader>ml <C-w>l
nnoremap <Leader>mJ <C-w>J
nnoremap <Leader>mK <C-w>K
nnoremap <Leader>mL <C-w>L
nnoremap <Leader>mH <C-w>H
nnoremap <Leader>m<Right> 10<C-w>>
nnoremap <Leader>m<Left> 10<C-w><
nnoremap <Leader>m<Up> 10<C-w>+
nnoremap <Leader>m<Down> 10<C-w>-

" 画面スクロール
nnoremap <Leader>mG zz
nnoremap <Leader>mT zt
nnoremap <Leader>mB zb

" タブ操作
nnoremap <Leader>Tt :<C-u>tabnew<CR>
nnoremap <Leader>Tn gt
nnoremap <Leader>Tp gT

" カーソル移動のShiftボタンを無効にする
nnoremap J <Nop>
nnoremap K <Nop>
nnoremap H <Nop>
nnoremap L <Nop>

" カーソル移動
nnoremap <Leader>j 10j
nnoremap <Leader>k 10k
nnoremap <Leader>h 10h
nnoremap <Leader>l 10l
nnoremap <Leader>a ^
nnoremap <Leader>e $
nnoremap <Leader>g M
nnoremap <Leader>t H
nnoremap <Leader>b L

" タイポ修正
" teh の e で t を押して the に直す
nnoremap t xp

" インクリメント・デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" 空行追加（ノーマルモードでも改行はできるようにする）
nnoremap <CR> o<ESC>
nnoremap <Leader><CR> O<ESC>

" 行連結
nnoremap <Leader>+ J

" 行分割

nnoremap <Leader>; i<CR><ESC>

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

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
nnoremap <silent><Leader>* "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" カーソル下の単語をハイライトしてから置換する
nmap # <Leader>*:%s/<C-r>///gc<Left><Left><Left>

" ハイライト消去
nnoremap <silent><Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

" ----------------------------------------
" ▼インサートモード

" ノーマルモードに戻る（ESCの代替）
inoremap <silent>jj <ESC><Right>
inoremap <silent>っj <ESC><Right>
inoremap <silent>っｊ <ESC><Right>
inoremap <silent>ｊｊ <ESC><Right>

" Undoしてノーマルモードに戻る
inoremap <silent>uuuu <ESC>u<Right>
inoremap <silent>うううう <ESC>u<Right>

" カーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Backspace
inoremap <C-d> <BS>

" タイポ修正
" teh まで打ったあと the に直す
inoremap <C-t> <Esc><Left>"zx"zpa

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

" ----------------------------------------
" ▼ビジュアルモード

" ESCの代替（右にESCする）
vnoremap <C-]> <Esc><Right>

" カーソル移動
vnoremap <Leader>j 10j
vnoremap <Leader>k 10k
vnoremap <Leader>h 10h
vnoremap <Leader>l 10l
vnoremap <Leader>a ^
vnoremap <Leader>e $
vnoremap <Leader>g M
vnoremap <Leader>t H
vnoremap <Leader>b L

" インデントの調整後にビジュアルモードを解除しない
vnoremap < <gv
vnoremap > >gv

" 削除・変更でヤンクしない
"vnoremap d "_d
"vnoremap D "_D
vnoremap x "_x
vnoremap X "_X
"vnoremap c "_c
"vnoremap C "_C
vnoremap s "_s
vnoremap S "_S

" インクリメント・デクリメント
vnoremap + <C-a>gv
vnoremap - <C-x>gv

" ビジュアルモードで連続してペースト
xnoremap <expr> p 'pgv"'.v:register.'y`>'

" ビジュアルモードでハイライト・置換
xnoremap <silent><Leader> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xnoremap * :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
xmap # <Leader>*:%s/<C-r>///gc<Left><Left><Left>

function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction

" ----------------------------------------
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


" ------------------------------------------------------------------------------
" 基本設定

" バックアップファイルを作らない (nowritebackup:上書きする前の一時バックアップも作らない)
set nobackup
set writebackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 矩形選択で文字が無くても右へ進める
set virtualedit=block

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

" 全角文字専用の設定
set ambiwidth=double

" wildmenuオプションを有効 (vimバーからファイルを選択できる)
"set wildmenu

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

" 新しい行を自動インデントする
set autoindent

" ファイルタイプの自動検出とインデント設置の自動読み込み
filetype plugin indent on

" マウスを使う
set mouse=a


"---------------------------------------------------------------------------
" 画面表示の設定

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
set cursorcolumn

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


" ------------------------------------------------------------------------------
" dein.vimの設定

if !&compatible
  set nocompatible
endif

" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 起動時に読み込むプラグイン
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

  " 利用時に読み込むプラグイン
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#end()
  call dein#save_state()
endif
 
" 不足プラグインの自動インストール
if dein#check_install()
  call dein#install()
endif

