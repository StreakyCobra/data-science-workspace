# Deep Learning Workspace

This repository contains my workspace for doing Deep Learning.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Deep Learning Workspace](#deep-learning-workspace)
    - [Installation and setup](#installation-and-setup)
        - [Requirements](#requirements)
        - [How to set-up the workspace the first time](#how-to-set-up-the-workspace-the-first-time)
        - [How to use the workspace](#how-to-use-the-workspace)
        - [How to update the workspace (after an upstream update)](#how-to-update-the-workspace-after-an-upstream-update)
        - [How to upgrade the workspace (upgrading python packages)](#how-to-upgrade-the-workspace-upgrading-python-packages)
    - [Interesting notebook extensions](#interesting-notebook-extensions)

<!-- markdown-toc end -->
 
## Installation and setup

### Requirements

* [anaconda](https://www.continuum.io/downloads)

### How to set-up the workspace the first time

1. If not already existing, create a conda environment:

        conda create -n deep_learning python=3.5

2. Activate the environment:

        source activate deep_learning

3. Setup the workspace

        make setup

4. Reactivate the environment:

        source deactivate deep_learning; source activate deep_learning

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
                "/home/fabien/.conda/envs/deep_learning/bin/python",
                "-m",
                "ipykernel",
                "-f",
                "{connection_file}"
            ]
        }

### How to use the workspace

1. Activate the environment (if not already activated on this session):

        source activate deep_learning

2. Start Jupyter Notebook with the `start` Makefile's target:

        make start
        
    which can be called directly as `make` as it's the default entry, or
    manually with:

        jupyter notebook

### How to update the workspace (after an upstream update)

1. Get the last changes from upstream

        git pull

2. Activate the environment (if not already activated on this session):

        source activate deep_learning

3. Update the dependencies:

        make install

4. Reactivate the environment:

        source deactivate deep_learning; source activate deep_learning

### How to upgrade the workspace (upgrading python packages)

1. Activate the environment (if not already activated on this session):

        source activate deep_learning

2. Update the dependencies:

        make update

3. Reactivate the environment:

        source deactivate deep_learning; source activate deep_learning

## Interesting notebook extensions

I recommend installing the following notebook extension:

- Code prettify
- Codefolding
- Collapsible Headings
- contrib_nbextensions_help_item
- Execute time
- Hinterland
- Initialization cells
- Nbextensions dashboard tab
- Nbextensions edit menu item
- Notify
- Python Markdown
- Ruler
- Runtools
- ScrollDown
- Skip-Traceback
- spellchecker
- Table of Contents (2)
- Tree Filter
- VIM binding
