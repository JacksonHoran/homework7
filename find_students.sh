#!/bin/bash

#checks if the command given contains an id
if [ "$#" -eq 0 ]; then
    echo "Please provide a student ID"
    exit 
fi

# define student id variable and load the JSON file
id=$1
students=$(cat students.json)

# iterates over the json data and defines both id and grade variable,
# then takes the given student id and prints their grade
found=false
for i in $(echo "${students}" | jq -c '.[]'); do
    id=$(echo "${i}" | jq -r '.id')
    grade=$(echo "${i}" | jq -r '.grade')

    if [ "${id}" = "${student_id}" ]; then
        found=true
        echo "Student ID: ${id}"
        echo "Final Grade: ${grade}%"
        break
    fi
done

#displays error message incase the student is not found
if [ "$found" = false ]; then
    echo "Error. Student not found in data base"
fi
