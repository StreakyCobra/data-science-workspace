# Practice Deep Learning

This repository contains my workspace for practicing Deep Learning.

## Requirements

* [anaconda](https://www.continuum.io/downloads)

## How to set-up the environment the first time

1. If not already existing, create a conda environment:

        conda create -n practice_dl python=3.5

2. Activate the environment:

        source activate practice_dl

3. Install the dependencies

        make install

4. Reactivate the environment:

        source deactivate practice_dl
        source activate practice_dl

5. GPU support for Jupyter:

    For computers on linux with optimus, you have to make a kernel that will be called with "optirun" to be able to use GPU acceleration. For this go the the following folder:

        cd ~/.local/share/jupyter/kernels/

    then copy the existing kernel to a new folder:

        cp -r python3 python3-gpu

    then edit the file `python3-gpu/kernel.json` in order to add `optirun` as first entry into the `argv` entry:

        {
            "language": "python",
            "display_name": "Python 3 GPU",
            "argv": [
                "optirun",
                "/home/fabien/.conda/envs/practice_dl/bin/python",
                "-m",
                "ipykernel",
                "-f",
                "{connection_file}"
            ]
        }

    Don't also forget to change the `display_name` in order to identify it later.

## How to use the environment

1. Activate the environment (if not already activated on this session):

        source activate practice_dl

2. Start Jupyter Notebook:

        jupyter notebook

## How to update the environment

1. Activate the environment (if not already activated on this session):

        source activate practice_dl

2. Update the dependencies:

        make install

3. Reactivate the environment:

        source deactivate practice_dl
        source activate practice_dl
