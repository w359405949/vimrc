filetype on				" 打开文件类型的侦测
filetype plugin on			" 打开特定文件类型时允许其相关插件文件的载入
filetype indent on			" 为特定的文件载入相应的缩进文件
syntax on

set nocompatible
set backspace=indent,eol,start
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cc=80
"set mouse=a "设置鼠标支持
set nobackup "取消自动备份
setlocal noswapfile "不要生成swap文件
set bufhidden=hide "当buffer被丢弃时隐藏
set autoread "设置自动读取文件当外部文件被修改时
set showcmd "设置显示未完成的命令
"set sessionoptions+=resize "保存窗口大小
set ls=2
set number
set history=100				" 命令行历史记录的行数，可以用上下箭头选择
set smarttab
set wildmenu				" 命令行补全增强模式,在输入命令时列出匹配项目
set wildmode=list:longest
set pumheight=15			" 插入模式下弹出补全菜单的最大显示项目数
set equalalways			" 窗口在分割或关闭某窗口时自动使用相同的尺寸
set scrolloff=6				" 光标所在行上下两侧最少保留的屏幕可见行数
set ignorecase				" 忽略大小写
set smartcase				" 如果搜索模式包含大写字母，忽略ignorecase
set incsearch				" 输入搜索命令时，实时显示匹配结果
set hlsearch				" 搜索时高亮显示被找到的结果
set noerrorbells			" 关闭错误信息响铃
set novisualbell			" 关闭代替鸣叫的可视响铃
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
set cursorcolumn			" 设置光标十字坐标，高亮当前列
"set report=0				" 报告哪些行被修改过
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936,gbk,gb2312,gb18030,big5,latin1
"set ambiwidth=double
"set whichwrap+=<,>,h,l			" 使左右移动键在行首或行尾可以移动到前一行或下一行


"""""""""""""""""""""""""""""""""
"打开文件时，总是跳到退出之前的光标处
"""""""""""""""""""""""""""""""""
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

nmap <silent> <leader><cr> :noh<cr> "快速清除高亮搜索

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



""""""""""""""""""""""""""""""""""
" Vim color file
" """""""""""""""""""""""""""""""
" Maintainer: Marco Peereboom <slash@peereboom.us>
" Last Change: 2013年10月04日 02时24分36秒
" Licence: Public Domain
" Try to emulate standard colors so that gvim == vim
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "putty2"

hi Normal guifg=White guibg=Black
hi ErrorMsg guibg=Red guifg=White
hi IncSearch gui=reverse
"hi ModeMsg
hi StatusLine gui=reverse
hi StatusLineNC gui=reverse
hi VertSplit gui=reverse
"hi Visual gui=reverse guifg=Red guibg=fg
hi Visual gui=reverse guifg=White guibg=Black
hi VisualNOS gui=underline
hi DiffText guibg=Red
hi Cursor guibg=#004080 guifg=NONE
hi lCursor guibg=Cyan guifg=NONE
hi Directory guifg=Blue
hi LineNr guifg=#BBBB00
hi MoreMsg guifg=SeaGreen
hi NonText guifg=Blue guibg=Black
hi Question guifg=SeaGreen
"hi Search guibg=#BBBB00 guifg=NONE
hi Search guibg=#DDDD00 guifg=NONE
hi SpecialKey guifg=Blue
hi Title guifg=Magenta
hi WarningMsg guifg=Red
hi WildMenu guibg=Cyan guifg=Black
hi Folded guibg=White guifg=DarkBlue
hi FoldColumn guibg=Grey guifg=DarkBlue
hi DiffAdd guibg=LightBlue
hi DiffChange guibg=LightMagenta
hi DiffDelete guifg=Blue guibg=LightCyan
hi Comment guifg=Blue guibg=Black
hi Constant guifg=#BB0000 guibg=Black
hi PreProc guifg=#BB00BB guibg=Black
hi Statement gui=NONE guifg=#BBBB00 guibg=Black
hi Special guifg=#BB00BB guibg=Black
hi Ignore guifg=Grey
hi Identifier guifg=#00BBBB guibg=Black
hi Type guifg=#00BB00 guibg=Black
hi CursorLine gui=reverse " 高亮当前行的背景颜色
hi CursorColumn gui=reverse " 高亮当前列的背景颜色
hi WhitespaceEOL ctermbg=red guibg=red

match WhitespaceEOL /\s\+$/

hi link IncSearch Visual
hi link String Constant
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Number
hi link Function Identifier
hi link Conditional Statement
hi link Repeat Statement
hi link Label Statement
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
