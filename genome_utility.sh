#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Universität Potsdam, Germany
# Author: Gaurav Sablok
# date: 2024-1-13
# a scratch automator for the system as well as the administration of the genomes raw files
# change the number as per your convineince 
echo "genome assembly project creation and maintainance"
read -r -p "please provide the name of the project:" project
read -r -p "please provide the system type:" system
read -r -p "please provide the project creation and scratch address:" scratch
if [[ ${project} ]] &&
        [[ ${system} == "desktop" ]] &&
                             [[ ${scratch} ]] 
then
    for i in {1..8}
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
