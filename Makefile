#------------------------------------------------#
#   VARIABLES                                    #
#------------------------------------------------#
SYSTEM_PYTHON = /usr/bin/python3
VENV = .venv
BIN = ${VENV}/bin
PYTHON = ${BIN}/python3
PIP = ${BIN}/pip
ACTIVATE = ${BIN}/activate

PROGRAM =

# ARGUMENTS =

#------------------------------------------------#
#   SETUP                                        #
#------------------------------------------------#
setup: venv pip_upgrade install

venv:
	${SYSTEM_PYTHON} -m venv ${VENV}
	ln -sf ${ACTIVATE} activate

pip_upgrade:
	${PIP} install --upgrade pip

install: \
	requirements \
	module \
#
module: setup.py
	${PIP} install -e . --upgrade

requirements: requirements.txt
	${PIP} install -r requirements.txt --upgrade


#------------------------------------------------#
#   INFO                                         #
#------------------------------------------------#
list:
	${PIP} list

version:
	${PYTHON} --version

size:
	du -hd 0
	du -hd 0 ${VENV}


#------------------------------------------------#
#   RECIPES                                      #
#------------------------------------------------#
# Run
run:
	${PYTHON} ${PROGRAM} \
	# ${ARGUMENTS}


# Clean
clean:

fclean: clean
	rm -rf ${VENV}
	rm -rf activate

re: fclean setup run

#------------------------------------------------#
#   SPEC                                         #
#------------------------------------------------#
.SILENT:
.PHONY: setup venv pip_upgrade install module requirements list version run clean fclean re
