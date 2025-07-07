#!/bin/bash

function validate_name() {
    if [[ "$1" =~ ^[a-zA-Z]+$ ]]; then
        return 0
    else
        return 1
    fi
}

function validate_number() {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

while true
do
    echo ""
    echo "==================== Phone Directory ===================="
    echo "1. Add data in your contact"
    echo "2. Search a number from your contact"
    echo "3. Delete a number"
    echo "4. View your phone directory"
    echo "5. Delete all data"
    echo "6. Quit"
    echo "========================================================="
    echo ""
    read -p "Enter Your Choice: " user_input
    clear

    case $user_input in

        1)
            echo "Add contact information"

            
            while true; do
                read -p "Enter name: " name
                if validate_name "$name"; then
                    echo "Name entered successfully."
                    break
                else
                    echo "Invalid input! Please enter only letters."
                fi
            done

            
            while true; do
                read -p "Enter number: " number
                if validate_number "$number"; then
                    echo "Number entered successfully."
                    break
                else
                    echo "Invalid input! Please enter only digits."
                fi
            done

            echo "$name : $number" >> phonedir.log
            echo "Contact saved!"
            ;;

        2)
            echo "Search Contact"
            read -p "Enter contact name to search: " search_query
            clear
            echo "Search Results:"
            if grep -iq "$search_query" phonedir.log; then
                grep -i "$search_query" phonedir.log
            else
                echo "No contact found with that name."
            fi
            ;;

        3)
            echo "Delete Contact"
            read -p "Enter contact name to delete: " delete_name
            read -p "Enter contact number to delete: " delete_number
            if grep -iq "$delete_name : $delete_number" phonedir.log; then
                sed -i "/$delete_name : $delete_number/d" phonedir.log
                echo "Contact deleted successfully."
            else
                echo "Contact not found."
            fi
            ;;

        4)
            echo "Phone Directory:"
            echo "-----------------------------"
            if [ -s phonedir.log ]; then
                cat phonedir.log
            else
                echo "Directory is empty."
            fi
            ;;

        5)
            if [ -s "phonedir.log" ]; then
                read -p "Are you sure you want to delete all contacts? (y/n): " confirm
                if [ "$confirm" == "y" ]; then
                    > phonedir.log
                    echo "All contacts deleted successfully."
                else
                    echo "Deletion cancelled."
                fi
            else
                echo "Nothing to delete — directory is already empty."
            fi
            ;;

        6)
            echo "Exiting Phone Directory. Goodbye!"
            break
            ;;

        *)
            echo "Invalid option. Please choose between 1-6."
            ;;
    esac

    echo ""
    read -p "Press Enter to return to the menu..." dummy
    clear
done
