"Hello-there!.v2"
set number
set expandtab
set tabstop=3
set laststatus=2
set hlsearch
set incsearch

call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
call plug#end() 

colorscheme gruvbox

"--------------MAPPING--------------"
"Deleting <, ^, v, > keys from n, v, s, o-modes 
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"Execute :x in cmd-line, when Esc pressed.
inoremap <Esc> <nop>
"noremap <Esc> <Cmd>:x<cr>


"Jump to next/previous non-empty line
"nnoremap <Up> :<C-u>call search('^.\+', 'b')<CR>
"nnoremap <Down> :<C-u>call search('^.\+')<CR>

"noremap j k 
"noremap k j


inoremap jj <Esc>
"------------------------------------"

"------------vim-easymotion----------"
let g:easymotion_leader_key = '\'
nmap s <Plug>(easymotion-s2)
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1   " be a bit zalier about what to target
let g:EasyMotion_do_shade = 1
let g:EasyMotion_inc_highlight = 1
let g:EasyMotion_move_highlight = 1
let g:EasyMotion_landing_highlight = 1
"-------------------------------------"

"-In-development--syntastic-----------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"--------------------------------------"
