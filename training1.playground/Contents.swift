import UIKit

// 1. Swift không cần dấu ;
let a = 10
let b = 20
print(a + b) // Swift tự hiểu mỗi dòng là 1 câu lệnh
// let a = 10 let b = 20 // lỗi vì Swift không tách được 2 câu lệnh nếu viết cùng 1 dòng

// 2. let và var
// ------- var
var age = 20
print(age)

age = 25 // OK vì var cho phép thay đổi
print(age)
// -------- let
let name = "Nam"
// nếu thêm câu name = "ABC" sẽ lỗi vì let không cho phép gán lại
print(name)

// 3. String nhiều dòng (""" """)

let text1 = """
Hello
123
444444444
"""
print(text1)

// ------ Có thụt lề
let text2 = """
    Hello
    Swift
    """
print(text2)

// 4. Basic Types

// ------ INT ---------
let i: Int = 10
print(i)
// ------ Double ------
let d: Double = 1.234
print(d)

// Lỗi ép kiểu let err: Int = 3.14 => lỗi vì Int không nhận số thập phân

// ------ String ------
let str: String = "Hello"
print(str)

// ------ Character -----
let char: Character = "A"
print(char)
// Lỗi Character let c: Character = "AB" => lỗi vì Character chỉ 1 ký tự

// ------ Boolean -------
let isTrue: Bool = true
print(isTrue)
// Lỗi Boolean let x: Bool = 1 => lỗi


// 5. Collection Types
// --- Array -----
let arr = [1, 2, 3, 4]
print(arr[0])

// Khai báo rõ type của arr
let arr2: [String] = ["A", "B", "C"]

// Dictionary ( kiểu key - value )

let dic: [String: Int] = [
    "A": 1,
    "B": 2
]

print(dic["A"])

// Lỗi key type
// let dic: [String: Int] = [
//"A": 1,
//2: 3 // lỗi vì key phải là String
//]
 

// ----------- Set ------------

let set1: Set<Int> = [1, 2, 3, 3, 4]
print(set1) // không có phần tử trùng


// Thêm phần tử

var set2: Set<Int> = [1, 2]
set2.insert(3)
print(set2)

// ----------- Tuple Types ---------

let person = (1, "Nam", true)

// truy cập bằng index
print(person.0)
print(person.1)
print(person.2)


// Đặt tên cho phần tử
let person2 = (id: 1, name: "Nam", isStudent: true)

print(person2.name)

// Lỗi index

let person3 = (1, "Nam")
//print(person3.2) => lỗi: index out of range

