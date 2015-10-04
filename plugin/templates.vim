"========================= Templates plugin ===================================
"
"   Insert templates and Makefiles by extension when creating a new file
"
"==============================================================================

if !exists("g:templ_templates_install_dir")
    let g:templ_templates_install_dir="~/.vim"
endif

if !exists("g:templ_templatesdir")
    let g:templ_templatesdir=g:templ_templates_install_dir."/templates/"
endif

if !exists("g:templ_Makefilesdir")
    let g:templ_Makefilesdir=g:templ_templates_install_dir."/Makefiles/"
endif

if( !exists("g:templ_beamer_name"))
    let g:templ_beamer_name='slides.tex'
endif

" Insert headers if any
au BufNewFile * call ImportTemplates()

" Commands
command! -nargs=0 ImportMakefile call ImportMakefile()
command! -nargs=0 ImportTemplates call ImportTemplates()

" Functions {{{1

" Insert headers corresponding to the file extension
function! ImportTemplates()
    "insert headers
    if expand('%')=~g:templ_beamer_name
        let header=g:templ_templatesdir . "beamer.tex"
        let type="beamer"
    else
        let type=expand('%:e')
        let header=g:templ_templatesdir . "template.". l:type
    endif
    try
        execute "0read" header
    catch
    endtry
    " Ask for Makefile import
    let mkf=g:templ_Makefilesdir.'Makefile_'.&ft
    if empty(glob("./Makefile")) && !empty(glob(l:mkf)) &&
                \ input("Do you want to import an existing makefile ? [y/N]") == "y"
        call ImportMakefile()
    endif
    execute "normal \<C-m>\<Right>"
endfunction

" Import makefile based on the filetype
function! ImportMakefile()
    if empty(glob("./Makefile")) ||
                \ input("There is already one Makefile, do you want to overwrite it ? [y/N]")=="y"
        let mk=g:templ_Makefilesdir. "Makefile_" . &ft
        exe '!cp  -v ' l:mk 'Makefile'
    endif
endfunction
