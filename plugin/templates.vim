" File:        vim-templates.vim
" Description: A lazy plugin to manage templates and Makefiles
" Author:      David Beniamine <David@Beniamine.net>
" License:     Vim license
" Website:     http://github.com/dbeniamine/vim-templates.vim
" Version:     0.1

" Don't load twice {{{1
if exists("g:loaded_VimTemplates")
    finish
endif
let g:loaded_VimTemplates=1

" Save context {{{1
let s:save_cpo = &cpo
set cpo&vim


let g:VimTemplates_install_dir=expand('<sfile>:p:h').'/..'

if !exists("g:VimTemplates_templatesdir")
    let g:VimTemplates_templatesdir=g:VimTemplates_install_dir."/templates/"
endif

if !exists("g:VimTemplates_Makefilesdir")
    let g:VimTemplates_Makefilesdir=g:VimTemplates_install_dir."/Makefiles/"
endif

if( !exists("g:VimTemplates_beamer_name"))
    let g:VimTemplates_beamer_name='slides.tex'
endif

" Insert headers if any
au BufNewFile * call VimTemplates#ImportTemplates()

" Commands
command! -nargs=0 ImportMakefile call VimTemplates#ImportMakefile()
command! -nargs=0 ImportTemplates call VimTemplates#ImportTemplates()

" Restore context {{{1
let &cpo = s:save_cpo
