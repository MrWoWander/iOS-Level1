import UIKit
// Задание 1
//Решить квадратное уравнение
//ax^2 + bx + c = 0

print("Задание 1:")

let a = 1
let b = -2
let c = -3
var d = Int(pow(Double(b), 2)) - 4 * a * c                                      // Дискриминант

if d == 0 {                                                                     // При D = 0 считается по одной формуле
  let x = (Int(Double(-b) + sqrt(Double(d)))) / (2 * a)
    print("Один корень: \(x)")
} else if d > 0 {                                                               // При D > 0 считается по двум формулам
    let x1 = (Int(Double(-b) + sqrt(Double(d)))) / (2 * a)
    let x2 = (Int(Double(-b) - sqrt(Double(d)))) / (2 * a)
    print("Два корня: \(x1) и \(x2) ")
} else {                                                                        // При D < 0 корней нет
    print("Корня нет")
}


// Задание 2
// Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
print("\nЗадания 2:")

let cat1 : Double = 3                                                           // Первый катет
let cat2 : Double = 4                                                           // Второй катет
let gip = sqrt(pow(cat1, 2) + pow(cat2, 2))                                     // Гипотенуза
let perim = cat1 + cat2 + gip                                                   // Периметр
let area = 0.5 * (cat1 * cat2)                                                  // Площадь

print("Гипотенуза = \(Int(gip)) \nПериметр = \(Int(perim)) \nПлощадь = \(Int(area))")


// Задание 3
// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
print("\nЗадание 3:")

var sum : Double = 10000                                                        
let percent = 10
let age = 5
for _ in 0 ..< age {
    sum = sum + ((sum / 100) * Double(percent))

}

print("Сумма вклада: \(Int(sum))")

