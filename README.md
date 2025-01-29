# Scripts for fun and profit

This is a collection of some scripts which I find useful in my day-to-day life.
Some are project specific, some are not; some may be configurable from project
to project.

Description of each script can usually be found in comments at the top of the
source file. But here's a quick breakdown:

-   `git-db`: Manage database across branches with different database migration
    states.
-   `compose`, `dcb`, `dcr`, `dcl`, `dce`: Shorthands for running docker compose commands
-   `git-divergence`: Determine number of changes that have happened between two
    branches (can be used to figure out if a branch is safe to delete)
-   `git-fuckup`: Fold the last commit into the previous one
-   `uma-deploy.sh`: Copy relevant files to salt-master node (project specific)
-   `.gitconfig`: Useful git command aliases

## Installation

Either copy the files to a folder in your PATH, or add the repo's root folder to
your path:

```
git clone git@github.com:winterweird/scripts.git
cd scripts
echo "$(pwd):$PATH" >> .bashrc # or .zshrc, or whatever
```
