"插件管理
"Vundle Section Start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" ADD YOUR PLUGIN
Plugin 'VundleVim/Vundle.vim'
" Plugin 'VundleVim/Vundle.vim'               " required
Plugin 'scrooloose/nerdtree'                " file/directory treee
Plugin 'scrooloose/nerdcommenter'           " code commenter
Plugin 'kien/ctrlp.vim'                     " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'altercation/vim-colors-solarized'   " solarized theme
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on
"Vundle Section End

" nerd tree toggle 
" 文件树 
nmap ff :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <silent><C-c> :close<CR>

" nerd commenter
let g:NERDSpaceDelims=1
map cc          <plug>NERDCommenterComment<CR>
map cu          <plug>NERDCommenterUncomment<CR>
map cs          <plug>NERDCommenterSexy<CR>
map ci          <plug>NERDCommenterInvert<CR>
map cy          <plug>NERDCommenterYank<CR>
map ce          <plug>NERDCommenterToEOL<CR>
map c<space>    <plug>NERDCommenterToggle<CR>

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

set helplang=cn  
set encoding=utf-8  
set cscopequickfix=s-,c-,d-,i-,t-,e-  
let g:miniBufExplMapCTabSwitchBufs = 1  
let g:miniBufExplMapWindowNavVim = 1  
let g:miniBufExplMapWindowNavArrows = 1  
nnoremap <silent> <F12> :A<CR>  
nnoremap <silent> <F3> :Grep<CR>  
let g:SuperTabRetainCompletionType=2  
let g:SuperTabDefaultCompletionType="<C-X><C-O>"  
" 自动语法高亮  
 syntax on  
" 检测文件类型  
filetype on  
" 显示行号  
set number  
" 上下可视行数  
set scrolloff=6  
" replace tab with space  
set expandtab  
" 设定 tab 长度为 4  
set tabstop=4  
" 设置按BackSpace的时候可以一次删除掉4个空格  
set softtabstop=4  
" 设定 << 和 >> 命令移动时的宽度为 4  
set shiftwidth=4  
set smarttab  
set history=512 
" 不突出显示当前行  
set nocursorline  
" 覆盖文件时不备份  
set nobackup  
" 自动切换当前目录为当前文件所在的目录  
set autochdir  
set smartcase  
" 实时搜索  
set incsearch  
" 搜索时高亮显示被找到的文本  
set hlsearch  
" 关闭错误声音  
set noerrorbells  
set novisualbell  
"set t_vb=  
  
" 不自动换行  
"set nowrap  
"How many tenths of a second to blink  
set mat=2  
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存  
set hidden  
" 智能自动缩进  
set smartindent  
" 设定命令行的行数为 1  
set cmdheight=1  
" 显示状态栏 (默认值为 1, 无法显示状态栏)  
set laststatus=2  
"显示括号配对情况  
set showmatch  
  
" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题  
set display=lastline  
" 设置在状态行显示的信息  
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)  
  
"启动时不显示 捐赠提示  
set shortmess=atl  
  
"blank      空白  
"buffers    缓冲区  
"curdir     当前目录  
"folds      折叠  
"help       帮助  
"options    选项  
"tabpages   选项卡  
"winsize    窗口大小  
"slash      转换文件路径中的\为/以使session文件兼容unix  
"unix       设置session文件中的换行模式为unix  
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize  
  
" 允许backspace和光标键跨越行边界  
set whichwrap+=<,>,h,l  
" backspace  
set backspace=eol,start,indent  
  
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）  
set selection=exclusive  
set selectmode=mouse,key  
  
" 高亮显示匹配的括号  
set showmatch  
  
" 匹配括号高亮的时间（单位是十分之一秒）  
set matchtime=5  
  
"编码设置  
set enc=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936  
  
" set mapleader  
let mapleader=","  
  
" 选中状态下 Ctrl+c 复制  
vnoremap <c-c> "+y  
  
" Ctrl+v  
nmap <silent> <C-v> "+p  
  
" 窗口切换  
nnoremap <c-h> <c-w>h  
nnoremap <c-l> <c-w>l  
nnoremap <c-j> <c-w>j  
nnoremap <c-k> <c-w>k  
  
" 插入模式下上下左右移动光标  
inoremap <c-h> <left>  
inoremap <c-l> <right>  
inoremap <c-j> <c-o>gj  
inoremap <c-k> <c-o>gk  
  
" Ctrl+s  
" If the current buffer has never been saved, it will have no name,  
" call the file browser to save it, otherwise just save it.  
"nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>  
"imap <c-s> <c-o><c-s><CR>  
" Use CTRL-S for saving, also in Insert mode  
nmap <C-S> :update<CR>  
vmap <C-S> <C-C>:update<CR>  
imap <C-S> <C-O>:update<CR>  
  
autocmd BufRead,BufNew :call UMiniBufExplorer  
  
  
"AutoClose  
"let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}  
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}   

"vim plugin setting

"======================"
set tags=tags
set tags+=~/.vim/my-tags/tags
set tags+=~/.vim/my-tags/stl-tags
set tags+=~/.vim/my-tags/sys-tags
set autochdir
"Update ctags
map <silent> <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>

""""""""""""""""""""""""""""""
   " Tag list (ctags)
