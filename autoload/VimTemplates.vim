" Save context {{{1
let s:save_cpo = &cpo
set cpo&vim

if !exists("g:loaded_VimTemplates")
    finish
endif

" Functions {{{1

" Insert headers corresponding to the file extension
function! VimTemplates#ImportTemplates()
    "insert headers
    if expand('%')=~g:VimTemplates_beamer_name
        let header=g:VimTemplates_templatesdir . "beamer.tex"
        let type="beamer"
    else
        let type=expand('%:e')
        let header=g:VimTemplates_templatesdir . "template.". l:type
    endif
    try
        execute "0read" header
    catch
    endtry
    " Ask for Makefile import
    let mkf=g:VimTemplates_Makefilesdir.'Makefile_'.&ft
    if empty(glob("./Makefile")) && !empty(glob(l:mkf)) &&
                \ input("Do you want to import an existing makefile ? [y/N]") == "y"
        call ImportMakefile()
    endif
    execute "normal \<C-m>\<Right>"
endfunction

" Import makefile based on the filetype
function! VimTemplates#ImportMakefile()
    if empty(glob("./Makefile")) ||
                \ input("There is already one Makefile, do you want to overwrite it ? [y/N]")=="y"
        let mk=g:VimTemplates_Makefilesdir. "Makefile_" . &ft
        exe '!cp  -v ' l:mk 'Makefile'
    endif
endfunction

" Restore context {{{1
let &cpo = s:save_cpo
