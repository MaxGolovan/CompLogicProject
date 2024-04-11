def task1(n1, n2):
    odd = 0
    oddsum = 0
    even = 0
    evensum = 0
    for i in range(n1, n2+1):
        if ((i*8 + 1)**0.5)%1 == 0:
            if i%2 == 0:
                print(i, 'even')
                even = even + 1
                evensum = evensum + i
            else:
                print(i, 'odd')
                odd = odd + 1
                oddsum = oddsum + i
    print('Even: ', even)
    print('EvenSum: ', evensum)
    print('Odd: ', odd)
    print('OddSum: ', oddsum)


def task2(initial, n, x):
    count=0
    num = initial
    while count != n:
        num = num + 1
        count = count + 1
        if x%int(initial*num) == 0:
            print(initial*num,"is a factor of",x)
        else:
            print(initial*num, "isn't a factor of", x)

def task3(a, b, c, n1, n2):
    for n in range(n1, n2+1):
        print(a*n**3 + b*n + c)
    t = (a*n1**3 + b*n1 + c)*(a*n2**3 + b*n2 + c)
    if t%4 == 0:
        print(t, "Multiple of number 4")
    else:
        print(t, "Not multiple of number 4")


def menu(pswd):
    while pswd != "COMP1236" and pswd != "Comp1236":
        pswd = input("Incorrect password! Please enter again: ")
    op = input('\n=== Menu ===\nSelect operation:\nT - task1\nN - task2\nS - task3\n')
    while op != 'T' and op!= 't' and op != 'N' and op != 'n' and op != 'S' and op != 's':
        op = input('Error!\nSelect correct operation:\nT - task1\nN - task2\nS - task3\n')
    if op == "T" or op == "t":
        x1 = int(input("\n=== Task1 ===\nEnter lower limit of the range: "))
        x2 = int(input("Enter upper limit of the range: "))
        print("\nResults: ")
        task1(x1, x2)
    if op == "N" or op == "n":
        x1 = int(input("\n=== Task2 ===\nEnter initial number: "))
        x2 = int(input("Enter amount of numbers: "))
        x3 = int(input("Enter positive integer x: "))
        print("\nResults: ")
        task2(x1, x2, x3)
    if op == "S" or op == "s":
        x1 = int(input("\n=== Task3 ===\nEnter coefficient (a) for sequence given by the rule Term = an^3 + bn + c: "))
        x2 = int(input("Enter coefficient (b) for sequence given by the rule Term = an^3 + bn + c: "))
        x3 = int(input("Enter coefficient (c) for sequence given by the rule Term = an^3 + bn + c: "))
        x4 = int(input("Enter lower limit of the range: "))
        x5 = int(input("Enter upper limit of the range: "))
        print("\nResults: ")
        task3(x1, x2, x3, x4, x5)



password = input("Enter your password: ")
menu(password)
nextstep = input("\nSelect option: \nE - exit\nM - menu\n")
while nextstep == "M" or nextstep == "m":
    menu('Comp1236')
    nextstep = input("\nSelect option: \nE - exit\nM - menu\n")





