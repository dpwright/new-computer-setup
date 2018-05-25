all: vim git ctags

vim: ${HOME}/.vimrc ${HOME}/.gvimrc ${HOME}/.vim

${HOME}/.vimrc: ${HOME}/.vim/.vimrc
	ln -fs $^ $@

${HOME}/.gvimrc: ${HOME}/.vim/.gvimrc
	ln -fs $^ $@

${HOME}/.vim: ${CURDIR}/.vim
	ln -fs $^ $@

${HOME}/.vim/.vimrc: ${HOME}/.vim
${HOME}/.vim/.gvimrc: ${HOME}/.vim

git: ${HOME}/.gitconfig

${HOME}/.gitconfig: ${CURDIR}/.gitconfig
	ln -fs $^ $@

ctags: ${HOME}/usr/bin/ctags

${HOME}/usr/bin/ctags: ${CURDIR}/ctags
	cd ctags; ./configure --prefix=${HOME}/usr
	cd ctags; make && make install

ssl: ${HOME}/usr/lib/libssl.a

${HOME}/usr/lib/libssl.a: ${CURDIR}/openssl
	cd openssl; ./config --prefix=${HOME}/usr
	cd openssl; make && make install
