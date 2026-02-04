## QCoDeS + Labber Environment
The following instructions are for a simple installation of a micromamba environment where both QCoDeS (v0.37) and the Labber API are installed. This allows for the usage of the functions in QcodesToLabber.py to translate your QCoDeS measurements to .hdf5 files that are readable by Labber's Log Browser.
### Installation
1. Install micromamba -> go to https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html and follow the instructions for Windows PowerShell there. You may be asked if you want to initialize micromamba for the shell activate command, confirm by typing in 'y' then Enter. It will ask you for the path to the micromamba prefix, no need to change it -> just hit enter. It wants to enter admin mode to enable long path support, confirm again with 'y' then Enter.
2. Check that micromamba is installed correctly:
3. Open PowerShell, run ```Get-Command micromamba```
4. The output must say something like "Application micromamba.exe ..."
5. If it says "Alias   micromamba -> Invoke-Mamba" remove it by running ```Remove-Item Alias:micromamba```
6. Check steps 3 and 4 again
7. Run `install.bat`

In case there may be a problem with the final step, some packages may have been updated and cause issues with dependencies. A possible solution is to use the .yml file found int the conda-lock folder. To do so, first follow the instructions below for removing the environmen. Afterwards copy the .yml file in conda-lock into the qcodes_env_installer folder and run the install.bat again.

### Activation
in powershell:
```micromamba activate qcodes_auto```
## Using the environment with Jupyterlab

## Removing the environment and cleaning to uninstall
1. Start powershell, make sure you are not in the virtual environement ```micromamba deactivate```
2. Remove environment: ```micromamba remove -n qcodes_auto --all``` confirm the change
3. Verify it's gone: ```micromamba env list``` Make sure "qcodes_auto does not appear. If it does, go to the directory in the file explorer and delete it
4. Prevent issues from solver when trying to reinstall: ```micromamba clean --all --yes```