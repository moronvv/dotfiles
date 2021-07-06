" plug {{{
call plug#begin()

" themes
Plug 'sainnhe/gruvbox-material'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'arcticicestudio/nord-vim'

" statusline
Plug 'itchyny/lightline.vim'

" operator-pending
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" search/replace
Plug 'tpope/vim-abolish'
Plug 'nelstrom/vim-visual-star-search'
Plug 'romainl/vim-cool'

" session
Plug 'tpope/vim-obsession'

" git
Plug 'tpope/vim-fugitive'

" keyboard layout
Plug 'lyokha/vim-xkbswitch'

" netrw
Plug 'tpope/vim-vinegar'

" ide
Plug 'neoclide/coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'neovimhaskell/haskell-vim'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" closers
Plug 'rstacruz/vim-closer'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/tagalong.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" other
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
" }}}

" theme {{{
syntax on
set background=dark
let g:gruvbox_material_palette = 'original'
colorscheme gruvbox-material
hi Normal                       ctermbg=NONE guibg=NONE
hi EndOfBuffer                  ctermbg=NONE guibg=NONE
hi LineNr                       ctermbg=NONE guibg=NONE
hi SignColumn                   ctermbg=NONE guibg=NONE
hi CursorLineNr                 ctermbg=NONE guibg=NONE
hi StatusLineNC                 ctermfg=NONE guibg=NONE
hi VertSplit                    ctermbg=NONE guibg=NONE
hi RedSign                      ctermbg=NONE guibg=NONE ctermfg=167 guifg=#fb4934
hi YellowSign                   ctermbg=NONE guibg=NONE ctermfg=208 guifg=#fe8019
hi BlueSign                     ctermfg=NONE guibg=NONE ctermfg=109 guifg=#83a598
hi AquaSign                     ctermbg=NONE guibg=NONE ctermfg=108 guifg=#8ec07c
hi CocGitAddedSign              guifg=#00875f ctermfg=2
hi CocGitChangedSign            guifg=#ffff00 ctermfg=3
hi CocGitRemovedSign            guifg=#ff5f00 ctermfg=2
hi CocGitTopRemovedSign         guifg=#ff5f00 ctermfg=2
hi CocGitChangeRemovedSign      guifg=#0087ff ctermfg=4
hi link HighlightedyankRegion Substitute
" }}}

" lightline {{{
set laststatus=2
set noshowmode

let g:lightline = {
      \  'colorscheme': 'gruvbox_material',
      \  'active': {
      \    'left':  [
      \               [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'filename', 'modified' ],
      \               ['coclintstatus', 'cocstatus'],
      \             ],
      \    'right': [
      \               [ 'lineinfo' ],
      \               [ 'filetype' ],
      \             ]
      \  },
      \  'component_function': {
      \    'lint_status': 'CocCurrentFunction',
      \    'gitbranch': 'LightlineGitBranch',
      \    'filetype': 'LightlineFiletype',
      \    'fileformat': 'LightlineFileformat',
      \    'fileencoding': 'LightlineFileencoding',
      \    'coclintstatus': 'LightlineCocLintStatus',
      \    'cocstatus': 'LightlineCocStatus',
      \  },
      \  'component_expand': {
      \    'buffers': 'lightline#bufferline#buffers',
      \  },
      \  'component_type': {
      \    'buffers': 'tabsel',
      \  }
      \ }

function! LightlineGitBranch() abort
  return get(g:, 'coc_git_status', '')
endfunction
function! LightlineSleuth()
  return SleuthIndicator()
endfunction
function! LightlineFileformat()
  return winwidth(0) > 90 ? &fileformat : ''
endfunction
function! LightlineFiletype()
  return &filetype !=# '' ? &filetype : 'no ft'
endfunction
function! LightlineFileencoding()
  return winwidth(0) > 90 ? &encoding : ''
endfunction
function! LightlineCocLintStatus()
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, '×' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, '•' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction
function! LightlineCocStatus()
  return winwidth(0) > 120 ? get(g:, 'coc_status', '') : ''
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" }}}

" general {{{
" buffers
set hidden
set autowriteall
set splitright
set splitbelow
set nobackup
set nowritebackup
set noswapfile
set autoread

" save undo history
set undofile
set undodir=~/.config/nvim/undodir

" line numbers
set number
set relativenumber

" search highlight
set hlsearch
set incsearch
set inccommand=nosplit

" fold
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" other
set history=1000
set encoding=utf-8
set mouse=a
set lazyredraw
set nrformats=
set scrolloff=1
set updatetime=200
set shortmess+=c
set signcolumn=yes
set fillchars+=vert:\| 
set fcs=eob:\ 

let mapleader = ' '

" code format
filetype plugin indent on
set linebreak
set smartindent
set autoindent

" change window remap
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" autowrite on buf leave
au FocusLost,WinLeave * :silent! noautocmd wa

" truecolors
set termguicolors

" transparency
set pumblend=10
set winblend=10
" }}}

" spellcheck {{{
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=ru_ru,en_us
" }}}

" netrw {{{
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  nnoremap <buffer> <c-l> :wincmd l<cr>
endfunction
" }}}

" coc {{{
" python3 provider
let g:python3_host_prog='$HOME/.pyenv/versions/py3nvim/bin/python'

let g:coc_global_extensions = [
  \  'coc-yank',
  \  'coc-sql',
  \  'coc-git',
  \  'coc-lists',
  \  'coc-marketplace',
  \  'coc-prettier',
  \  'coc-emmet',
  \  'coc-yank',
  \  'coc-pyright',
  \  'coc-snippets',
  \  'coc-sh',
  \  'coc-docker',
  \  'coc-html',
  \  'coc-yaml',
  \  'coc-json',
  \  'coc-tsserver',
  \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-e> coc#refresh()

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [p <Plug>(coc-diagnostic-prev)
nmap <silent> ]p <Plug>(coc-diagnostic-next)

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
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  :Format<CR>

" Set interpreter
nmap <leader>si :CocCommand python.setInterpreter<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>qa  :CocAction<CR>

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <leader>gi <Plug>(coc-git-chunkinfo)
" undo current chunk diff
nmap <leader>gu :CocCommand git.chunkUndo<CR>

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ws  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Fuzzy find files.
nnoremap <silent><nowait> <M-p>     :<C-u>CocList mru<CR>
" Fuzzy find files.
nnoremap <silent><nowait> <C-p>     :<C-u>CocList files<CR>
" Fuzzy find grep.
nnoremap <silent><nowait> <space>p  :<C-u>CocList grep<CR>
" }}}

" python {{{
autocmd FileType python nnoremap <buffer> <leader>b Oimport ipdb; ipdb.set_trace()<Esc> " pdb
" }}}

" indentLine {{{
autocmd Filetype json let g:indentLine_setConceal = 0
autocmd FileType markdown let g:indentLine_enabled = 0
" }}}

" markdown {{{
autocmd FileType markdown let g:conceallevel = 0
" }}}

" tmux navigator {{{
let g:tmux_navigator_save_on_switch = 2
" }}}

" fugitive {{{
set diffopt+=vertical
nmap <leader>gs :Git<CR>
" }}}

" xkb-switch {{{
let g:XkbSwitchEnabled = 1
" }}}

" treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
require'treesitter-context.config'.setup{
    enable = true,
}
EOF
" }}}

" vim:fdm=marker
" vim:foldenable
