# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_pushd        # cd時にディレクトリスタックにpushdする http://www.jmuk.org/diary/index.php/2007/02/23/2/
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする
bindkey -e               # ctrl-A,ctrl-Eとかできる様にする(キーバインドをemacsモードにする)

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする http://blog.livedoor.jp/miya_k_/archives/232122.html
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
setopt extended_glob # グロブ機能を拡張する http://www.ayu.ics.keio.ac.jp/~mukai/tips/zshfiles.html
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d) http://soudan1.biglobe.ne.jp/qa1885295.html
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
# http://mollifier.hatenablog.com/entry/20090318/1237302243
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# git error対策
export GIT_SSL_NO_VERIFY=1 
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n [%~] %# %{${reset_color}%}"
PROMPT=$tmp_prompt 
PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"

# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}
PATH=$HOME/local/bin:/usr/local/bin:${PATH}
#export GEM_HOME=$HOME/Software/ruby
#export PATH=$PATH:$HOME/Software/ruby/bin
NOW=`date +%Y%m%d`
alias elog="tail -f /var/log/apache2/error_log.$NOW"
alias alog="tail -f /var/log/apache2/access_log.$NOW"
