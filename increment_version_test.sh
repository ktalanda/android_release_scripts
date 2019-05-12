 #!/bin/bash
 . increment_version.sh

function assertEqual {
    if [ "$1" == "$2" ]; then
        echo "....SUCCESS"
    else
        echo "'$1' should be equal '$2'"
        echo "....FAIL"
    fi
}

echo "increment_patch"
actual=$(increment_patch 'versionName "1.6.7"')
expected='versionName "1.6.8"'
assertEqual "$actual" "$expected"

echo "increment_minor"
actual=$(increment_minor 'versionName "1.6.7"')
expected='versionName "1.7.0"'
assertEqual "$actual" "$expected"
