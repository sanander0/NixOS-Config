{ config, pkgs, ... }:

{
  home.file.".config/nvim/init.vim".text = ''
" 1. Отключаем termguicolors — чтобы Vim использовал цвета ТВОЕГО терминала
set termguicolors&   " сбрасываем на дефолт
set notermguicolors

set clipboard=unnamedplus

" 2. Указываем, что фон должен быть от терминала
set background=dark   " или light, если у тебя светлый терминал

" 3. Убираем фон у основных групп (чтобы был прозрачный фон терминала)
highlight Normal ctermbg=NONE guibg=NONE
highlight NormalFloat ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight FoldColumn ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE

" 4. Если используешь Neo-tree, NvimTree, Telescope и т.п. — добавь эти строки:
highlight NeoTreeNormal ctermbg=NONE guibg=NONE
highlight NeoTreeNormalNC ctermbg=NONE guibg=NONE
highlight TelescopeNormal ctermbg=NONE guibg=NONE
highlight TelescopeBorder ctermbg=NONE guibg=NONE

" 5. Чтобы фон не появлялся снова после смены темы (colorscheme)
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NormalFloat ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

" 6. Выбираем простую тему (по желанию)
colorscheme default     " или habamax, industry, pablo, desert

" Кодировка UTF-8
set encoding=utf8

" Отключение совместимости с vi. Нужно для правильной работы некоторых опций
set nocompatible

" Игнорировать регистр при поиске
set ignorecase

" Не игнорировать регистр, если в паттерне есть большие буквы
set smartcase

" Подсвечивать найденный паттерн
set hlsearch

" Интерактивный поиск
set incsearch

" Размер табов - 2
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Превратить табы в пробелы
set expandtab

" Таб перед строкой будет вставлять количество пробелов определённое в shiftwidth
set smarttab

" Копировать отступ на новой строке
set autoindent
set smartindent

" Показывать номера строк
set number

" Относительные номера строк
set relativenumber

" Автокомплиты в командной строке
set wildmode=longest,list

" Подсветка синтаксиса
syntax on

" Разрешить использование мыши
set mouse=a

" Использовать системный буфер обмена
set clipboard=unnamedplus

" Быстрый скроллинг
set ttyfast

" Курсор во время скроллинга будет всегда в середине экрана
set so=30

" Встроенный плагин для распознавания отступов
filetype plugin indent on
  '';

}
