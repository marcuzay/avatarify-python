@echo off

REM Check prerequisites
call conda --version >nul 2>&1 && ( echo conda found ) || ( echo conda not found. Please refer to the README and install Miniconda. && exit /B 1)
REM call git --version >nul 2>&1 && ( echo git found ) || ( echo git not found. Please refer to the README and install Git. && exit /B 1)

call scripts/settings_windows.bat

call conda create -y -n %CONDA_ENV_NAME% python=3.10.12
call conda activate %CONDA_ENV_NAME%

call mamba install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c nvidia -c conda-forge
call conda install -y scikit-image python-blosc -c conda-forge
call conda install -y -c anaconda git

REM ###FOMM###
call rmdir fomm /s /q
call git clone https://github.com/alievk/first-order-model.git fomm

call pip install -r requirements.txt
