import UIKit

//-----------------------------------------------------------------STRING -----------------------------------------------------------
var greeting = "Hello ! xyz"


// ---------------------------- I. INDEX --------------------------------------------
// 1. startIndex
greeting[greeting.startIndex] // output : H

// 2. endIndex
//greeting[greeting.endIndex] // erro : out of bounds
// * lưu ý : endIndex chỉ dùng để xác định vị trí NGAY SAU kí tự cuối cùng. Không thể truy cập trực tiếp

// 3. index(before: )
let x = greeting[greeting.index(before: greeting.endIndex)]

// 4. index(after: )
let a = greeting[greeting.index(after: greeting.startIndex)] // output => e

// 5. index( vi tri bat dau , offsetBy: number (so buoc di chuyen , co the la am) )
let i = greeting.index(after: greeting.startIndex)
greeting[greeting.index(i,offsetBy: 5)]

// 6. limitedBy
// Khi dùng offsetBy nếu nhảy quá độ dài sẽ bị crash chương trình , limitedBy giúp kiểm tra xem vị trí đó có hợp lệ không ?
if let checkIdx = greeting.index(greeting.startIndex , offsetBy: 2 , limitedBy: greeting.endIndex){
    print(greeting[checkIdx])
}
else{
    print("NO")
}

// 7. indices
// indices là thuộc tính giúp lấy toàn bộ các chỉ số hợp lệ của một chuỗi cùng một lúc, thay vì phải tìm từng cái lẻ tẻ .
// => Thường dùng trong vòng lặp để truy cập cả vị trí và giá trị của ký tự

for idx in greeting.indices {
    print("index \(idx)" , "value \(greeting[idx])")
}

// ---------------------------- II. Insert - Remove -----------------------------------------
// 8. Insert string
// ------------------ insert( _ , at: ) dùng để chèn 1 ký tự vào vị trí chỉ định (at)
let insertValue1:Character = "~"
greeting.insert(insertValue1 , at: greeting.startIndex)

// ------------------ insert( contentsOf: "String" , at : index )
let insertValue2:String = "abcxyz"
greeting.insert(contentsOf: insertValue2, at: greeting.index(before: greeting.endIndex))

// 9. Remove string
// remove(at:) dùng để xoá KÝ TỰ tại 1 vị trí chính xác => cách dùng cũng giống giống trên
// removeSubrange(_) Dùng để xóa một đoạn ký tự bằng cách truyền vào một Range.

if let range = greeting.range(of: "xyabc"){ // string.range(of) là để kiếm tra xem chuỗi kí tự có nằm trong string hay không!
    greeting.removeSubrange(range)
    print(greeting)
}
else {
    print("No remove")
}
// 10. hasPreflix
// Dùng để xem một string có bắt đầu bằng prefix nào đó không.

// Hiểu đơn giản: “có mở đầu bằng … không?”
//Ví dụ:
//
//"Hello World".hasPrefix("He") → true
//"Swift".hasPrefix("Swi") → true
//"Swift".hasPrefix("wi") → false


// 11. hasSuffix
//Dùng để xem một string có kết thúc bằng suffix nào đó không.

//Hiểu đơn giản: “có kết thúc bằng … không?”
//
//Ví dụ:
//
//"Hello.swift".hasSuffix(".swift") → true
//"image.png".hasSuffix(".jpg") → false
//"report.pdf".hasSuffix("pdf") → true

//------------------------------------------------------- Array -----------------------------------------------------------------------
// Có 2 cách tạo array chính
var arr1: [Int] = [];
var arr2 = [Int]()

// 1. Tạo một mảng có giá trị mặc định
var arrDefaultValue = Array(repeating: 1.3 , count: 4) // [1.3 , 1.3 , 1.3 , 1.3]
// 2. Nối mảng bằng cách dùng toán tử +=
arr1 = [1,2,3,4,5]
arr2 = [10,7,13]

arr2 += arr1
print(arr2) // [10, 7, 13, 1, 2, 3, 4, 5]


// range Array
var shoppingList = ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
shoppingList[4...6] = ["A","B"]// Lấy đoạn index từ 4-6 ( bao gồm cả 6 ) thay thế đoạn từ 4-6 bằng mảng mới
print(shoppingList) // ["Eggs", "Milk", "Flour", "Baking Powder", "A", "B"]

//-----------------------------------SET------------------------------------------
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop" ,"Hip hop"]
print(favoriteGenres) // ["Hip hop", "Rock", "Classical"]
//Set KHÔNG có thứ tự .Nó dùng hashing để lưu trữ .Khi in ra, thứ tự là ngẫu nhiên (phụ thuộc hash)

for check in favoriteGenres {
    print(check)
}


//1. Use the intersection(_:) method to create a new set with only the values common to both sets.

