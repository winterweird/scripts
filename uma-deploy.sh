#!/bin/bash

# Project specific command used to push all UMA relevant files to salt-master
# for deployment.
# Note that if you don't have any local changes or untracked files, this command
# might pop stuff from the stash that you didn't intend. I basically always have
# something to commit, but you might not. Change command as appropriate.


# Find project root dir
GIT_ENV=$(git rev-parse --show-toplevel)

# Suspend local .gitignore list. This is to make sure that we can stash those
# files as well, to avoid accidentally pushing them to salt-master.
# The .git/info/exclude file lists files you don't want to track in version
# control locally. If you, like me, often put a lot of crap in your current
# directory which you don't want to actually commit, and also don't want to make
# a mess of the shared .gitignore file, this file is for you.
(cd $GIT_ENV/.git/info && mv exclude x)

# Stash local changes and untracked files
git add .
git stash push .

# Go to root folder
pushd $GIT_ENV

# Copy relevant folders
kubectl cp uma-service/ salt-0:/srv/
kubectl cp monitoring-engine/ salt-0:/srv/

# Go back to previous folder
popd

# Pop your stashed changes
git stash pop

# Restore local .gitignore information
(cd $GIT_ENV/.git/info && mv x exclude)

# Unstage changes (particularly the previously unstaged files that were stashed
# will be staged by default when popping the stash).
git restore --staged .
