<!-- omit in toc -->
# .devcontainer

- [Intended Use](#intended-use)
- [Container Setup](#container-setup)
- [SSH Setup](#ssh-setup)

## Intended Use

Add this repo as a submodule to your current repo with 

```sh
git submodule add git@github.com:Xerner/.devcontainer.git
```

Then copy the desired `devcontainer.json` and `Dockerfile` to the top level of the `.devcontainer/` folder. This will allow VS Code to detect it by default

For setting up some nice Git settings for submodules that I like, see [git-set-submodule-settings.sh](https://github.com/Xerner/repos/blob/main/scripts/git-set-submodule-settings.sh). Also see [Git's guide on using submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

## Container Setup

![dev-container-setup](./docs/dev-container-setup.svg)

## SSH Setup

The ssh agent should automatically talk to the host ssh-agent that the container is launched from. To have ssh setup in the container, run the `wsl-setup-ssh.sh` script inside wsl to copy the host (windows) ssh folder to wsl. It will also configure proper file ownership and permissions. Results may vary
