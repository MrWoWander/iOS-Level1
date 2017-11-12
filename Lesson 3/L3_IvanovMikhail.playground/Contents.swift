import UIKit
/*
Задание
1. Описать несколько структур - любой легковой автомобиль и любой грузовик.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, стоятние запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем - запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в ваши структуры метод с одним аргументом типа вашего перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров ваших структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/
enum enginePower {
    case on
    case off
}
enum window : String {
    case open = "открыто"
    case close = "закрыто"
}
enum cargo {
    case loaded
    case unloaded
}

struct passengerСar {
    var brand : String
    var yearManufacture : Int
    var volumeCar : Int
    var enginePower : enginePower = .off {
        didSet {
            print("Двигатель: \(enginePower)")
        }
    }
    var windowCar : window = .close {
        didSet {
            print("Ваше окно \(windowCar.rawValue)")
        }
    }
    var filledTrunk = 0 {
        willSet {
                print("У вас было \(volumeCar - filledTrunk) свободного объема в багажнике")
                }
        didSet {
            print("Теперь \(volumeCar - filledTrunk)")
        }
    }
    
    mutating func openAndCloseWindow() {
        if windowCar == .open {
            self.windowCar = .close
        } else {
            self.windowCar = .open
        }
    }
    
    mutating func engineOnAndOff() {
        if enginePower == .on {
            self.enginePower = .off
        } else {
            self.enginePower = .on
        }
    }
    
    mutating func cargoCar(loadAndUnload: cargo, volume: Int) {
        switch loadAndUnload {
        case .loaded:
            if (filledTrunk >= volumeCar) || ((volume + filledTrunk) >= volumeCar) {
                print("Нет места в багажнике")
            } else {
                self.filledTrunk = filledTrunk + volume
            }
        case .unloaded:
            if filledTrunk < 0 || (filledTrunk - volume) < 0 {
                print("Багажник пуст")
            } else {
                self.filledTrunk = filledTrunk - volume
            }
        }
    }
    

    
    init(brand: String, year: Int, volume: Int) {
        self.brand = brand
        self.yearManufacture = year
        self.volumeCar = volume
    }
}
var car = passengerСar(brand: "BMW", year: 2013, volume: 24)

print("Марка автомобиля: \(car.brand) \nГод выпуска: \(car.yearManufacture) \nОбъем багажника: \(car.volumeCar)\n")

car.openAndCloseWindow()
car.cargoCar(loadAndUnload: .loaded, volume: 20)
car.cargoCar(loadAndUnload: .loaded, volume: 5)
car.cargoCar(loadAndUnload: .unloaded, volume: 17)
print()
car.engineOnAndOff()
car.openAndCloseWindow()
print()
car.engineOnAndOff()
car.cargoCar(loadAndUnload: .unloaded, volume: 3)
car.cargoCar(loadAndUnload: .unloaded, volume: 1)
