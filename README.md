# genome_shell_utility
a genome shell utility to help you with the project management and organization. It will automatically create the folders and transfers the files to the sever and will move around. Also coding the same using the hashicorp language so that it will automatically create the aws, google or the azure instance and will launch the server analysis. The code is given below. Adding the support for the hashicorp and server instance creation. 

read -r -p "please provide the name of the project:" project
read -r -p "please provide the system type:" system
read -r -p "please provide the project creation and scratch address:" scratch
if [[ ${project} ]] &&
        [[ ${system} == "desktop" ]] &&
                             [[ ${scratch} ]] 
then
    for i in {1..8} # array bash with in the call is not allowed so if you have specific number call it as ${number}. 
        do mkdir "${project}"_"$i"
    done
    for i in "${project}"_*
        do echo du -sh "${i}" && mv "$i" "${scratch}"
    done
elif  [[ ${project} ]] &&
        [[ ${system} == "server" ]] && 
                            [[ ${scratch} ]]
then
    read -r -p "please provide the username for the slurm server:" username
    read -r -p "please provide the ip address of the server:" address
    read -r -p "please provide the path to the scratch:" scratch
    read -r -p "please provide the name of the project:" project 
    ssh "${username}"@"${address}"
     cd "${scratch}"
        for i in {1..8}
            do echo "${project}"_"$i"
        done
        for i in "${project}"_*
            do echo du -sh "${i}" && mv "$i" "${scratch}"
        done
else 
    echo "no option selected"
fi


