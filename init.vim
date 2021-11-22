"Hello----there!.v3"
set number

set noexpandtab
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set cursorline

set laststatus=2
set hlsearch
set incsearch
set splitright

call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'cseelus/vim-colors-lucid'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'rafi/awesome-vim-colorschemes' 
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/home/kxcoze/conf/pynvim/bin/python3.8'                                          


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

map <F5> :vsp<CR>:w<CR>:term g++ % && ./a.out<CR>i
map <F6> :vsp<CR>:w<CR>:term python3 % <CR>i
"Jump to next/previous non-empty line
"nnoremap <Up> :<C-u>call search('^.\+', 'b')<CR>
"nnoremap <Down> :<C-u>call search('^.\+')<CR>

"noremap j k
"noremap k j
"
inoremap jj <Esc>
map <F7> :w<CR>
nnoremap <space> za
vmap cc :norm i#<CR>
vmap uc :norm ^x<CR>
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

ab #i #include
ab #d #define 
ab ifmain if __name__ == '__main__':<CR>main() <Left>
ab for_ for _ in range(int(input())):<CR><Left>
ab ab_ a, b = map(int, input().split())
ab abc_ a, b, c = map(int, input().split())
ab xyz_ x, y, z = map(int, input().split())
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1 " be a bit zalier about what to target
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
let g:syntastic_python_checkers = ['']
"--------------------------------------"

"------vim-cpp-enhanced-highlight------"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
"--------------------------------------"

"------Semshi-python-------------------"
let g:semshi#excluded_buffers = ['*']
let g:semshi#filetypes = ['python']
let g:semshi#excluded_hl_groups =  ['local']
let g:semshi#mark_selected_nodes = 1
let g:semshi#no_default_builtin_highlight = v:true

nmap <silent> <leader>rr :Semshi rename<CR>

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>

nmap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>

"------vim-flake8---------------------"
let g:flake8_show_in_file = 1
autocmd FileType python map <buffer> <F8> :call flake8#Flake8()<CR>
nnoremap <F9> :call flake8#Flake8ShowError()<cr>
