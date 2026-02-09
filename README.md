# Overview
Contains installers to create Python environments using micromamba for QCoDeS + Labber and a separate installer for a plottr environment.
It is designed such that usage of anaconda/miniconda is not necessary at all and no manual installation of packages is required.

# Requirements
Check if micromamba is already installed:
1. Open Windows PowerShell
2. run ```micromamba --version```
3. If it does not show the installed version, first install micromamba:
4. Go to https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html and follow the instructions for Windows PowerShell there. You may be asked if you want to initialize micromamba for the shell activate command, confirm by typing in 'y' then Enter. It will ask you for the path to the micromamba prefix, no need to change it -> just hit enter. It wants to enter admin mode to enable long path support, confirm again with 'y' then Enter.
5. Check that micromamba is installed correctly:
6. Open PowerShell, run ```Get-Command micromamba``` 
7. The output must say something like "Application micromamba.exe ..." 
8. If it says "Alias   micromamba -> Invoke-Mamba" remove it by running ```Remove-Item Alias:micromamba```
9. Check steps 5 - 7 again


## QCoDeS + Labber Environment
The following instructions are for a simple installation of a micromamba environment where both QCoDeS (v0.37) and the Labber API are installed. This allows for the usage of the functions in QcodesToLabber.py to translate your QCoDeS measurements to .hdf5 files that are readable by Labber's Log Browser.
### Installation
Simply run `install.bat`

In case there may be a problem with the installation, some packages may have been updated and cause issues with dependencies. A possible solution is to use the .yml file found int the conda-lock folder. To do so, first follow the instructions below for removing the environmen. Afterwards copy the .yml file in conda-lock into the qcodes_env_installer folder and run the install.bat again.

### Usage with jupyter
Usage is similar as with anaconda but everything can be run from PowerShell. So to e.g. use jupyter simply:
1. Open Windows PowerShell
2. ```micromamba activate qcodes_auto``` to activate the environment
3. use ```cd``` to change to the target drive (e.g. K:)
4. ```jupyter lab``` to run jupyter lab
## Plottr Environment
Install by running install.bat
### Usage
1. Open Windows PowerShell
2. ```micromamba activate plottr_auto``` to activate the environment
3. ```plottr-inspectr``` to start the program

## Using the environment with Jupyterlab

## Removing the environment and cleaning to uninstall
1. Start powershell, make sure you are not in the virtual environement ```micromamba deactivate```
2. Remove environment: ```micromamba remove -n qcodes_auto --all``` confirm the change
3. Verify it's gone: ```micromamba env list``` Make sure "qcodes_auto does not appear. If it does, go to the directory in the file explorer and delete it
4. Prevent issues from solver when trying to reinstall: ```micromamba clean --all --yes```

