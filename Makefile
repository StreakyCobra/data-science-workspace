# Set the shell
SHELL := /usr/bin/zsh

# Default target
default: jupyter

# Setup the environment
setup:
	@echo 'source deactivate data_science; source activate data_science;'

# Run jupyter
jupyter: in_virtual_env
	jupyter notebook --NotebookApp.iopub_data_rate_limit=10000000

# Initialize the environment
initialize: in_virtual_env
	${MAKE} update
	python -m ipykernel install --user
	jupyter contrib nbextension install --user
	jupyter nbextensions_configurator enable --user

# Update the environment (Install dependencies from requirements.txt)
update: in_virtual_env
	pip install -U pip numpy  # Numpy is needed to bootstrap scikit-image installation
	pip install -r requirements.txt

# Upgrade the environment (Upgrade dependencies by looking for new versions)
upgrade: in_virtual_env
	pip-compile --upgrade
	${MAKE} update

# Check if currently in a virtual environment
in_virtual_env:
	@if [[ -n $$CONDA_DEFAULT_ENV ]]; then \
			:; \
		else \
			echo This should be run from within a virtual environment; \
			exit 1; \
	fi
