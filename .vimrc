"----------------------------------------------------
" NeoBundle
"----------------------------------------------------
set nocompatible               " Be iMproved
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin'  : 'make -f make_cygwin.mak',
            \     'mac'     : 'make -f make_mac.mak',
            \     'unix'    : 'make -f make_unix.mak',
            \    },
            \ }
  " My Bundles here
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'fatih/vim-go'
  NeoBundle 'moll/vim-node'
  NeoBundle 'vim-scripts/Lucius'
  NeoBundle 'Indent-Guides'
  NeoBundle 'The-NERD-tree'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'yuki777/encode.vim'
  NeoBundle 'thinca/vim-ft-svn_diff'
  NeoBundle 'vim-scripts/yanktmp.vim'
  NeoBundle 'Align'
  NeoBundle 'Shougo/neocomplcache.git'
  NeoBundle 'Shougo/neosnippet.git'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'rhysd/committia.vim'
  NeoBundle 'mattn/jscomplete-vim'
  NeoBundle 'jwalton512/vim-blade'
  autocmd FileType javascript
    \ :setl omnifunc=jscomplete#CompleteJS
call neobundle#end()

filetype plugin indent on     " Required!
NeoBundleCheck

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" スワップファイル .swpを作成しない
set noswapfile

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" インクリメンタルサーチを使わない
set noincsearch
" 最後まで検索したも先頭に戻らない
set nowrapscan
" 検索結果文字列のハイライトを有効にする
set hlsearch
"Escを連打したときにハイライトが消えるように+ペーストモード解除するように
nmap <silent> <Esc><Esc> :nohlsearch<CR>:set nopaste<CR><Esc>
" ;p で貼り付けモードにする
nmap <silent> ;p :set paste<CR>:startinsert<CR>

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" 行番号を表示
set number
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
"nd! Utf8  e ++enc=utf-8
command! Euc   e ++enc=euc-jp
command! Sjis  e ++enc=cp932
command! Jis   e ++enc=iso-2022-jp
command! WUtf8 w ++enc=utf-8       | e
command! WEuc  w ++enc=euc-jp      | e
command! WSjis w ++enc=cp932       | e
command! WJis  w ++enc=iso-2022-jp | e

" -----------------------------------------------
" utf-8で開く
" -----------------------------------------------
autocmd FileType svn :set       fileencoding=utf-8
autocmd FileType cvs :set       fileencoding=utf-8
autocmd FileType gitcommit :set fileencoding=utf-8

"----------------------------------------------------
" colorscheme
"----------------------------------------------------
set t_Co=256
    if filereadable($HOME . "/.vim/bundle/Lucius/colors/lucius.vim")
        colorscheme lucius
        LuciusDarkHighContrast
    endif

"----------------------------------------------------
" インデント量の違いをハイライト表示する
" 'Indent-Guides'
"----------------------------------------------------
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme :hi IndentGuidesOdd  guibg=235 ctermbg=235
autocmd VimEnter,Colorscheme :hi IndentGuidesEven guibg=237 ctermbg=237
let g:indent_guides_enable_on_vim_startup = 1

"----------------------------------------------------
" plugin NERDTreeの設定
" 'NERDTree'
" "----------------------------------------------------
" .svn .git .DS_Store ~ は無視
let NERDTreeIgnore=['\.svn$', '\.git$', '\.DS_Store', '\~$']
" 隠しファイルを表示するか
let NERDTreeShowHidden=1
" .BERDTreeBookmarksファイルをどこに置くか
let NERDTreeBookmarksFile=$HOME.'/.vim/data/NERDTree/.NERDTreeBookmarks'
" Ctrl + d でNERDTreeを開く/閉じる
"nnoremap <f12> :NERDTreeToggle<CR>
nnoremap <silent> <C-d> :NERDTreeToggle<CR>
" This options disables the 'Bookmarks' label 'Press ? for help' text.
let NERDTreeMinimalUI=1
set wrap
" 起動時のメッセージを表示しない
set shortmess+=I
"同時タブ表示数
set tabpagemax=15
" ビープ音を鳴らさない
set vb t_vb=
" folding(折りたたみ)しない
set nofoldenable

