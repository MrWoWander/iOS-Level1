import UIKit

class Queue <T> {
    var arr : [T] = []
    func addQ (value: T...) {
        for i in value {
            arr.append(i)
        }
    }
    
    func removeQ() -> T? {
        if arr.count > 0 {
        return arr.removeFirst()
        }
        return nil
    }
    
    func removeAllQ() -> [T]? {
        if arr.count > 0 {
            var result : [T] = []
            for i in arr {
                result.append(i)
                arr.removeFirst()
            }
            return result
        }
        return nil
    }
    
    func countQ() -> Int {
        return arr.count
    }
}

extension Queue : CustomStringConvertible {
    var description: String {
        return "Коллекция очереди"
    }
}

var stringQ = Queue<String>()
stringQ.addQ(value: "test", "adad", "goipawdad", "e", "223dad")
stringQ.arr.sorted()
stringQ.countQ()
stringQ.removeQ()
stringQ.addQ(value: "666", "dead")
stringQ.arr.sort()
stringQ.countQ()
stringQ.removeQ()
stringQ.countQ()
stringQ.removeQ()
stringQ.removeQ()
stringQ.removeQ()
stringQ.countQ()
stringQ.removeQ()
stringQ.removeQ()
stringQ.removeQ()
stringQ.addQ(value: "23424", "sfjklsjf")
stringQ.removeAllQ()
