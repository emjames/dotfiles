" Emjames init.vim file
"

set nocompatible 	" disable compatibility with vi
filetype off            " required for bundler 
"vim-plug
"set rtp+=~/.config/
call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
" Python coc-jedi
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

" All plugins must be added before the following line
call plug#end()
"
filetype plugin indent on " required

" vimrc
set cursorcolumn    " show which column the cursor is at
set cursorline      " show which line the cursor is at
set showmatch 		" show matching brackets
set ignorecase
set mouse=v		    " middle click mouse is paste
set hlsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set relativenumber
" set wildmode=longest,list
set incsearch
set cc=80		    " set an 80 col limit 
" set textwidth=80
set nowrap
augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType tex setlocal wrap
augroup END
" set linebreak
syntax on
" colorscheme codedark
colorscheme gruvbox
" colorscheme mars
let mapleader=" "
let maplocalleader="\\"
" change the shape of the cursor in different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Coc configs
"
" TextEdit might fail if hidden is not set
set hidden
" Some servers have issues with backup files
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" Give more space for displaying messages
set cmdheight=2

" lower updatetime, better user experience
set updatetime=300

" Don't pass messages to |ins-competion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text after 
" diagnostics appear/become resolved
set signcolumn=yes

" comment highlight
autocmd FileType json syntax match Comment +\/\/.\+$+

" tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

if has('nvim-0.4.3') || has('patch-8.2.0750')
    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    " Scroll full page. Modify #scroll(1, 1) to scroll by one line
    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif

" use <c-r> to confirm completion `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ========================================
" Statusline
" ========================================
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
hi StatusLine cterm=bold ctermfg=white ctermbg=24
set statusline=
set statusline+=%0*\ %n\      " buffer number
set statusline+=%0*\ %f
set statusline+=%=
set statusline+=%c,
set statusline+=%l
" set statusline+=%l/%L " line/total_line
set statusline+=%5*\%{FugitiveStatusline()}
" set statusline+=%5*\%{GitBranch()}
" set statusline+=%1*\ (%p%%)
set statusline+=%1*\ 
" set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}
" set statusline+=\ %{coc#status()}

function! GitBranch()
  if !exists("!git")
    return "BRANCH"
endfunction
" ========================================
" Colors
" ========================================
" statusline
hi User5 ctermfg=Yellow ctermbg=24
" ========================================
" Mappings 
" ========================================
" Mappings Emjames
nmap <C-b> :NERDTreeToggle<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" map <C-Shift><f>
" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" ========================================
" fzf commands
" ========================================
" Windows
nnoremap <leader>w :Windows<CR>
nnoremap <leader>bu :Buffers<CR>
nnoremap <leader>fi :Files<CR>

" Project search
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>ff :call fzf#run()<CR>
"
" Project Refactor Word
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" nnoremap <silent> <C-f> :Files<CR>

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ========================================
" Modelica
" ========================================
au BufRead,BufNewFile *.mo set filetype=modelica
au filetype modelica setlocal tabstop=2 softtabstop=2 shiftwidth=2

" ========================================
" [au]tocmd
" ========================================
au filetype tex setlocal tabstop=2 softtabstop=2 shiftwidth=2

" ========================================
" Vimtex configuration
" ========================================
" let g:latex_view_general_viewer='zathura'
let g:vimtex_view_method='zathura'
let g:tex_flavor='latex'
nmap <C-n> :VimtexTocOpen<CR>
