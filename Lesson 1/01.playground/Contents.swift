//: Playground - noun: a place where people can play

import UIKit

//Базовые типы данных
var i : Int = 10
var string : String = "string"
var db1 : Double = 3.14
var ch1 : Character = "a"

let dVar = 1.3423234
let iVar = 12345
var bVar = false
var strVar = "Hello"
var chVar = "Z"

//Преобразования типа
// is as as?
dVar is Double
dVar is String

//dVar as Int ошибка
dVar as? Int // так как преобразование невозможно = nil


// Опциональный тип
var optionalInt : Int? = 10

var optionalString : String? = "Optional String sample"

//optionalInt = nil

if optionalInt != nil {
    optionalInt! is Int
}

let unboxResult = optionalInt ?? -1 // Если Int nil = -1, если нет = 10
unboxResult

var arr = Array(1...10) // интервал в массиве
arr = Array(1..<10)

var tuple = (st: "String", num: 25)
