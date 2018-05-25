all: vim

vim: ${HOME}/.vimrc ${HOME}/.gvimrc ${HOME}/.vim

${HOME}/.vimrc: ${HOME}/.vim/.vimrc
	ln -fs $^ $@

${HOME}/.gvimrc: ${HOME}/.vim/.gvimrc
	ln -fs $^ $@

${HOME}/.vim: ${CURDIR}/.vim
	ln -fs $^ $@

${HOME}/.vim/.vimrc: ${HOME}/.vim
${HOME}/.vim/.gvimrc: ${HOME}/.vim
