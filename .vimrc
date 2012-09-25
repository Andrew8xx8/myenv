 set nowrap

 " Поиск будет учитывать регистр только если в строке поиска присутствую
 " заглавные буквы
 set ignorecase
 set smartcase

 set nobackup
 set history=50
 set ve=all

 set background=dark

 " Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится
 set nocompatible               " be iMproved
 filetype off                   " required!

 " Показывать незавершённые команды в статусбаре
 set showcmd
 
 " Включаем нумерацию строк
 set number

 " Кодировка текста по умолчанию
 set encoding=utf8
 set fileencoding=utf8
 set termencoding=utf8

 " Не выгружать буфер, когда переключаемся на другой
 " Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
 " когда переключаешься между ними
 set hidden

 " Скрыть панель в gui версии ибо она не нужна
 set guioptions-=T

 " Сделать строку команд высотой в одну строку
 set ch=1

 " Скрывать указатель мыши, когда печатаем
 set mousehide
          
 " Преобразование пробелов в табы
 set noexpandtab

 set rtp+=~/.vim/bundle/vundle/

 " Размер табулации по умолчанию
 set shiftwidth=4
 set softtabstop=4
 set tabstop=4

 " Формат строки состояния
 set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
 set laststatus=2
 
 " Fix <Enter> for comment
 set fo+=cr
 
 " Опции сесссий
 set sessionoptions=curdir,buffers,tabpages

 " Правильный мапинг кирилицы через imap.
 " Переключиться на Русский можно только в режиме вставки
 " Ctrl + ^
 set keymap=russian-jcukenwin
 set iminsert=0
 set imsearch=0
 highlight lCursor guifg=NONE guibg=Cyan

 " F5 - просмотр списка буферов
 nmap <F5> <Esc>:BufExplorer<cr>
 vmap <F5> <esc>:BufExplorer<cr>
 imap <F5> <esc><esc>:BufExplorer<cr>
 
 map <F8> :TlistToggle<cr>
 vmap <F8> <esc>:TlistToggle<cr>
 imap <F8> <esc>:TlistToggle<cr>

 " F10 - удалить буфер
 map <F10> :bd<cr>
 vmap <F10> <esc>:bd<cr>
 imap <F10> <esc>:bd<cr>

 :au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

 " Слова откуда будем завершать
 set complete=""
 " Из текущего буфера
 set complete+=.
 " Из словаря
 set complete+=k
 " Из других открытых буферов
 set complete+=b
 " из тегов
 set complete+=t

 au BufRead,BufNewFile *.phps set filetype=php
 au BufRead,BufNewFile *.thtml set filetype=php
 au BufRead,BufNewFile *.pl set filetype=perl
 au BufRead,BufNewFile *.pm set filetype=perl
 au BufRead,BufNewFile *.rb set filetype=ruby
 au BufRead,BufNewFile *.hrl set filetype=erlang
 au BufRead,BufNewFile *.scss set filetype=sass
 au BufNewFile,BufRead *.php let b:optionsset=0
 au BufNewFile,BufRead *.php let b:PHP_autoformatcomment=0

 au FileType perl set iskeyword=@,48-57,_,192-255,:
 au BufReadPost cd %:h

 au FileType ruby,scss,cucumber set shiftwidth=2
 au FileType ruby,scss,cucumber set softtabstop=2
 au FileType ruby,scss,cucumber set tabstop=2

 set completeopt-=preview
 set completeopt+=longest
 set mps-=[:]

 set viminfo='10,\"100,:20,%,n~/.viminfo

 hi clear

 if exists("syntax_on")
 	syntax reset
 endif

 " some fixes for theme
 hi Pmenu ctermfg=11 ctermbg=none
 hi Error ctermfg=white	guifg=white

 highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
 
 set mouse=v
 set mousemodel=popup

 set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.scssc,*.sassc

 inoremap  <Up>     <NOP>
 inoremap  <Down>   <NOP>
 inoremap  <Left>   <NOP>
 inoremap  <Right>  <NOP>
 noremap   <Up>     <NOP>
 noremap   <Down>   <NOP>
 noremap   <Left>   <NOP>
 noremap   <Right>  <NOP>

 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...
 Bundle 'cleanphp'
 Bundle 'Zenburn'
 Bundle 'bufexplorer.zip' 
 Bundle 'The-NERD-tree'
 Bundle 'Syntastic'  
 " Ctrl + r для нечёткого поиска по файлам
 "nmap <C-r> <Esc>:FufFile<cr>
 "vmap <C-r> <esc>:FufFile<cr>
 "imap <C-r> <esc><esc>:FufFile<cr>
 
 " Ctrl + r для нечёткого поиска по файлам
 nmap <C-r> <Esc>:FufFileWithCurrentBufferDir<cr>
 vmap <C-r> <esc>:FufFile<cr>
 imap <C-r> <esc><esc>:FufFile<cr>

 " Map NERDTree to \p
 nmap <silent> <Leader>p :NERDTreeToggle<CR>
 
 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

 colorscheme zenburn
