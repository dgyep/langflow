@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
cd /d "%~dp0"
call .\.venv\Scripts\activate.bat

REM Add Rust to the PATH
SET PATH=%PATH%;C:\Users\deang\.cargo\bin

echo.
echo *** Environment setup complete ***
echo *** Visual Studio C++ and Rust are now configured ***
echo.
echo Running installation commands...

echo Step 1/3: Installing pre-built tokenizers...
pip install tokenizers --only-binary :all:

echo Step 2/3: Installing pre-built core dependencies...
pip install --only-binary :all: numpy scipy pyarrow pandas

echo Step 3/3: Installing langflow...
pip install langflow

echo.
IF %ERRORLEVEL% NEQ 0 (
    echo Installation encountered some issues.
    echo You can try other commands manually.
) ELSE (
    echo Installation completed successfully!
)

echo.
echo Type 'exit' when you're done to close this window.
cmd /k
