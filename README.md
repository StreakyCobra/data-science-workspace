# Python Data Science Workspace

This repository contains a Workspace for doing Data Science in Python.

**Table of Contents**

<!-- TOC -->

- [Python Data Science Workspace](#python-data-science-workspace)
    - [Requirements](#requirements)
    - [Installation and setup](#installation-and-setup)
        - [How to set-up the workspace the first time](#how-to-set-up-the-workspace-the-first-time)
        - [How to use the workspace](#how-to-use-the-workspace)
        - [How to update the workspace (after an upstream update)](#how-to-update-the-workspace-after-an-upstream-update)
        - [How to upgrade the workspace (upgrading python packages)](#how-to-upgrade-the-workspace-upgrading-python-packages)
    - [Facets](#facets)
    - [Interesting notebook extensions](#interesting-notebook-extensions)

<!-- /TOC -->

## Requirements

* [Anaconda](https://www.continuum.io/downloads)
* [Apache Spark](https://spark.apache.org/) (with hadoop)

## Installation and setup

### How to set-up the workspace the first time

1. If not already existing, create a conda environment:

        conda create -n data_science python=3.5

2. Activate the environment:

        eval $(make setup)

3. Setup the workspace

        make initialize

4. Reactivate the environment:

        eval $(make setup)

5. GPU support for Jupyter:

    For computers on linux with optimus, you have to make a kernel that will be
    called with "optirun" to be able to use GPU acceleration. For this go to the
    following folder:

        cd ~/.local/share/jupyter/kernels/

    then edit the file `python3/kernel.json` in order to add `"optirun"` as
    first entry into the `argv` array:

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

6. Load the submodules

        git submodule init
        git submodule update

### How to use the workspace

1. Activate the environment (if not already activated on this session):

        eval $(make setup)

2. Set Spark environment variables

        export SPARK_HOME=/opt/spark
        export PATH=$SPARK_HOME/bin:$PATH

3. Start Jupyter Notebook with the `start` Makefile's target:

        make
        
### How to update the workspace (after an upstream update)

1. Get the last changes from upstream

        git pull

2. Activate the environment (if not already activated on this session):

        eval $(make setup)

3. Update the dependencies:

        make update

4. Reactivate the environment:

        eval $(make setup)

5. Update submodules

        git submodule init
        git submodule update

### How to upgrade the workspace (upgrading python packages)

1. Activate the environment (if not already activated on this session):

        eval $(make setup)

2. Upgrade the dependencies:

        make upgrade

3. Reactivate the environment:

        eval $(make setup)

## Facets

[Facets](https://github.com/PAIR-code/facets) is a tool for the visual
exploration of datasets. It can be installed as following:

    jupyter nbextension install facets/facets-dist/ --user
    
Then jupyter notebook should be started with an additionnal command line option:

    --NotebookApp.iopub_data_rate_limit=10000000
    
The visualization can then be loaded as explained in
the [demo notebook](https://github.com/PAIR-code/facets/blob/master/facets_dive/Dive_demo.ipynb).

## Interesting notebook extensions

I recommend installing the following notebook extension:

- Code prettify
- Codefolding
- Collapsible Headings
- contrib_nbextensions_help_item
- Execute time
- Initialization cells
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
