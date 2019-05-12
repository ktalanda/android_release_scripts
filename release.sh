#!/bin/bash
my_dir="$(dirname "$0")"
. "$my_dir/increment_version.sh"

function get_old {
   cat app/build.gradle | grep 'versionName "[0-9]\+.[0-9]\+.[0-9]\+"' 
}

function replace_version {
    sed -i.bak "s/$1/$2/g" app/build.gradle
    rm app/build.gradle.bak
}

function release_patch {
    old=$(get_old)
    new=$(increment_patch "$old")
    new="        $new"
    replace_version "$old" "$new"
}

function release_minor {
    old=$(get_old)
    new=$(increment_minor "$old")
    new="        $new"
    replace_version "$old" "$new"
}

if [ "$1" == "minor" ]; then
    release_minor
elif [ "$1" == "patch" ]; then 
    release_patch
else
    echo "minor or patch"
fi
