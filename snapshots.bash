#!/bin/bash

###############################################################################
#                                 ABSTRACT                                    #
###############################################################################

#######################################
#
# Making snapshot of some directory to some place
#
# Arguments:
#   source_dir Directory to make snapshot of
#   dest_dir Directory to save snapshot to
#   prefix Prefix name of directory
#
#######################################
_make_snapshot() {
    local source_dir=$1
    local dest_dir=$2
    local prefix=$3
    sudo btrfs subvolume snapshot -r "${source_dir}" "${dest_dir}/${prefix}_backup_$(date +%F)"
}

#######################################
#
# Remove made by btrfs snapshot
#
# Arguments:
#   dest_dir Directory where snapshot is stored
#   snapshot_name Name of directory of snapshot
#
#######################################
_remove_snapshot() {
    local dest_dir=$1
    local snapshot_name=$2

    if [[ -z "$snapshot_name" ]]; then
        echo "Error: Please provide a snapshot name."
        return 1
    fi

    # Prepending the dest_dir is CRITICAL so you can run this from any folder
    sudo btrfs subvolume delete "${dest_dir}/${snapshot_name}"
}

###############################################################################
#                             SYSTEM SNAPSHOT                                 #
###############################################################################

#######################################
#
# Creating btrfs-snapshot for system directory
#
# Globals:
#   SNAPSHOTS_SYS Global path to system snapshots directory
#######################################
make-snapshot-sys() {
    _make_snapshot "/" "${SNAPSHOTS_SYS}" "root"
}

#######################################
#
# Remove stored btrfs-snapshot from system storage directory
#
# Globals:
#   SNAPSHOTS_SYS Global path to system snapshots directory
# Arguments:
#   Path to directory of snapshot to remove
#
#######################################
remove-snapshot-sys() {
    _remove_snapshot "" "${SNAPSHOTS_SYS}" "$1"
}

_comp_snapshot_sys() { # zsh autocomplete
    _files -W "${SNAPSHOTS_SYS}" -/
}
compdef _comp_snapshot_sys remove-snapshot-sys

###############################################################################
#                              HOME SNAPSHOT                                  #
###############################################################################

#######################################
#
# Creating btrfs-snapshot for home directory
#
# Globals:
#   SNAPSHOTS_HOME Global path to home snapshots directory
#######################################
make-snapshot-home() {
    _make_snapshot "/home" "${SNAPSHOTS_HOME}" "home"
}

#######################################
#
# Remove stored btrfs-snapshot from home storage directory
#
# Globals:
#   SNAPSHOTS_SYS Global path to home snapshots directory
# Arguments:
#   Path to directory of snapshot to remove
#
#######################################
remove-snapshot-home() {
    _remove_snapshot "" "${SNAPSHOTS_HOME}" "$1"
}

_comp_snapshot_home() { # zsh autocomplete

    _files -W "${SNAPSHOTS_HOME}" -/
}
compdef _comp_snapshot_home remove-snapshot-home
