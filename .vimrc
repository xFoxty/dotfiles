call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()
" --- 基础设置 ---
set spell spelllang=en_us
set nocompatible         " 关闭兼容模式
syntax on                " 开启语法高亮
set number               " 显示行号
set cursorline           " 高亮当前行
set encoding=utf-8       " 编码设置
set fileencodings=utf-8,ucs-bom,gb18030,latin1
set termguicolors        " 开启真彩色支持
set relativenumber  " 显示相对行号（强烈推荐）
set showmatch       " 光标在括号上时提示匹配
set scrolloff=3     " 光标离上下边缘至少 3 行
set hlsearch      " 搜索高亮
" --- 样式主题 ---
colorscheme gruvbox
set background=dark
" --- 缩进设置 ---
set tabstop=4            " Tab 宽度为 4
set shiftwidth=4         " 缩进宽度为 4
set expandtab            " Tab 转空格
set autoindent           " 自动缩进
set smartindent      " 智能缩进

" --- 搜索设置 ---
set hlsearch             " 高亮搜索结果
set incsearch            " 增量搜索
set ignorecase           " 搜索忽略大小写
set smartcase            " 搜索包含大写时开启精确匹配

" --- 状态栏 ---
set ruler                " 显示光标位置
set laststatus=2         " 总是显示状态栏

" --- 快捷键与交互 ---
let mapleader=" "
inoremap jj <Esc>
" 在插入模式用 Ctrl+h/j/k/l 移动光标
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
vnoremap <leader>j :m '>+1<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>k :m '<-2<CR>gv=gv
set clipboard=unnamed,unnamedplus   " 接入系统剪切板
" --- 其他---
nnoremap x "_x
set mouse=a            " 鼠标可用（可选）
set ttyfast            " 加速 redraw
set noswapfile         " 不要生成 .swp 临时文件
set undofile           " 持久化撤销
" --- 隐藏查看 ---
set list
set listchars=tab:→\ ,space:·,eol:↵
