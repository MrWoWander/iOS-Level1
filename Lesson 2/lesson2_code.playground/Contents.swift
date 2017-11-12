
//Ветвление switch
let number: Int = 234222
switch number {
    case (let g) where g % 2 == 0:
        print("Четное \(g)")
        fallthrough
    case 1:
        print("1")
    case 1...9:
        print("1..<10")
    case 9...100:
        print("9...100")
    default:
        print("default")
}









var switchArr: [String] = ["a", "b", "c","ddasdd"]

switch switchArr[2]
{
    case (let s) where switchArr[0] == "a":
        print(s)
        fallthrough
    case "b":
        print("b")
//        fallthrough
    case "c":
        print("c")
    case "d":
        print("d")
    default:
        print("def")
}







//Циклические операторы

var x = 5
while x < 10 {
    x+=1
    print("XXX")
}
x = 10
repeat {
    print("Minimum 1 raz")
} while x < 10




let range = 1...6
for index in range {
    print("\(index) times 5 is \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack", "Max"]
for i in 0..<names.count
{
    var element = names[i]
    print("Person \(i + 1) is called \(element)")
}

names.enumerated()

for element in names {
    print("!\(element)!")
}

for _ in 1...5 {
    print("__")
}



let answer = 10

let base = 3
let power = 10
var forResult = 1
for _ in 1...power {
    forResult *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"










func p0() {
    print("P0")
}

func p(name: String) {
    print("p \(name)")
}


func pp(_ name: String) {
    print("pp \(name)")
}

p(name: "Max")
pp("Max")











//Оператор перечисления

enum CompassPoint {
    case north
    case south
    case east
    case west
    case unknown
}

let directionToHead: CompassPoint = .west

switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    case .west:
        print("Where the skies are blue")
    default:
        print("Wrong direction")
}

enum Color : String {
    case Red    = "Красный"
    case Green  = "Зеленый"
    case Blue   = "Синий"
    func name() {
        print("Цвет: \(rawValue)")
    }
}
let enumVar = Color.Red
print("\(enumVar)")
Color.Red.name()
print("\(Color.Red.rawValue)")
enumVar.name()

let rawVar = Color.Red.rawValue
let possibleColor = Color(rawValue: "Синий")








//Функции

//hello()

func hello() {
    print("Hello")
}
hello()

func hello(name: String) -> String {
    print("Hello \(name)")
    return "123"
}


hello(name: "Vasya")


typealias helloReturnValue = (phrase: String,name: String)

func helloPerson(person: String) -> helloReturnValue {
    let greeting = "Hello, " + person + "!!"
    return (greeting, person)
}


let dictionary: [String : String] = ["Key" : "Value"]

let tuple: (phrase: Int, someValue: String, anotherValue: Bool)


dictionary["Key"]





let helloString: String = helloPerson(person: "Vasya").name

// параметр функции по умолчанию
func func_nameDefault(p1: String = "Hello", p2: String = "world") -> String {
    return p1+" "+p2
}
func_nameDefault()
func_nameDefault(p1: "RRR")
func_nameDefault(p2: "RRR")









// Guard
func someFunc(someOptional : Int?) -> String
{
//    let someOptional : Int? = nil
    
    guard let constantName = someOptional else {
        print ("someOptional == nil")
        return "incorrect value"
    }
    
    let  clearInt : Int = constantName
    print(clearInt)
    
    return "result = \(clearInt)"
}
let op1: Int? = nil
someFunc(someOptional: op1)





let o: Int? = nil
let v: Int? = 10
someFunc(someOptional: o)
someFunc(someOptional: v)


typealias minMaxRecord = (min: Int, max: Int)


//Возвращаем кортеж -> Поиск минимума
func minMax(array: [Int]) -> minMaxRecord
{
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
minMax(array: [2,3,4,5,6,7,3]).max
minMax(array: [2,3,4,5,6,7,3]).min





// функция возвращает кортеж
typealias recordType = (Exp :String, Res: Bool, Sum: Int, C: Double)
func func_result() -> recordType {
    return ("ok", true, 5, 0.4)
}
func_result()



