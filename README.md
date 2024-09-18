# Intended Use

Add this repo as a submodule to your current repo with 

```sh
git submodule add git@github.com:Xerner/.devcontainer.git
```

Then copy the desired `devcontainer.json` and `Dockerfile` to the top level of the `.devcontainer/` folder. This will allow VS Code to detect it by default

For setting up some nice Git settings for submodules that I like, see (git-set-submodule-settings.sh)[https://github.com/Xerner/repos/blob/main/scripts/git-set-submodule-settings.sh]
