 #!/bin/bash

function increment_patch {
    new=$(echo $1|awk -F'.' -v OFS='.' '{$3=sprintf("%d",++$3)}7')
    echo $new'"'
}

function increment_minor {
    new=$(echo $1|awk -F'.' -v OFS='.' '{$2=sprintf("%d",++$2)}7')
    new=$(echo $new|awk -F'.' -v OFS='.' '{$3=sprintf("%d",0)}7')
    echo $new'"'
}
