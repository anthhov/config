" Show line numbers in the gutter.
set number
" Make line numbers relative.
set relativenumber
" Enable mouse in all modes (normal, visual, insert, command-line).
set mouse=a
" Always show the status line (lightline replaces the default one).
set laststatus=2
" Display tabs as 4 columns wide.
set tabstop=4
" Use spaces instead of tab characters when pressing Tab.
set expandtab
" Indent with 4 spaces (>> and <<, autoindent).
set shiftwidth=4
" Copy indent from the previous line when starting a new line.
set autoindent
" Case-insensitive search unless the pattern contains uppercase.
set ignorecase
" Override ignorecase when the search pattern has uppercase letters.
set smartcase
" Show tab-completion candidates in a menu below the command line.
set wildmenu
" Create folds based on indent depth.
set foldmethod=indent
" Start with all folds open (99 = effectively no folding on open).
set foldlevel=99

" Strip trailing whitespace from the whole buffer before each save.
autocmd BufWritePre * :%s/\s\+$//e

" Toggle mouse support on/off (used by <leader>m).
function! ToggleMouse()
    if &mouse == 'a'
    	set mouse=
	else
		set mouse=a
	endif
endfunction

" Plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'            " Better syntax highlight.
Plug 'sainnhe/gruvbox-material'        " Gruvbox Material colorscheme.
Plug 'wellle/context.vim'              " Sticky context lines above/below the viewport.
Plug 'itchyny/lightline.vim'           " Custom status/tab line.
Plug 'maxboisvert/vim-simple-complete' " Tab-triggered word completion.
Plug 'Raimondi/delimitMate'            " Auto-close brackets and quotes.
Plug 'tpope/vim-fugitive'              " For git branch detection
call plug#end()

" Gruvbox Material colorscheme has italic comments which may cause problems on macos.
" Fix it.
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" Alternative: let g:gruvbox_material_disable_italic_comment = 1

" See :h gruvbox-material
set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_foreground = 'original'
colorscheme gruvbox-material

" Highlight the current line
set cursorline

" Lightline config
"let g:lightline = {
""\ 'active' : { 'Left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'modified' ] ] },
""\ 'component_function': { 'filename': 'LightlineFilename' } }

let g:lightline = {
  \ 'colorscheme': 'gruvbox_material',
  \ 'active': {
  \   'left': [
  \     ['mode'],
  \     ['gitbranch', 'filepath']
  \   ],
  \   'right': [
  \     ['language'],
  \     ['cursor_position']
  \   ]
  \ },
  \ 'component_function': {
  \   'mode': 'LightlineMode',
  \   'gitbranch': 'LightlineGitbranch',
  \   'filepath': 'LightlineFilepath',
  \   'language': 'LightlineLanguage',
  \   'cursor_position': 'LightlineCursorPosition'
  \ }
  \ }

function! LightlineMode()
  let mode_map = {
    \ 'n': 'N',
    \ 'i': 'I',
    \ 'R': 'R',
    \ 'v': 'V',
    \ 'V': 'V',
    \ "\<C-v>": 'V',
    \ 'c': 'C',
    \ 's': 'S',
    \ 'S': 'S',
    \ "\<C-s>": 'S',
    \ 't': 'T'
  \ }
  return get(mode_map, mode(), mode())
endfunction

function! LightlineGitbranch()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch != '' ? branch : ''
  endif
  return ''
endfunction

function! LightlineFilepath()
  return expand('%:~')
endfunction

function! LightlineLanguage()
  if exists('*GetLanguageName')
    return GetLanguageName()
  endif
  let filetype = &filetype
  return filetype != '' ? filetype : 'no ft'
endfunction

function! LightlineCursorPosition()
  return line('.') . ':' . col('.')
endfunction
