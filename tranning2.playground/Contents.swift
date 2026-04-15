import UIKit

// -------------- Function Types-------------------

// Khai báo function
func checkFunc(a: Int, b: String) -> Bool {
    return true
}

// Function không return
func sayHello(name: String) {
    print("Hello \(name)")
}

// Function type (gán hàm vào biến)
func add(a: Int, b: Int) -> Int {
    return a + b
}

var f: (Int, Int) -> Int = add

print(f(2, 3)) // 5


// --------------- 3. Struct --------------------
// Khai báo struct
struct Person {
    var name: String
    var age: Int
    
    func sayHello() {
        print("Hello \(name)")
    }
}

let p = Person(name: "Nam", age: 22)
p.sayHello()

// Struct Value type coppy

var p1 = Person(name: "A", age: 123)
var p2 = p1

p2.name = "B"

print(p1.name) // A
print(p2.name) // B , khác nhau

// dùng mutating để sửa trong func

struct Counter {
    var value = 0
    
    mutating func increase() {
        value += 1
    }
}


// --------------- CLASS ---------------------

class X {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func sayHello() {
        print("Hello, my name is \(name)")
    }
}

// Reference type
var x1 = X(name: "Nam", age: 21)
var x2 = x1

x2.name = "An"

print(x1.name) // An (bị thay đổi theo)

// ------------ Optional -------------------
var name: String? = "Nam"
print(name) // output =>. Optional("Nam")

name = nil
print(name) // output => nil

// ----------------- Protocol ------------------
// giống interface trong các ngôn ngữ khác
protocol Animal {
    func makeSound()
}

// implement
struct Dog: Animal {
    func makeSound() {
        print("Woof")
    }
}

// ---------------------------- Any ----------------------------
var any: Any

any = 10
any = "Hello"
any = true

// Array Any
var list: [Any] = [1, "Nam", true, 3.14]

// Duyệt FOR IN
let arr = [1,3,5,7,9]
// Lấy cả index + value . Phải dùng .enumerated()
//for (i,val) in arr.enumerated() {
//    print("index \(i)","value \(val)")
//}

// Duyệt Range
let number = 1...5

//for (idx,value) in number.enumerated() {
//    print(idx,value)
//}

// -Duyệt dictionary
let dic1 = ["a" : 2, "b" : 5 , "c" : 7 , "d" : 10,"e" : 15]

//for i in dic1 {
//    print(i)
//}

// OUTPUT
//(key: "d", value: 10)
//(key: "e", value: 15)
//(key: "b", value: 5)
//(key: "a", value: 2)
//(key: "c", value: 7)

for (idx , value) in dic1 {
    print(idx, value)
}

// OUPUT
//b 5
//c 7
//e 15
//d 10
//a 2


// -- WHILE
var i = 0

while i < 5 {
    print(i)
    i = i + 1 // khong viet dc i++
}

// - repeat-while
var y = 0
repeat {
    print("first" , y)
    y += 1
} while y < 5


// if - else

let check = 10

if check > 5 {
    print("Lớn hơn 5")
} else {
    print("Nhỏ hơn hoặc bằng 5")
}


// Lỗi condition không phải boolean
let err = 1
// if errr { // lỗi }
