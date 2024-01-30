SYSTEM_PYTHON = /usr/bin/python3
VENV = .venv
BIN = ${VENV}/bin
PYTHON = ${BIN}/python3
PIP = ${BIN}/pip
ACTIVATE = ${BIN}/activate

PROGRAM =

install: venv pip_upgrade
	${PIP} install -e .

venv:
	${SYSTEM_PYTHON} -m venv ${VENV}
	ln -sf ${ACTIVATE} activate

pip_upgrade:
	${PIP} install --upgrade pip

list:
	${PIP} list

version:
	${PYTHON} --version

upgrade:
	${PIP} install -e . --upgrade

run:
	${PYTHON} ${PROGRAM}

clean:

fclean: clean
	rm -rf ${VENV}
	rm -rf activate

re: fclean install run

.SILENT:
.PHONY: install venv pip_upgrade list version upgrade run clean fclean re
