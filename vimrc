" no vi-compatible
set nocompatible
set backspace=indent,eol,start
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cc=80
syntax on
"set mouse=a "设置鼠标支持
set nobackup "取消自动备份
setlocal noswapfile "不要生成swap文件
set bufhidden=hide "当buffer被丢弃时隐藏
set autoread "设置自动读取文件当外部文件被修改时
set showcmd "设置显示未完成的命令
"set sessionoptions+=resize "保存窗口大小
set ls=2
set number

" new add
set history=100				" 命令行历史记录的行数，可以用上下箭头选择
set smarttab
set wildmenu				" 命令行补全增强模式,在输入命令时列出匹配项目
set pumheight=15			" 插入模式下弹出补全菜单的最大显示项目数
set equalalways			" 窗口在分割或关闭某窗口时自动使用相同的尺寸
set scrolloff=6				" 光标所在行上下两侧最少保留的屏幕可见行数
set ignorecase				" 忽略大小写
set smartcase				" 如果搜索模式包含大写字母，忽略ignorecase
set incsearch				" 输入搜索命令时，实时显示匹配结果
set hlsearch				" 搜索时高亮显示被找到的结果
set noerrorbells			" 关闭错误信息响铃
set novisualbell			" 关闭代替鸣叫的可视响铃
filetype on				" 打开文件类型的侦测
filetype plugin on			" 打开特定文件类型时允许其相关插件文件的载入
filetype indent on			" 为特定的文件载入相应的缩进文件
set cindent
set autoindent				" 打开自动缩进，通常与smartindent同时打开
set smartindent				" 智能自动缩进
"set iskeyword+=_,$,@,%,#,-		" 将这些字符作为关键字，带有这些符号的单词不换行
" 插入括号时，短暂的跳转到匹配的对应括号，显示匹配的时间由matchtime决定
set showmatch
set matchtime=3				" 单位是十分之一秒
set matchpairs=(:),{:},[:],<:>		" 匹配括号的规则，增加针对html的<>
set shortmess+=I			" 启动时不显示介绍信息
set ruler				" 显示光标位置的行号和列号
set nosol				" 普通模式下光标行间移动时不到行首的第一个非空白，而是尽量在同一列
"set list				" 制表符显示方式
set display=lastline			" 解决自动换行格式下, 如折行之后高在超过窗口高度看不到最后一行的问题
set cursorline				" 设置光标十字坐标，高亮当前行
hi cursorline guibg=#333333		" 高亮当前行的背景颜色
set cursorcolumn			" 设置光标十字坐标，高亮当前列
hi CursorColumn guibg=#333333		" 高亮当前列的背景颜色
"set report=0				" 报告哪些行被修改过
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936,gbk,gb2312,gb18030,big5,latin1
"set ambiwidth=double
"set whichwrap+=<,>,h,l			" 使左右移动键在行首或行尾可以移动到前一行或下一行

"打开文件时，总是跳到退出之前的光标处
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

nmap <silent> <leader><cr> :noh<cr> "快速清除高亮搜索

" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest


"""""""""""""""""""""""""""""""""
"其他设置
"""""""""""""""""""""""""""""""""
" 保存代码文件前自动修改最后修改时间
au BufWritePre *.sh
	\ call TimeStamp('#')
au BufWritePre .vimrc,*.vim
	\ call TimeStamp('"')
au BufWritePre *.c,*.h
	\ call TimeStamp('*')
au BufWritePre *.cpp,*.hpp
	\ call TimeStamp('//')
au BufWritePre *.cxx,*.hxx
	\ call TimeStamp('//')
au BufWritePre *.java
	\ call TimeStamp('//')
au BufWritePre *.rb
	\ call TimeStamp('#')
au BufWritePre *.py
	\ call TimeStamp('#')
au BufWritePre Makefile
	\ call TimeStamp('#')
au BufWritePre *.php
	\ call TimeStamp('<?php //', '?>')
au BufWritePre *.html,*htm
	\ call TimeStamp('<!--', '-->')

" Last change用到的函数，返回时间，能够自动调整位置
function! TimeStamp(...)
	let sbegin = ''
	let send = ''
	if a:0 >= 1
		let sbegin = a:1.'\s*'
		if a:1 == '*'
			let sbegin = '\' . sbegin
		endif
	endif
	if a:0 >= 2
		let send = ' '.a:2
	endif
	let pattern = 'Last Change:.*'
		\. send
	let pattern = '^\s*' . sbegin . pattern . '\s*$'
	let now = strftime('%Y年%m月%d日 %H时%M分%S秒',
		\localtime())
	let row = search(pattern, 'n')
	if row != 0
		let curstr = getline(row)
		let col = match( curstr , 'Last')
		let leftcol = match(curstr,sbegin)
		let spacestr = repeat(' ',col - len(a:1)-leftcol)
		let leftspacestr = repeat(' ',leftcol)
		let now = leftspacestr . a:1 . spacestr . 'Last Change: '
			\. now . send
		call setline(row, now)
	endif
endfunction


"""""""""""""""""""""""
"自动去除行末空白
"""""""""""""""""""""""
" Remove trailing whitespace when writing a buffer, but not " for diff files.
" From: Vigil <vim5632@rainslide.net>
function RemoveTrailingWhitespace()
    if &ft != "diff"
    let b:curcol = col(".")
    let b:curline = line(".")
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