"----------------------------------------------------
" コマンド関係
"----------------------------------------------------
" 入力中のコマンドをステータスに表示する
set showcmd
" コマンドライン補完を拡張モードにする
"set wildmenu
set wildmode=longest,list,full
"コマンドラインに使われるスクリーン上の行数。|hit-enter| プロンプトの出現を避けるのに役立つ。
"set cmdheight=2
set cmdheight=1

"----------------------------------------------------
" ステータスライン関係
"----------------------------------------------------
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに表示する情報の指定
set statusline=%F%m%r%h%w\ %=\ %y[%{&fileencoding},%{&ff}][%l/%L(%p%%),%v]
"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
        autocmd! InsertHook
        autocmd InsertEnter * highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=red
        autocmd InsertLeave * highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=gray
augroup END

"現在のモードを表示する。
"Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する。
set showmode

"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを有効にする
set autoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときにタブが対応する空白の数
set softtabstop=4
"シフト移動幅
set shiftwidth=4
"タブの代わりに空白文字を挿入する
set expandtab
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"----------------------------------------------------
" PHP
"----------------------------------------------------
" 'fileformat' を "unix" にしている場合、文字 '\r' が改行の前にあると、
" インデントは正しく行われない。
" これらの不要な文字を削除する
" (特にメッセージは表示されない)
let PHP_removeCRwhenUnix=1
" 文字列中のSQLをハイライトする
let php_sql_query=1
" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1

"----------------------------------------------------
"" カーソル位置記憶、undo効力、自動読み直し
"----------------------------------------------------
" ファイルタイプ別インデント、プラグインを有効にする
" カーソル位置を記憶する
if has("autocmd")
        filetype plugin indent on
        autocmd BufReadPost *
                                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                                \   exe "normal g`\"" |
                                \ endif
endif
"" バッファを切替えてもundoの効力を失わない
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"----------------------------------------------------
"" ショートカット,ファンクションキー
"----------------------------------------------------
" F5:CTRL-W > カレントウィンドウの幅を N（デフォルトは1）桁分増やす。
nnoremap <silent> <F5> <C-w>>
" F6:CTRL-W < カレントウィンドウの幅を N（デフォルトは1）桁分減らす。
nnoremap <silent> <F6> <C-w><
" F7:CTRL-W + カレントウィンドウの高さをN（デフォルトは1）行分高くする。
nnoremap <silent> <F7> <C-w>+
" F8:CTRL-W - カレントウィンドウの高さをN（デフォルトは1）行分低くする。
nnoremap <silent> <F8> <C-w>-
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"----------------------------------------------------
" yanktmp.vimの設定
"----------------------------------------------------
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"----------------------------------------------------
" タブ切り替え
"----------------------------------------------------
" Tab : 次のタブへ
"nnoremap <silent> <tab> :exe ":silent normal gt"<CR>
nnoremap <silent> <tab> :tabnext<cr>
" Shift + Tab : 前のタブへ
nnoremap <silent> <S-tab> :tabprevious<cr>

" -----------------------------------------------
" Align日本語幅広文字に対応する設定
" -----------------------------------------------
let g:Align_xstrlen=3

"neosnipet の設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/data/neosnippet'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"" go
"autocmd FileType go :highlight goErr cterm=bold ctermfg=214
"autocmd FileType go :match goErr /\<err\>/

let g:rails_statusline = 0
let g:padrino_statusline=0
"set clipboard=autoselect
set undodir=/tmp/vim/undo
" vim-surround
autocmd FileType php let b:surround_{char2nr("l")} = "{{ __('r') }}"

" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
"let g:blade_custom_directives_pairs = {
"      \   'markdown': 'endmarkdown',
"      \   'cache': 'endcache',
"      \ }
"
"let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
"let g:syntastic_check_on_save=1 "保存時にはチェック
"let g:syntastic_check_on_wq = 0 " wqではチェックしない
"let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
"let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
"set statusline+=%#warningmsg# "エラーメッセージの書式
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_javascript_checkers = ['eslint'] "ESLintを使う
"let g:syntastic_mode_map = {
"      \ 'mode': 'active',
"      \ 'active_filetypes': ['javascript'],
"      \ 'passive_filetypes': []
"      \ }
