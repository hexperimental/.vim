
" this is so the backspace work as expected
set backspace=indent,eol,start
set encoding=utf-8
set nocompatible              " be iMproved, required
set mouse=a


"filetype off                  " required

" Only do this part when compiled with support for autocommands
if has("autocmd")
" Enable file type detection
 filetype on
 "Strips Trailing Whitespaces when writing the file
 autocmd BufWritePre *.module,*.js,*.inc,*.php,*.install :call Preserve("%s/\\s\\+$//e")
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Settings.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Keithbsmiley/swift.vim'
"Plugin 'toyamarinyon/vim-swift'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'file:///home/gmarik/path/to/plugin'
" Pass the path to set the runtimepath properly.
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" Plu
" Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'evidens/vim-twig'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'fholgado/minibufexpl.vim'
" Plugin 'tmhedberg/matchit'
Plugin 'tell-k/vim-browsereload-mac'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set yank registers to use systems clipboard
set clipboard=unnamed
" Coloring stuff
let g:solarized_termcolors=256
syntax on
set background=dark
colorscheme solarized

set ignorecase "Ignore case when searching
set smartcase
set incsearch "Make search act like search in modern browsers
set hlsearch
let @/ = "" " clear the fearch registry so shits no hl when loading file
set nolazyredraw "Don't redraw while executing macros 
set showmatch "Show matching bracets when text indicator is over them
set ttyscroll=3 " speed up scrolling
set ttyfast " Optimize for fast terminal connections
set lazyredraw " to avoid scrolling problems
set number
set nowrap "No wrapping.



"Highlight the 80, 120 columns
"=============================
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Setting up wrapping with linebreaks
set wrap linebreak nolist

" Replacing grep with ack
"set grepprg=ack

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab "Maintain indentation.

set ai "Auto indent
set si "Smart indet

" Filetypes
au BufRead,BufNewFile *.swift set filetype=swift
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.inc set filetype=php
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.php set filetype=php
au BufRead,BufNewFile *.css set filetype=css
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.rss, *.atom set filetype=xml

autocmd Filetype html set tabstop=4
autocmd Filetype html set softtabstop=4 
autocmd Filetype html set shiftwidth=4

autocmd Filetype css set tabstop=4
autocmd Filetype css set softtabstop=4 
autocmd Filetype css set shiftwidth=4

autocmd Filetype php set tabstop=4
autocmd Filetype php set softtabstop=4 
autocmd Filetype php set shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234


"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
"let g:indent_guides_space_guides = 0
"let g:indent_guides_color_change_percent = 90


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:syntastic_php_checkers = ["phpcs"]
let g:syntastic_php_phpcs_args = '--standard=/Users/webalab/Projects/utils/pulsesniffer/ '


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let mapleader = ","

nmap <leader>v :tabedit $MYVIMRC<CR>
" Mapping F5 to delete white spaces
nnoremap <silent> <F2> :%s/\r\(\n\)/\1/g<CR>
" Mapping F5 to delete white spaces
nnoremap <silent> <F4> :UltiSnipsEdit<CR>
nnoremap <silent> <F5> :FufFile<CR>
nnoremap <silent> <F6> :FufBuffer<CR>
"nnoremap <silent> <F5> :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap <silent> <F6> :call Preserve("normal gg=G")<CR>
nnoremap <silent> <F8> :source $MYVIMRC<CR>
nnoremap <silent> <F9> :SyntasticCheck<CR>
"nnoremap <silent> <F9> :!phpcs --standard=/Users/webalab/Projects/utils/pulsesniffer/ %<CR>
nnoremap <leader>h :nohl<CR>

"Moving splits with control+ hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Mapping W and Q
:command! W w
:command! Q q

nmap <leader><leader> :NERDTreeToggle<CR>
"mapping nerdtree to ,n
"nmap <leader>n :NERDTreeToggle<CR>

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


"Fix this: Works half-assed won't select  anything after the curso
map ww :call Preserve("normal vi'")<CR>
 

:vmap sp "zdi<?php <C-R>z ?><Esc> 
": wrap <?php ?> around visually selected text

nmap <leader>r :ChromeReload<CR>
nmap <leader>] :call Preserve(">>")<CR>
nmap <leader>[ :call Preserve("<<")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search n Find
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TODO
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg)
exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg.' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
endfunction
" call NERDTreeHighlightFile('.php', 'green', 'black')
" call NERDTreeHighlightFile('.html', 'green', 'black')
" call NERDTreeHighlightFile('.xml', 'gray', 'black')
" call NERDTreeHighlightFile('.css', 'green', 'black')
" call NERDTreeHighlightFile('.json', 'darkred', 'black')
" call NERDTreeHighlightFile('.twig', 'blue', 'black')

let NERDTreeHijackNetrw=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSniip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
:filetype plugin indent on

let g:snippets_dir = "~/.vim/bundle/vim-snippets/snippets"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline settings (Status bar)  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:Powerline_symbols = 'fancy'
let g:airline_theme='base16'
let g:airline_powerline_fonts = 0 
" this is to always show the status bar
set laststatus=2
"branch parts
let g:airline_enable_branch=1
""seperators ◀▶  « »  〈 〉 ◂▸◀ ◄◄  ⫷ ⫸  ◂▸  ❯❮
let g:airline_left_sep = '▸'
let g:airline_right_sep = '◂'
"modes
"let g:airline_section_b="%{fugitive#head()}"
let g:airline_section_y=""
let g:airline_section_gutter=""
let g:airline_detect_whitespace=0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shit i don't know wtf but don't have the ballz to delete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
 "This sets up the command to open files within the current file's path
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" map <leader>ew :e %%
" map <leader>es :sp %%
" map <leader>ev :vsp %%
" map <leader>et :tabe %%

 " Easier to type, and I never use the default behavior.
" noremap H ^
" noremap L $
" vnoremap L g_

"Add  shortcut to switch thru buffers
"
"Add cmd E to do find, election or word and highlight the results
"Add cmd g to flip thru results
"Add cmd G to flip thru reslts backwards

"Add shortcuts to navigate thru splits
"
"lk
 function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  let @/=_s
  call cursor(l, c)
 endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backups  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set backupcopy=yes
set backup
set noswapfile
"set undofile=yes

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap// 

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
 call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
 call mkdir(expand(&directory), "p")
endif


