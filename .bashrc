# ============================================================
# ■bash .bashrc
# %version / 1.3
#
# by Koei Watanabe
# ------------------
# 【履歴】
# ------------------
# ・2012.04.04  v1.2  修正
# ・2020.07.30  v1.3  Git bash用 UTF-8変換
# ============================================================

# 環境変数
#export LANG=ja_JP.eucJP  # 言語ロケール
#export LANG=ja_JP.SJIS  # 言語ロケール
export LANG=ja_JP.UTF-8  # 言語ロケール
#export LESSCHARSET=dos  # less で日本語を表示
export CDPATH='.:~:~/works/';  # カレント:ホーム:作業ディレクトリをディレクトリ検索パスに指定

# プロンプト設定
if [ -f ~/.bash_prompt ]; then
	source ~/.bash_prompt;
fi

# alias設定
if [ -f ~/.bash_alias ]; then
	source ~/.bash_alias;
fi

# シェル関数設定
if [ -f ~/.bash_func ]; then
	source ~/.bash_func;
fi

# set オプション
set -o noclobber;  # リダイレクトで上書き禁止
set -o ignoreeof;  # C-dでexitしない
set -o nounset;  # unsetされた変数を参照するとエラー

# shopt オプション
shopt -s extglob;  # 拡張パターンマッチを使用する

# umask
umask 022;

# ホームディレクトリに移動
cd ~

