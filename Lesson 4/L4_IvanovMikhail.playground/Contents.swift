import UIKit
/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия.
 
 2. Описать пару его наследников tunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 3. В каждом подклассе реализовать метод действия с автомобилем в соответствии с его классом.
 
 4. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 5. Вывести значения свойств экземпляров в консоль.
 */
enum powerCar {
    case on
    case off
}
enum cargo : String {
    case load = "загружать"
    case unload = "выгружать"
}
enum roof : String {
    case open = "убрана"
    case close = "поднята"
}

//Класс машины
class Car {
    var brand : String
    var color : String
    var engine : powerCar = .off
    
    func power() {
        if engine == .on {
            engine = .off
        } else {
            engine = .on
        }
    }
    
    init(brand: String, color: String) {
        self.brand = brand
        self.color = color
    }
}

// Подкласс грузовика
class truckCar : Car {
    var volumeTruck : Int
    var overflowTruck = 0 {
        willSet {
            print("Вы открыли кузов")
        }
        didSet {
            print("Теперь в кузове \(overflowTruck) штук груза\n")
        }
    }
    override func power() {
        super.power()
        print("Двигатель грузовика \(engine)\n")
    }
    
    func overflow(cargo: Int, action: cargo) {
        if engine == .off {
        switch action {
        case .load:
            if (volumeTruck <= overflowTruck) || (volumeTruck <= (overflowTruck + cargo)) {
                print("Кузов забит под завязку! Освободите место, перед тем, как погрузить другой груз\n")
            } else {
            overflowTruck += cargo
            }
        case .unload:
            if overflowTruck == 0 {
                print("В кузове нет больше груза")
            } else if (overflowTruck - cargo) < 0 {
                print("В кузове меньше товара, чем хотят выгрузить")
            } else {
            overflowTruck -= cargo
            }
        }
        } else {
            print("Заглушите двигатель, перед тем, как \(action.rawValue) груз\n")
    }
    }
    
    init(brand: String, color: String, volume: Int) {
        self.volumeTruck = volume
        super.init(brand: brand, color: color)
    }
}

//Подкласс спортивной машины
class sportCar : Car {
    var maxSpeedCar : Int
    var roofCar : roof = .open {
        willSet {
            print("Была нажата кнопка по открытию/закрытию откидной крыши")
        }
        
        didSet {
            print("Откидная крыша \(roofCar.rawValue)\n")
        }
    }
    override func power() {
        super.power()
        print("Двигатель \(engine)\n")
    }
    
    func roofFunc() {
        if roofCar == .open {
            roofCar = .close
        } else {
            roofCar = .open
        }
    }
    
    func route(km: Float) -> Float {
        if engine == .on {
            let result = (km / Float(maxSpeedCar)) * 60
            print("Вы доедете за \(Int(roundf(result))) минут\n")
            return result
        } else {
            print("Заведите сначало машину\n")
            return 0
        }
    }
    
    init(brand: String, color: String, maxSpeed: Int) {
        self.maxSpeedCar = maxSpeed
        super.init(brand: brand, color: color)
    }
}

// Грузовик - вызов класса
print("Действия с грузовиком:")
var truck = truckCar(brand: "Volvo", color: "Blue", volume: 32)
print("Грузовик \(truck.brand), цевта \(truck.color) вмещает в себя \(truck.volumeTruck) груза\n")
truck.overflow(cargo: 33, action: .load)
truck.overflow(cargo: 25, action: .load)
truck.overflow(cargo: 7, action: .unload)
truck.power()
truck.overflow(cargo: 12, action: .unload)
truck.power()
truck.overflow(cargo: 12, action: .unload)
print()

//Спортивный автомобиль - вызов класса
print("Действия со спортивным автомобилем:")
var sport = sportCar(brand: "Lamb", color: "Red", maxSpeed: 300)
print("Спорткар \(sport.brand), цвета \(sport.color) едет со скоростью \(sport.maxSpeedCar)км/ч\n")
sport.roofFunc()
sport.roofFunc()
sport.route(km: 700) // Узнаем, за сколько проедет машина в минутах
sport.power()
sport.route(km: 300)

