# Vim-Templates

A lazy vim plugin to manage template and Makefiles.

## Install

### Vizardry

If you have [Vizardry](https://github.com/dbeniamine/vizardry) installed,
you can run from vim:

    :Invoke -u dbeniamine vim-templates

### Pathogen install

    git clone https://github.com/dbeniamine/vim-tempaltes.git ~/.vim/bundle/vim-templates

Then from vim: `:Helptags` to update the doc

### Quick install

        git clone https://github.com/dbeniamine/vim-templates.git
        cd vim-templates
        cp -r ./* ~/.vim


If you want the help installed, run `:helptags ~/.vim/doc` inside vim after
having copied the files.  Then you will be able to get the commands help with:
`:h todo.txt`

## How does it work


1.  Each time a new file is opened, vim-templates looks in
`g:VimTemplates_templatesdir` (see <a href="#configuration">configuration</a>) for a
suitable template aka a file named `template.<ft>` where `<ft>` is the
filetype of the current file, for instance: `template.tex` for a latex file.
If such a file exists it will be read.

2.  If you open a file named `slide.tex`, Vim-templates will look for a file
called `beamer.tex` instead of ̀`templates.tex` which allow you to define a
normal latex template and a beamer template. You can set the name of your
beamer presentation by adding the following to yout vimrc:
 
        let g:VimTemplates_beamer_name='slides.tex'

3.  Then if no Makefile is present in the current directory, Vim-templates
will look in `g:VimTemplates_Makefilesdir` (see
<a href="#configuration">configuration</a>) for a file called `Makefile_<ft>` if
such a file exists, it will prompt you to import it.

## Commands

Vim-templates provides two commands:

    :ImportTemplates

Look for a template file then for a Makefile a described in previous section.

    :ImportMakefile

Look for a Makefile a described in previous section, if found import it.
Prompt you only if a Makefile is present in the current directory.

## Configuration

By defaults templates and Makefiles are searched in
`path/to/vim-templates/templates` and `path/to/vim-templates/Makefiles` to
change these directories add the following to your vimrc:

    let g:VimTemplates_templatesdir="~/.vim/templates/"
    let g:VimTemplates_Makefilesdir="~/.vim/Makefiles/"

It is also possible to set a default beamer file name:

    let g:VimTemplates_beamer_name='slides.tex'

## License

Copyright (c) David Beniamine. Distributed under the same terms as Vim itself.
See `:help license`.
