import UIKit

//Задание 1
//Написать функцию, которая определяет четное число или нет.
print("Задание 1:")

var number = 100

func parity (_ numb: Int) -> Bool {
    if numb % 2 == 0 {
        return true
    } else {
        return false
    }
}
if parity(number) {
    print("Число \(number) четное")
} else {
    print("Число \(number) нечетное")
}

//Задание 2
//Написать функцию, которая определяет, делится ли число без остатка на 3.
print("\nЗадания 2:")

let dividend = 9

func residue (numb: Int) -> Bool {
    if numb % 3 == 0 {
       return true
    } else {
        return false
    }
}

if residue(numb: dividend) {
    print("Число \(dividend) делеится на 3 без остатка")
} else {
    print("Число \(dividend) не делиться на 3 без остатка")
}

residue(numb: dividend)

//Задание 3
//Создать возрастающий массив из 100 чисел. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("\nЗадание 3:")

var arr: [Int] = []

for i in 0..<100 {
    arr.append(i)
}

arr

for v in arr{
    if parity(v) || !residue(numb: v) {
        arr.remove(at: arr.index(of: v)!)
    }
}


/* Второй вариант решения без вызова метода удаления
 
for i in 0..<100 {
    if parity(v) || !residue(numb: v) {
        continue
    }
    arr.append(i)
}
*/

print(arr)

//Задание 4
//Написать функцию, которая добавляет в массив новое число Фибоначчи и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
print("\nЗадание 4")

func fiban (numb: Int) -> [Int] {
    var a = -1, b = 1
    var resultArr : [Int] = []
    for _ in 0...numb {
        let fib = a+b
        a = b
        b = fib
        resultArr.append(fib)
    }
    return resultArr
}

print(fiban(numb: 20))  //100 элементов не получается добавить, так как в итоге очень большое число получается. Максимум получило 92

//Задание 5
/* Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел, не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа кратные p: 2p, 3p, 4p, ...).
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
*/
print("\nЗадание 5:")


let n = 30
var arrEl : [Int] = []

for i in 2...n {
    arrEl.append(i)
}

arrEl

for i in 0...arrEl.count {
    let p = arrEl[i]
    var c = 2
    
    guard p * c < n else {break}
    
    for _ in 0...arrEl.count {
        let result = p * c
        
        guard result <= n else {break}
        
        for v in arrEl {
            if result == v {
                arrEl.remove(at: arrEl.index(of: v)!)
            }
        }
        c += 1
    }
}
print(arrEl)

