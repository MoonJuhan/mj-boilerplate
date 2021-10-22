echo "create-mj-boilerplate"

name=""
input=""
packageList=("vue3" "nuxt2" "nuxt3")

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

function keyInput() {
    input=""
    read -s -n 1 input
    echo ${input}
}

function selectPackage() {
    selectIndex=0

    function printPackageList() {
        echo "Press Enter to choose Package"
        for ((i = 0; i < 3; i++)); do
            if [ ${selectIndex} == ${i} ]; then
                printf "●"
            else
                printf "○"
            fi
            echo " ${packageList[${i}]}"
        done
    }

    clear
    printPackageList

    while true; do
        keyInput

        if [ "$input" == "A" ] && [ ${selectIndex} -gt 0 ]; then
            selectIndex=$(expr ${selectIndex} - 1)
        elif [ "$input" == "B" ] && [ ${#packageList[@]} -gt $(expr ${selectIndex} + 1) ]; then
            selectIndex=$(expr ${selectIndex} + 1)
        elif [ "${input}" == "" ]; then
            break
        fi

        clear
        printPackageList

    done

    clear
}

function setupPackage() {
    packageName=${packageList[${selectIndex}]}
    if [ "${packageName}" == "vue3" ]; then
        echo "You Select Vue3"
        git clone --depth=1 --branch vue3 https://github.com/MoonJuhan/mj-boilerplate
    elif [ "${packageName}" == "nuxt2" ]; then
        echo "You Select Nuxt2"
    elif [ "${packageName}" == "nuxt3" ]; then
        echo "You Select Nuxt3"
    fi
}

# Main Process Start
# setName

# if [ -d $name ]; then
selectPackage
setupPackage
# fi
