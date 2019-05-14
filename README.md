# Python Data Science Workspace

This repository contains my workspace for doing Data Science in Python.

## Requirements

* [Anaconda](https://www.continuum.io/downloads) or
  [Miniconda](https://conda.io/en/latest/miniconda.html)
* [Apache Spark](https://spark.apache.org/) (with hadoop)

## Installation and setup

### How to set-up the workspace the first time

1. If not already existing, create a conda environment:

        conda create -n data_science python=3.7

2. Activate the environment:

        source activate data_science

3. Setup the workspace:

        pip install -U pip numpy
        pip install -r requirements.txt
        python -m ipykernel install --user

4. Setup jupyter notebooks

        jupyter contrib nbextension install --user
        jupyter nbextensions_configurator enable --user
        jupyter nbextension install https://github.com/drillan/jupyter-black/archive/master.zip --user
        jupyter nbextension enable jupyter-black-master/jupyter-black

4. Setup jupyter lab

        jupyter labextension install jupyter-leaflet
        jupyter labextension install @jupyter-widgets/jupyterlab-manager
        jupyter labextension install @krassowski/jupyterlab_go_to_definition
        jupyter labextension install jupyterlab_bokeh
        jupyter labextension install ipysheet
        jupyter labextension install jupyterlab-drawio
        jupyter labextension install @jupyterlab/toc
        jupyter labextension install jupyterlab_vim

        jupyter labextension install @jupyterlab/git
        pip install jupyterlab-git
        jupyter serverextension enable --py jupyterlab_git

        jupyter labextension install @ryantam626/jupyterlab_code_formatter
        pip install jupyterlab_code_formatter
        jupyter serverextension enable --py jupyterlab_code_formatter

4. Reactivate the environment:

        source deactivate data_science
        source activate data_science

5. Load the submodules:

        git submodule init
        git submodule update

### How to use the workspace

1. Activate the environment (if not already activated on this session):

        source activate data_science

2. Set Spark environment variables:

        export SPARK_HOME=/opt/spark
        export PATH=$SPARK_HOME/bin:$PATH

3. Start Jupyter Notebook:

        jupyter notebook --NotebookApp.iopub_data_rate_limit=10000000

### How to update the workspace (after an upstream update)

1. Get the last changes from upstream:

        git pull

2. Activate the environment (if not already activated on this session):

        source activate data_science

3. Update the dependencies:

        pip install -r requirements.txt

4. Reactivate the environment:

        source deactivate data_science
        source activate data_science

5. Update submodules:

        git submodule init
        git submodule update

### How to upgrade the workspace (upgrading python packages)

1. Activate the environment (if not already activated on this session):

        source activate data_science

2. Upgrade the dependencies:

        pip-compile --upgrade
        pip install -r requirements.txt

3. Reactivate the environment:

        source deactivate data_science
        source activate data_science

## Facets

[Facets](https://github.com/PAIR-code/facets) is a tool for the visual
exploration of datasets. It can be installed as following:

    jupyter nbextension install facets/facets-dist/ --user

Then jupyter notebook should be started with an additional command line option:

    --NotebookApp.iopub_data_rate_limit=10000000

The visualization can then be loaded as explained in
the [demo notebook](https://github.com/PAIR-code/facets/blob/master/facets_dive/Dive_demo.ipynb).

## Troubleshooting

### GPU support for Jupyter

For computers on linux with optimus, you have to make a kernel that will be
called with "optirun" to be able to use GPU acceleration. For this go to the
following folder:

        cd ~/.local/share/jupyter/kernels/

then edit the file `python3/kernel.json` in order to add `"optirun"` as first
entry into the `argv` array:

        {
                "language": "python",
                "display_name": "Python 3",
                "argv": [
                "optirun",
                "/home/fabien/.conda/envs/data_science/bin/python",
                "-m",
                "ipykernel",
                "-f",
                "{connection_file}"
                ]
        }

## Interesting notebook extensions

I recommend installing the following notebook extension:

- Code prettify
- Codefolding
- Collapsible Headings
- contrib_nbextensions_help_item
- Execute time
- Initialization cells
- Jupyter Black
- Nbextensions dashboard tab
- Nbextensions edit menu item
- Notify
- Python Markdown
- Runtools
- ScrollDown
- Skip-Traceback
- spellchecker
- table_beautifier
- Table of Contents (2)
- Tree Filter
- VIM binding
