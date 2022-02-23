
" ----------------------------------------
" ▼ノーマルモード

" 保存・終了
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <Leader>ww :<C-u>w<CR>
nnoremap <Leader>qq :<C-u>q<CR>

" EXモード"
nnoremap Q <Nop>

" バッファ操作
nnoremap <Leader>bb :<C-u>ls<CR>
nnoremap <Leader>bn :<C-u>bn<CR>
nnoremap <Leader>bp :<C-u>bp<CR>
nnoremap <Leader>bd :<C-u>bd<CR>

" ウィンドウ操作
nnoremap <Leader>mm :<C-u>vs<CR><C-w>l
nnoremap <Leader>ms :<C-u>sp<CR><C-w>j
nnoremap <Leader>mj <C-w>j
nnoremap <Leader>mk <C-w>k
nnoremap <Leader>mh <C-w>h
nnoremap <Leader>ml <C-w>l

" タブ操作
nnoremap <Leader>tt :<C-u>tabnew<CR>
nnoremap <Leader>tn gt
nnoremap <Leader>tp gT

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
nnoremap <Leader>gm M
nnoremap <Leader>gg H
nnoremap <Leader>G L

" タイポ修正
" teh の h で t を押して the に直す
nnoremap t <Left>xp

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
nnoremap <silent><Esc> :<C-u>nohlsearch<CR><ESC>
nnoremap <silent><C-[> :<C-u>nohlsearch<CR><ESC>
nnoremap <silent><C-b> :<C-u>nohlsearch<CR><ESC>

" ----------------------------------------
" ▼インサートモード

" ノーマルモードに戻る（ESCの代替）
inoremap <C-b> <ESC><Right>

" Undoしてノーマルモードに戻る
inoremap <C-u> <ESC>u<Right>

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

" [x と打ったら 1つだけ [ を入力する
inoremap [x [
inoremap (x (
inoremap {x {
inoremap "x "
inoremap 'x '
inoremap `x `
inoremap <x <
inoremap （ｘ （
inoremap 「ｘ 「
inoremap 『ｘ 『
inoremap 【ｘ 【
inoremap ＜ｘ ＜

" ----------------------------------------
" ▼ビジュアルモード

" ESCの代替（右にESCする）
vnoremap <C-[> <Esc><Right>
vnoremap <C-b> <Esc><Right>

" カーソル移動
vnoremap <Leader>j 10j
vnoremap <Leader>k 10k
vnoremap <Leader>h 10h
vnoremap <Leader>l 10l
vnoremap <Leader>a ^
vnoremap <Leader>e $
vnoremap <Leader>gm M
vnoremap <Leader>gg H
vnoremap <Leader>G L

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

" カーソル移動
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Backspace
cnoremap <C-d> <BS>