""""""""""""""""""""""""""""""
"if MySys() == "windows"                "设定windows系统中ctags程序的位置
"   let Tlist_Ctags_Cmd = 'ctags'
"elseif MySys() == "linux"              "设定Linux系统中ctags程序的位置
   let Tlist_Ctags_Cmd = '/home/sphinx/.vim/ctags-5.8/ctags'
"endif

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0         "在右侧窗口中显示taglist窗口
let Tlist_OnlyWindow=1

set cursorline
set cul
set cursorcolumn
set cuc
"允许折叠
set foldenable
"根据语法折叠
set fdm=syntax
"设置键盘映射，通过空格设置折叠
" nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
nnoremap <space> zi
"浅色显示当前行
autocmd InsertLeave * se nocul
"用浅色高亮当前行
autocmd InsertEnter * se cul
"没有保存或文件只读时弹出确认
set confirm
"注释换行补全
set fo=r
ab  mymail <Guangzhao_Shi@163.com>

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

"括号补全
imap ( ()<LEFT>
imap （ （）<LEFT>
imap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ” “ ”<LEFT>
inoremap ' ''<LEFT>
imap /* /*<SPACE><SPACE>*/<LEFT><LEFT><LEFT>
imap { {}<LEFT>
autocmd FileType c,h,cpp,java,sh  exec ":call ChangeMap()"
func! ChangeMap()
    iunmap {
    imap { {}<LEFT><CR><UP><END><CR>
endfunc

"set clipboard=unnamed

" .c,.cpp,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.sh,*.java,*.py exec ":call SetTitle()" 
"定义函数SetTitle，自动插入文件头 
func SetTitle() 
"如果文件类型为.sh文件 
if &filetype == 'sh' 
    call setline(1,"\#########################################################################") 
    call append(line("."), "\# File Name: ".expand("%")) 
    call append(line(".")+1, "\# Author: ShiGuangzhao") 
    call append(line(".")+2, "\# mail: Guangzhao_Shi@163.com") 
    call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
    call append(line(".")+4, "\#########################################################################") 
    call append(line(".")+5, "\#!/bin/bash") 
    call append(line(".")+6, "") 
elseif expand("%:e") == 'py' 
    call setline(1, "\#!/usr/bin/python3") 
    call append(line("."), "\# -*- coding: utf-8 -*-") 
    call append(line(".")+1, "") 
else 
    call setline(1, "/*************************************************************************") 
    call append(line("."), "    > File Name: ".expand("%")) 
    call append(line(".")+1, "    > Author: ShiGuangzhao") 
    call append(line(".")+2, "    > Mail: Guangzhao_Shi@163.com ") 
    call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
    call append(line(".")+4, " ************************************************************************/") 
    call append(line(".")+5, "")
endif
if expand("%:e") == 'hpp' 
    call append(line(".")+6, "#ifndef _".toupper(expand("%:t:r"))."_H_CPP")
    call append(line(".")+7, "#define _".toupper(expand("%:t:r"))."_H_CPP")
    call append(line(".")+8, "")
    call append(line(".")+9, "#endif /* ".toupper(expand("%:t:r"))."_H_CPP */")
elseif expand("%:e") == 'h' 
    " call append(line(".")+10, "#pragma once") 
    call append(line(".")+6, "#ifndef _".toupper(expand("%:t:r"))."_H_C")
    call append(line(".")+7, "#define _".toupper(expand("%:t:r"))."_H_C")
    call append(line(".")+8, "")
    call append(line(".")+9, "#endif /* ".toupper(expand("%:t:r"))."_H_C */")
elseif &filetype == 'c'
    call append(line(".")+6, "#include <stdio.h>")
    call append(line(".")+7, "")
elseif &filetype == 'cpp'
    call append(line(".")+6, "#include <iostream>")
    " call append(line(".")+7, "using std::cin;")
    " call append(line(".")+8, "using std::cout;")
    " call append(line(".")+9, "using std::endl;")
    call append(line(".")+7, "")
endif
endfunc 
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
"nnoremap <C-F2> :vert diffsplit 
"新建标签  
" map <M-F2> :tabnew<CR>  
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

"C，C++ 按F8运行当前目录
map <F8> :call FileRunGcc()<CR>
func! FileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -o test ./*.o"
        exec "! ./test"
    elseif &filetype == 'cpp'
        exec "!g++ -o test ./*.o"
        exec "! ./test"
    endif
endfunc

"C,C++的调试
" map <F8> :call Rungdb()<CR>
" func! Rungdb()
    " exec "w"
    " exec "!g++ % -g -o %<"
    " exec "!gdb ./%<"
" endfunc
"搜索忽略大小写
" set ignorecase
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
"nnoremap <C-F2> :vert diffsplit 
"新建标签  
" map <M-F2> :tabnew<CR>  

"C，C++ 按Ctrl_F5 调试
map <C-F5> :call BuildRunGcc()<CR>
func! BuildRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -c %"
    elseif &filetype == 'cpp'
        exec "!g++ -c %"
    endif
endfunc


"历史记录
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufNewFile *.m exec ":call MatlabFun()" 
".m文件自动补全
func! MatlabFun()
imap if<SPACE> if<CR>end<UP><END><space>
imap fo<SPACE> for<space><CR>end<UP><END>
inoremap el<SPACE> elseif<SPACE>
endfunc 
set completeopt-=preview

" if has("autocmd")
       " autocmd BufNewFile,Bufread *.txt set syntax=help
" endif

" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan

" 显示Tab符
" set list
" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0

