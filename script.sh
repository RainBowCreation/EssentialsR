#!/bin/bash

# Define paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
REPO_DIR="$SCRIPT_DIR/Essentials"
REPO_DIR_PATCH="$SCRIPT_DIR/Essentials-Patchs"
REPO_URL="https://github.com/EssentialsX/Essentials"
PATCHES_DIR="$SCRIPT_DIR/patches/plugins"
BRANCH_GIT="2.x"

# core paths
CORE_REPO_DIR="$SCRIPT_DIR/core"
CORE_REPO_DIR_PATCH="$SCRIPT_DIR/core-Patchs"
CORE_REPO_URL="https://github.com/RainBowCreation/core"
CORE_PATCHES_DIR="$SCRIPT_DIR/patches/core"

# Make sure the patches directory exists
mkdir -p "$PATCHES_DIR"

reclone_repo() {
    echo "Deleting local repo..."
    rm -rf "$REPO_DIR"
    rm -rf "$CORE_REPO_DIR"
    rm -rf "$REPO_DIR_PATCH"
    rm -rf "$CORE_REPO_DIR_PATCH"

    echo "Cloning repo..."
    git clone "$REPO_URL" "$REPO_DIR"
    git clone "$CORE_REPO_URL" "$CORE_REPO_DIR"
    echo "Copying repo to patch directory.."
    cp -r "$REPO_DIR" "$REPO_DIR_PATCH"
    cp -r "$CORE_REPO_DIR" "$CORE_REPO_DIR_PATCH"
    echo "Repo updated!, ready to applyPatches"
}

create_patches() {
    cd "$REPO_DIR_PATCH" || exit
    echo "Creating patches..."
    git format-patch -o "$PATCHES_DIR" origin/$BRANCH_GIT
    echo "Patches created at $REPO_DIR_PATCH"
}

apply_patches() {
    cd "$REPO_DIR_PATCH" || exit
    echo "Applying patches..."
    for patch in "$PATCHES_DIR"/*.patch; do
        git apply "$patch"
        patch_name=$(basename "$patch" .patch)
        patch_description=$(echo "$patch_name" | sed 's/^[0-9]*-//')
        patch_description=$(echo "$patch_description" | sed 's/-/ /g')
        git add .
        git commit -m "$patch_description"
        echo "Patch \"$patch_description\" applied!"
    done
}

# Args validator
case "$1" in
    updateUpstream)
        reclone_repo
        ;;
    createPatches)
        create_patches
        ;;
    applyPatches)
        apply_patches
        ;;
    *)
        echo "Function available on this script:
            $0 updateUpstream
                Allows to update the source code by deleting and recloning the source folder
            $0 createPatches
                Allows you to create patches
            $0 applyPatches
                Allows you to apply patches"
        exit 1
        ;;
esac