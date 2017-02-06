start: in_virtual_env
	jupyter notebook --browser chromium

install: in_virtual_env
	pip install -U pip numpy  # Numpy is needed to bootstrap scikit-image installation
	pip install -r requirements.txt

setup: in_virtual_env
	${MAKE} install
	python -m ipykernel install --user
	jupyter contrib nbextension install --user
	jupyter nbextensions_configurator enable --user

update: in_virtual_env
	pip-compile --upgrade
	${MAKE} install

in_virtual_env:
	@if [[ -n $$CONDA_DEFAULT_ENV ]]; then \
			:; \
		else \
			echo This should be run from within a virtual environment; \
			exit 1; \
	fi
