# Deep Learning Workspace

This repository contains my workspace for doing Deep Learning.

## Requirements

* [anaconda](https://www.continuum.io/downloads)

## How to set-up the workspace the first time

1. If not already existing, create a conda environment:

        conda create -n deep_learning python=3.5

2. Activate the environment:

        source activate deep_learning

3. Install the dependencies

        make install

4. Reactivate the environment:

        source deactivate deep_learning
        source activate deep_learning

5. GPU support for Jupyter:

    For computers on linux with optimus, you have to make a kernel that will be called with "optirun" to be able to use GPU acceleration. For this go the the following folder:

        cd ~/.local/share/jupyter/kernels/

    then edit the file `python3/kernel.json` in order to add `optirun` as first entry into the `argv` entry:

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

## How to use the workspace

1. Activate the environment (if not already activated on this session):

        source activate deep_learning

2. Start Jupyter Notebook:

        jupyter notebook

## How to update the workspace

1. Activate the environment (if not already activated on this session):

        source activate deep_learning

2. Update the dependencies:

        make update

3. Reactivate the environment:

        source deactivate deep_learning
        source activate deep_learning
