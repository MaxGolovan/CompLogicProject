task1() {
    oddcount=0
    oddsum=0
    evencount=0
    evensum=0
    for (( i=$1; i<=$2; i++ ))
    do
        num=$(echo "$i*8 + 1" | bc)
        root=$(echo "scale=5; sqrt($num)" | bc)
        square=$(echo "$root * $root / 1" | bc)
        if (( $square == $num ))
        then
            if (( $i%2 == 0 ))
            then
                echo "$i even"
                ((even++))
                ((evensum+=i))
            else
                echo "$i odd"
                ((oddcount++))
                ((oddsum+=i))
            fi
        fi
    done
    echo "EvenCount: $evencount"
    echo "EvenSum: $evensum"
    echo "OddCount: $oddcount"
    echo "OddSum: $oddsum"
}


task3() {
    for (( n=$4; n<=$5; n++ ))  
    do
        echo "$(($1*$n**3 + $2*$n + $3))" 
    done
    t=$(( ($1*$4**3 + $2*$4 + $3) * ($1*$5**3 + $2*$5 + $3) ))
    if (( $t % 4 == 0 ))
    then
        echo "$t Multiple of number 4"
    else
        echo "$t Not multiple of number 4"
    fi
}


menu() {
    pswd=$1
    while [[ "$pswd" != "COMP1236" && "$pswd" != "Comp1236" ]]
    do
        read -p "Incorrect password! Please enter again: " pswd
    done
    read -p $'\n=== Menu ===\nSelect operation:\nT - task1\nN - task2\nS - task3\n' op
    while [[ "$op" != 'T' && "$op" != 't' && "$op" != 'N' && "$op" != 'n' && "$op" != 'S' && "$op" != 's' ]]
    do
        read -p $'Error!\nSelect correct operation:\nT - task1\nN - task2\nS - task3\n' op
    done
    if [[ "$op" == "T" || "$op" == "t" ]]
    then
        read -p $'\n=== Task 1 ===\nEnter lower limit of the range: ' x1
        read -p 'Enter upper limit of the range: ' x2
        echo -e '\nResults: '
        task1 $x1 $x2
    fi
    if [[ "$op" == "S" || "$op" == "s" ]]
    then
        read -p $'\n=== Task 3 ===\nEnter coefficient (a) for sequence given by the rule Term = an^3 + bn + c: ' x1
        read -p 'Enter coefficient (b) for sequence given by the rule Term = an^3 + bn + c: ' x2
        read -p 'Enter coefficient (c) for sequence given by the rule Term = an^3 + bn + c: ' x3
        read -p 'Enter lower limit of the range: ' x4
        read -p 'Enter upper limit of the range: ' x5
        echo -e '\nResults: '
        task3 $x1 $x2 $x3 $x4 $x5
    fi
}

read -p 'Enter your password: ' password
menu $password
read -p $'\nSelect option: \nE - exit\nM - menu\n' nextstep
while [[ "$nextstep" == "M" || "$nextstep" == "m" ]]
do
    menu 'Comp1236'
    read -p $'\nSelect option: \nE - exit\nM - menu\n' nextstep
done
