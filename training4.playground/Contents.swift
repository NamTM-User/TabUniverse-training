import UIKit

// ----------------- Closure ---------------------------------
// 1. Closure có thể gán vào biến
//   -> closure không tham số
let checkClosure1 = { // biến closure
    print("check closure")
}
checkClosure1() // gọi closure

//   -> closure có tham số
let checkClosure2 = {
    (_a: Int, _b: Bool) -> String in
    return "Check Closure 2"
}

print(checkClosure2(10 , true))

// 2.Function nhận closure
//      -> func nhan closure khong co tham so
let paraClosureFunc = {
    return 1
}

func funcCheckClosure(_ a: () -> Int ) -> Int {
    // gọi thực thi closure
    return a()
}

print(funcCheckClosure(paraClosureFunc))

//     -> func nhan closure co tham so
let paraClosureFunc2 = {
    (_a: Int, _b: String) -> String in
    return "Check Closure Function"
}

func funcCheckClosure2(_ b: (Int , String) -> String ) -> String {
    return b(10, "abc")
}

print(funcCheckClosure2(paraClosureFunc2))

// closure array
var arr = [10,5,40,30,2]
let arr1 = arr.map({
    (nums: Int) -> Int in
    return nums * 2
})
print(arr1)

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// Sorted
// 1. sorted(by: ) => truyền vào closure để so sánh
var reversedName = names.sorted(by: { $0 > $1 })

print(reversedName)


// -------------------------------------------Subscripts-----------------------------------------------
struct MyArray {
    var data: [Int] = [10, 20, 30]

    subscript(index: Int) -> Void {
        print("subscript",index)
    }
}

let arrSubscript = MyArray()
print(arrSubscript[2]) // [] bản chất là để gọi subscript

struct Matrix {
    var data = [ [1,2] , [5,6] , [2,3] ]
    
    subscript(row: Int, col: Int) -> Int {
        return data[row][col]
    }
}
let m = Matrix()

// -----------------------------------------Initializers-------------------------------------------------

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")


struct Celsius {
    var temperatureInCelsius: Double
    init(fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(kelvin: 500)
print(boilingPointOfWater.temperatureInCelsius)

// Optional Property Types
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(response)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask() // Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."



// -------------------------------- Initializer Inheritance and Overriding ------------------------------

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        get {
            return "\(numberOfWheels) wheel(s)"
        }
    }
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        self.numberOfWheels = 2
    }
}

let check = Bicycle()
print(check.description)


class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

// -------------------------------------- Convenience Initializers ----------------------------------------
// init phụ, dùng để “đơn giản hóa cách tạo object”

class Person {
    var name: String
    var age: Int

    // Designated initializer (init chính)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // Convenience initializer
    convenience init(name: String) {
        self.init(name: name, age: 18) // mặc định age = 18
    }
}

    let p1 = Person(name: "Nam", age: 20)  // init chính
    let p2 = Person(name: "An")            // convenience init , auto age = 18 neu goi doi tuong chi voi 1 tham so
