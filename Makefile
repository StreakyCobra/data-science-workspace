install: in_virtual_env
	pip install -U -r requirements.txt; pip install -U pip
	python -m ipykernel install --user

in_virtual_env:
	@if [[ -n $$CONDA_DEFAULT_ENV ]]; then \
			:; \
		else \
			echo This should be run from within a virtual environment; \
			exit 1; \
	fi
