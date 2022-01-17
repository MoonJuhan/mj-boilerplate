echo "create-mj-boilerplate"

name=""
input=""
packageList=("vue3" "react")

function setName() {
    printf "Enter App Name: "
    read name
    echo "App Name is $name"
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
        for ((i = 0; i < 2; i++)); do
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
        echo "You Select Vue3."
        git clone --depth=1 --branch vue3 https://github.com/MoonJuhan/mj-boilerplate ${name}

        changeFile "${name}/package.json" "mj-boilerplate-vue3-template" "${name}"
        changeFile "${name}/package-lock.json" "mj-boilerplate-vue3-template" "${name}"
    elif [ "${packageName}" == "react" ]; then
        echo "You Select React."
        git clone --depth=1 --branch react https://github.com/MoonJuhan/mj-boilerplate ${name}

        changeFile "${name}/package.json" "mj-boilerplate-vue3-template" "${name}"
        changeFile "${name}/package-lock.json" "mj-boilerplate-vue3-template" "${name}"
    elif [ "${packageName}" == "nuxt2 (scheduled)" ]; then
        echo "You Select Nuxt2. The package is being prepared."
    elif [ "${packageName}" == "nuxt3 (scheduled)" ]; then
        echo "You Select Nuxt3. The package is being prepared."
    fi
}

function changeFile() {
    ed - -s ${1} <<EOF
        %s/${2}/${3}
        w
EOF
}

# Main Process Start
setName

if [ ! -d ${name} ]; then
    selectPackage
    setupPackage
else
    echo "${name} is exist"
fi