//2. Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.

//3. Use the union(_:) method to create a new set with all of the values in both sets.

//4. Use the subtracting(_:) method to create a new set with values not in the specified set.

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

// ----------------------------FUNCTION-----------------------------------------
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world123")
// prints "hello, world" but doesn't return a value

// ---------------- function inout -----------------
//Nếu Variadic Parameters (tham số biến thiên) giúp bạn xử lý số lượng đầu vào linh hoạt, thì In-Out Parameters lại giải quyết một vấn đề hoàn toàn khác: Làm sao để thay đổi trực tiếp giá trị của biến bên ngoài hàm.
//Trong Swift, mặc định tất cả các tham số truyền vào hàm đều là hằng số (constants).Không thể thay đổi giá trị của chúng bên trong thân hàm. Nếu cố tình làm vậy, compiler sẽ báo lỗi ngay lập tức. inout chính là "chìa khóa" để phá vỡ quy tắc này.
//1. Cách hoạt động của inout
//Khi bạn đánh dấu một tham số là inout, bạn đang cho phép hàm chỉnh sửa giá trị đó và "phản hồi" sự thay đổi đó ra lại biến gốc sau khi hàm kết thúc.
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
    print(a,b)
}

var a1 = 5
var a2 = 10

// Phải dùng dấu & để xác nhận  cho phép hàm thay đổi x và y
swapTwoInts(&a1, &a2)

// --------- Function types ------------------------
//Bạn sử dụng các loại hàm giống như bất kỳ loại nào khác trong Swift. Ví dụ, bạn có thể định nghĩa một hằng số hoặc biến là một kiểu hàm và gán một hàm thích hợp cho biến đó là


// -----------------Properties---------------
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    func printData() {
        print(filename)
    }
    // the DataImporter class would provide data importing functionality here
}


class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    func print1() {
        print(data)
    }
}


let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager.importer.printData()
manager.print1()



// ---------------Computed Properties-----------------------

// Dùng khi

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}
struct Check {
    var a1 = Point()
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print("123",initialSquareCenter)
square.center = Point(x: 15.0, y: 15.0)
print(square.center)


// ------------------------- Property observers ----------------------------------

// Propertype Observers dùng để thay dõi sự thay đổi của 1 properties và thực hiện thêm logic khi giá trị của nó thay đổi ,
struct BankAccount {
    var balance: Double = 0 { // property observers cho balance
        willSet {
            print("Update \(balance) -> \(newValue)")
        }
        
        didSet {
            print("Amount Update \(balance) ") // gia tri hien tai
            print("Old Balance \(oldValue)")
        }
    }
    
}

var bankCheck = BankAccount()

bankCheck.balance = 10
bankCheck.balance = 111

// ---------------------- Property Wrappers------------------------------------------------
// Để tạo 1 property wrappers dùng từ khoá @propertyWrapper trước 1 struct hoặc 1 class , enum
// ĐK bắt buộc nó phải có 1 thuộc tính tên là wrappedValue

// Cach 1 ko dung property wrapers
struct User {
    private var namePrivate: String = ""
    
    var name: String {
        get {
            print("da chay vao get")
            return namePrivate
        }
        set(valueNew) {
            namePrivate = valueNew.uppercased()
            print("da chay vao set \(namePrivate)" )
        }
    }
}

// Cach 2
@propertyWrapper
struct Uppercase {
    var value: String = ""
    
    var wrappedValue: String {
        get {
            value
        }
        set(newName) {
            value = newName.uppercased()
        }
    }
}

// --- Dùng chung cho 3 Struct khác nhau ---
// 1. Struct cho quản lý kho bãi (Lưu mã sản phẩm)
struct Warehouse {
    @Uppercase var skuCode: String     // Mã SKU lúc nào cũng phải viết hoa
    @Uppercase var storageZone: String // Khu vực kho (VD: ZONE A)
}
// 2. Struct cho Hàng không (Mã sân bay, số hiệu chuyến bay)
struct Flight {
    @Uppercase var origin: String      // VD: HAN
    @Uppercase var destination: String // VD: SGN
    @Uppercase var airlineCode: String // VD: VJ
}

// 3. Struct cho tài chính (Mã chứng khoán, tiền tệ)
struct Stock {
    @Uppercase var symbol: String   // Mã cổ phiếu: AAPL, BTC
    @Uppercase var currency: String // Loại tiền: USD, VND
}

// --- Kiểm tra kết quả ---
var myStock = Stock()
myStock.symbol = "btc"
myStock.currency = "usd"

var myFlight = Flight()
myFlight.origin = "hanoi"
myFlight.destination = "singapore"

print("Stock: \(myStock.symbol) in \(myStock.currency)")
print("Flight: From \(myFlight.origin) to \(myFlight.destination)")
