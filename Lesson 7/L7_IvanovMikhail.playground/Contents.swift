import UIKit

/*
 1. Придумать класс методы, которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
 
 2. Придумать класс методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */
enum RestaurantError : String, Error {
    case itemNotFound = "Такого в меню нет!"
    case notEnoughCount = "Нехватает денег"
    case ageNotSuitable = "Вы слишком малы, чтобы брать такие напитки"
}

struct Menu {
    var name : String
    var price : Int
}
struct Drinks {
    var name: String
    var price: Int
    var ageClient: Int
}


class Restaurant {
    var nameClient : String
    var ageClient : Int
    var countClietn : Int
    var menuEat = [
        "Гуляшь" : Menu(name: "Рулька", price: 500),
        "Кнеглики" : Menu(name: "Кнеглики", price: 340),
        "Бургер" : Menu(name: "Бургер", price: 470),
        "Тортик" : Menu(name: "Тортик", price: 100)
    ]
    var menuDrink = [
        "Пиво" : Drinks(name: "Пиво", price: 180, ageClient: 18),
        "Кола" : Drinks(name: "Кола", price: 70, ageClient: 0),
        "Водка" : Drinks(name: "Водка", price: 260, ageClient: 21)
    ]
    
    func buy(itemName: String, eatAndDrink: Bool ) throws {  // true - Eat, false - Drink
        if eatAndDrink { // Eat
            guard let item = menuEat[itemName] else {
                throw RestaurantError.itemNotFound
            }
            guard item.price <= countClietn else {
                throw RestaurantError.notEnoughCount
            }
            countClietn -= item.price
        } else { // Drink
            guard let item = menuDrink[itemName] else {
                throw RestaurantError.itemNotFound
            }
            guard item.price <= countClietn else {
                throw RestaurantError.notEnoughCount
            }
            guard item.ageClient <= ageClient else {
                throw RestaurantError.ageNotSuitable
            }
             countClietn -= item.price
        }
    }
    init(nameClient: String, ageClient: Int, countClient: Int) {
        self.nameClient = nameClient
        self.ageClient = ageClient
        self.countClietn = countClient
    }
}

var client1 = Restaurant(nameClient: "Max", ageClient: 17, countClient: 1000)
do {
    try client1.buy(itemName: "Пиво", eatAndDrink: false)
} catch RestaurantError.itemNotFound {
    print(RestaurantError.itemNotFound.rawValue)
} catch RestaurantError.notEnoughCount {
    print(RestaurantError.notEnoughCount.rawValue)
} catch RestaurantError.ageNotSuitable {
    print(RestaurantError.ageNotSuitable.rawValue)
}
client1.countClietn
