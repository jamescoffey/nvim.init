# Developer Environment Setup Guide

This guide provides the necessary steps to set up a local development environment that is compatible with our Neovim configuration.


Audit Findings & Dependencies
   - Core Tools: mason.nvim and telescope.nvim require git, curl, unzip, ripgrep, and fd.    
   - Compilers: treesitter requires a C compiler (gcc or clang) to build syntax parsers.     
   - Python Environment: Several plugins (and likely magma.lua) require the pynvim bridge,   
      plus black and isort for formatting.
   - R Environment: R.nvim requires the R language, languageserver, and styler. Note: Your   
      config mentions air for R formatting; this is unusual and likely a typo for styler or a 
      custom tool.
   - Node.js: Required for pyright (LSP), copilot.lua, and prettier.


## Windows 11 (via Scoop)

Scoop is the package manager for Windows used in these examples as it handles PATH management and dependencies cleanly. However if you prefer you can use winget or Chocolatey.


### 1. Install Scoop and powershell 7

First install [Windows Terminal](https://apps.microsoft.com/detail/9N0DX20HK701?hl=en-us&gl=AU&ocid=pdpshare) 

Open a PowerShell terminal and run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Get.Scoop.sh | Inverse-Expression
```

Use scoop to install powershell 7:

```powershell
# Add necessary buckets
scoop bucket add extras
scoop bucket add main 
# install powershell 7
scoop install main/pwsh 
```


It is a good idea to install a font that includes all the glyphs used by nvim and its plugins. Choose your favourite at [nerdfont](https://nerdfont.com). My choice is [CaskaydiaCove](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip). Make sure you setup powershell to use it as the defualt font.

Now switch to using powershell 7

### 2. Install System Dependencies
```powershell
# Install core tools
scoop install git neovim nodejs ripgrep fd fzf llvm 7zip

# Install Python & R
scoop install python r
```

### 3. Install Language Packages
```powershell
# Python packages
pip install pynvim black isort debugpy ipykernel jupyter_client radian

# R packages
Rscript -e "install.packages(c('languageserver', 'styler'), repos='https://cloud.r-project.org/', type = 'source')"
```

---

## Linux (Ubuntu/Debian)

### 1. Install System Dependencies
```bash
sudo apt update
sudo apt install -y neovim git curl wget unzip ripgrep fd-find build-essential nodejs npm python3 python3-pip r-base

# Fix for fd-find (Ubuntu names the binary fdfind)
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
```

### 2. Install Language Packages
```bash
# Python packages
pip3 install pynvim black isort debugpy ipykernel jupyter_client radian

# R packages
sudo Rscript -e "install.packages(c('languageserver', 'styler'), repos='https://cloud.r-project.org/')"
```

---

## Post-Installation Notes

###  Important IT Notes for Deployment
- Hardcoded Paths: In lua/plugins/r.lua, you have a hardcoded path: R_path =
  "C:\\Users\\james\\...". This will fail on every other computer. You should change this  
  to a generic lookup or let the plugin find R in the system PATH.
- Mason: While mason.nvim can install LSPs automatically, it cannot install the underlying 
  runtimes (like Python or R). The scripts above ensure the runtimes are present.
- Treesitter: On Windows, if clang is not found, Developers may see errors when opening new
  file types. Ensure the LLVM install step completes successfully.
- Gemini CLI: Since this setup includes avante.lua and mentions gemini-cli, ensure
  developers have the gemini executable installed via npm install -g @google/gemini-cli. 

### Neovim Initialization
1.  Clone the configuration repository to the appropriate config folder:
    - **Windows**: `~/AppData/Local/nvim`
    - **Linux**: `~/.config/nvim`
2.  Open Neovim: `nvim`
3.  Lazy.nvim will automatically bootstrap and install plugins.
4.  Run `:Mason` to verify LSP/Formatter status.

### Hardcoded Paths Warning
Note that some plugins (like `R.nvim`) may require manual path adjustments in `lua/plugins/r.lua` if your R installation directory differs from the default.

### Gemini CLI
For AI features, install the Gemini CLI globally:
```bash
npm install -g @google/gemini-cli
```
Ensure your `GEMINI_API_KEY` is set in your environment variables.

