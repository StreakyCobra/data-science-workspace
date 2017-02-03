install: in_virtual_env
	pip install -r requirements.txt; pip install -U pip
	python -m ipykernel install --user
	jupyter contrib nbextension install --user
	jupyter nbextensions_configurator enable --user

update: in_virtual_env
	pip install -U -r requirements.txt; pip install -U pip

in_virtual_env:
	@if [[ -n $$CONDA_DEFAULT_ENV ]]; then \
			:; \
		else \
			echo This should be run from within a virtual environment; \
			exit 1; \
	fi
