import UIKit
/*
 1. Создать протокол Car и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола Car и реализовать в нем методы конкретных действий с автомобилем - открыть/закрыть окно, запустить/заглушить двигатель и т.д. По одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей.
 
 3. Создать два класса, имплементирующих протокол Car - tunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести сами объекты в консоль.
 */

enum Engine {
    case on, off
}

enum Cargo : String {
    case load = "загружать"
    case unload = "выгружать"
}

enum Window: String {
    case open = "открыто"
    case close = "закрыто"
}

protocol CarProtocol {
    var brand : String {get set}
    var color : String {get set}
}

extension CarProtocol {
    func powerEngine(engine: Engine) -> String {
        return "Двигатель \(engine)"
    }
    func openWindow(window: Window) {}
}

class TruckCar : CarProtocol {
    var brand: String
    var color: String
    var volume: Int
    private var overflowTruck = 0 {
        willSet {
            print("Вы открыли кузов")
        }
        didSet {
            print("Теперь в кузове \(overflowTruck) штук груза\n")
        }
    }
    func powerEngine(engine: Engine) -> String {
        return "Двигатель \(engine)\n"
    }
    
    func openWindow(window: Window) {
        print("Окно \(window.rawValue)\n")
    }
    
    func overflow(cargo: Int, action: Cargo) {
            switch action {
            case .load:
                if (volume <= overflowTruck) || (volume <= (overflowTruck + cargo)) {
                    print("Кузов забит под завязку! Освободите место, перед тем, как погрузить другой груз\n")
                } else {
                    overflowTruck += cargo
                }
            case .unload:
                if overflowTruck == 0 {
                    print("В кузове нет больше груза\n")
                } else if (overflowTruck - cargo) < 0 {
                    print("В кузове меньше товара, чем хотят выгрузить\n")
                } else {
                    overflowTruck -= cargo
                }
            }
    }
    
    init(brand: String, color: String, volume: Int) {
        self.brand = brand
        self.color = color
        self.volume = volume
    }
}
extension TruckCar : CustomStringConvertible {
    var description : String {
        return "Модель автомобиля: \(brand) \nЦвет автомобиля: \(color) \nГруз: \(volume)\n"
    }
}

class SportCar : CarProtocol {
    var brand: String
    var color: String
    var maxSpeed : Int
    
    func powerEngine(engine: Engine) -> String {
        return "Двигатель спорткара \(engine)\n"
    }
    
    func openWindow(window: Window) {
        print("Окно спорткара \(window.rawValue)\n")
    }
    
    func route(km: Float) -> Int {
            let result = (km / Float(maxSpeed)) * 60
            return Int(roundf(result))
    }
    
    init(brand: String, color: String, maxSpeed: Int) {
        self.brand = brand
        self.color = color
        self.maxSpeed = maxSpeed
    }
}
extension SportCar : CustomStringConvertible {
    var description : String {
        return "Модель автомобиля: \(brand) \nЦвет автомобиля: \(color) \nМаксимальная скорость: \(maxSpeed)\n"
    }
}

var truck = TruckCar(brand: "BMW", color: "Red", volume: 40)
print(truck)
truck.powerEngine(engine: .off)
truck.openWindow(window: .open)
truck.overflow(cargo: 5, action: .load)


var sportCar = SportCar(brand: "Lamb", color: "Blue", maxSpeed: 300)
print(sportCar)
print(sportCar.powerEngine(engine: .on))
print("Вы доедете за \(sportCar.route(km: 100)) минут\n")
sportCar.openWindow(window: .open)
