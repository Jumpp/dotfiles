# Git Aliases Documentation

## Sync & Update Aliases

- **`git sync`** - Pulls with rebase and auto-stashes changes (replaces your manual stash/pull/apply workflow)
- **`git sync-main`** - Switches to main/master and syncs it
- **`git update`** - Fetches all remotes and removes deleted branches

## Stashing Aliases

- **`git save`** - Stash with a message: `git save "WIP feature"`
- **`git stash-all`** - Stash everything including untracked files
- **`git pop`** - Apply and remove the latest stash
- **`git stashes`** - List all stashes

## Status & Info

- **`git s`** - Short status with branch info
- **`git st`** - Full status
- **`git branches`** - Show branches with tracking info
- **`git br`** - Show all branches including remotes

## Committing

- **`git c`** - Commit (interactive)
- **`git cm`** - Commit with inline message
- **`git amend`** - Fix last commit (opens editor)
- **`git amend-ne`** - Fix last commit without changing message

## Logging (Pretty Views)

- **`git l`** - One-line graph log
- **`git ll`** - Detailed log with file stats
- **`git last`** - Show only the last commit
- **`git ld`** - Log with dates and author info

## Diff Aliases

- **`git d`** - Show unstaged changes
- **`git dc`** - Show staged changes (what will be committed)
- **`git dw`** - Word-level diff (better for prose)

## Reset & Undo

- **`git unstage`** - Remove files from staging area
- **`git undo`** - Undo last commit but keep the changes
- **`git reset-hard`** - ⚠️ Discard all changes (DANGER)
- **`git discard`** - Throw away changes to specific files

## Remote Operations

- **`git p`** - Push current branch
- **`git pf`** - Force push safely (checks remote first)
- **`git pl`** - Pull current branch
- **`git remotes`** - Show remote URLs

## Branching

- **`git co`** - Checkout branch
- **`git cob`** - Create and checkout new branch
- **`git back`** - Switch to previous branch
- **`git del`** / **`git del-force`** - Delete branches

## Utilities

- **`git contributors`** - Show commit counts by author
- **`git ignored`** - List ignored files
- **`git find-branch`** - Find which branches contain a commit
- **`git current`** - Show current branch name
- **`git cleanup`** - Delete all merged branches (keeps main/master)

## Global Configuration

- **Editor**: Set to nvim
- **Pull**: Always rebase by default
- **Push**: Auto-setup tracking for new branches
- **Rebase**: Auto-stash before rebasing
- **Fetch**: Auto-prune deleted remote branches
- **Diff**: Better algorithm (histogram) and shows moved code
- **Merge**: Shows common ancestor in conflicts (diff3 style)
- **Init**: New repos use `main` instead of `master`

## Shell Aliases (from .zshrc)

- **`g`** - Quick git shorthand
- **`gs`** - `git status -sb`
- **`ga`** - `git add`
- **`gc`** - `git commit`
- **`gp`** - `git push`
- **`gl`** - `git pull`
- **`gd`** - `git diff`
- **`gco`** - `git checkout`
- **`gb`** - `git branch`
- **`glog`** - `git log --oneline --graph --decorate`
