echo "create-mj-boilerplate"

name=""

function setName() {
    printf "Enter App Name: "
    read name
    echo "App Name is $name"

    if [ ! -d $name ]; then
        mkdir $name
    else
        echo "$name is exist"
    fi
}

setName

# mkdir $name

# SELECT=""

# while [[ "$SELECT" != $'\x0a' && "$SELECT" != $'\x20' ]]; do
#     echo "Press <Space> to move selection"
#     echo "Press <Enter> to confirm selection"
#     read -d'' -s -n1
#     echo "Debug/$SELECT/${#SELECT}"
#     [[ "$SELECT" == $'\x0a' ]] && echo "enter" # do your install stuff
#     [[ "$SELECT" == $'\x20' ]] && echo "space" && echo -ne "$options" # reprint options
# done
