# Swift Basics 

## 1. Cú pháp cơ bản (Basic Syntax)
* Swift **không yêu cầu** dấu chấm phẩy (`;`) ở cuối mỗi câu lệnh. (Chỉ dùng khi viết nhiều câu lệnh trên cùng một dòng).
* Sử dụng ba dấu ngoặc kép (`"""`) cho các chuỗi chiếm nhiều dòng. Thụt lề ở đầu mỗi dòng trích dẫn sẽ bị xóa, miễn là nó khớp với thụt lề của dấu ngoặc kép kết thúc.

## 2. Biến và Hằng số (Variables & Constants)
* `var` (Variable): Dùng cho các giá trị có thể thay đổi (có thể gán lại sau khi đã khởi tạo).
* `let` (Constant): Dùng cho các giá trị **không được phép thay đổi** sau lần gán đầu tiên. Khuyến khích dùng `let` bất cứ khi nào có thể để code an toàn và tối ưu hơn.

## 3. Kiểu dữ liệu cơ bản (Basic Types)
* **Nhóm số:** `Int` (Số nguyên), `Double` (Số thập phân độ chính xác kép), `Float` (Số thập phân độ chính xác đơn).
* **Nhóm Text:** `String` (Chuỗi ký tự), `Character` (Một ký tự).
* **Nhóm logic:** `Bool` (`true` hoặc `false`).

## 4. Xử lý Chuỗi (String Manipulation)
String trong Swift là một struct và cung cấp rất nhiều công cụ mạnh mẽ:

```swift
var greeting = "Hello"
let name = "Swift"

// String Interpolation (Nội suy chuỗi)
print("\(greeting), \(name)!") // Output: Hello, Swift!

// Các phương thức và thuộc tính phổ biến
print(greeting.count)          // Đếm số ký tự
print(greeting.isEmpty)        // Kiểm tra chuỗi rỗng
greeting.append(" World")      // Thêm vào cuối chuỗi
print(greeting.lowercased())   // Chuyển thành chữ thường
print(greeting.uppercased())   // Chuyển thành chữ hoa
print(greeting.contains("lo")) // Kiểm tra chuỗi con (Output: true)

// Multi-line String
let banner = """
    Dòng 1
    Dòng 2
    """
```

## 5. Collection Types (Tập hợp)
Swift cung cấp 3 collection types chính: Array, Dictionary, và Set. Tất cả đều là Value Types (sẽ copy khi gán sang biến mới).

### 5.1. Array (Mảng)
Tập hợp các phần tử có thứ tự, cùng kiểu dữ liệu.

```swift
var arr: [Int] = [1, 2, 3]
arr.append(4)       // Thêm phần tử
arr.insert(0, at: 0) // Chèn phần tử
print(arr[0])       // Truy cập phần tử
```

### 5.2. Dictionary (Từ điển)
Tập hợp các cặp `Key: Value` không có thứ tự. Khóa (Key) phải là duy nhất.

```swift
var dict: [String: Int] = ["A": 1, "B": 2]
dict["C"] = 3       // Thêm hoặc cập nhật
dict["A"] = nil     // Xóa phần tử
```

### 5.3. Set (Tập hợp các phần tử duy nhất)
Tập hợp không có thứ tự và **không chứa phần tử trùng lặp**. Rất hữu ích khi cần tính toán tập hợp hoặc tìm kiếm nhanh.

```swift
var setA: Set<Int> = [1, 2, 3, 4, 5]
var setB: Set<Int> = [4, 5, 6, 7]

setA.insert(8)      // Thêm phần tử (nếu đã có sẽ bị bỏ qua)
setA.contains(3)    // Kiểm tra tồn tại (rất nhanh)

// Các phép toán trên Set (Set Operations)
let union = setA.union(setB)           // Hợp: [1, 2, 3, 4, 5, 6, 7, 8]
let intersect = setA.intersection(setB)// Giao: [4, 5]
let subtract = setA.subtracting(setB)  // Hiệu: [1, 2, 3, 8]
let symDiff = setA.symmetricDifference(setB) // Bù: [1, 2, 3, 6, 7, 8]
```

## 6. Tuples
Gom nhiều giá trị thành 1 biến đơn. Các giá trị có thể khác kiểu dữ liệu. Thường dùng để return nhiều giá trị từ một hàm.

```swift
let person = (name: "Nam", age: 21)
print(person.name) // Truy cập bằng tên
print(person.0)    // Truy cập bằng index
```

## 7. Optionals (Kiểu có hoặc không có giá trị)
Optional cho phép một biến có thể chứa giá trị hoặc chứa `nil` (không có gì).

```swift
var name: String? = "Nam"
var age: Int? = nil

// Cần "Unwrap" để sử dụng giá trị an toàn:
if let safeName = name {
    print("Tên là: \(safeName)")
} else {
    print("Không có tên")
}
```

## 8. Control Flow (Luồng điều khiển)

### 8.1. If - Else
Condition bắt buộc phải là kiểu `Bool`.

```swift
let score = 8
if score >= 5 {
    print("Pass")
} else {
    print("Fail")
}
```

### 8.2. Switch / Case
Swift yêu cầu `switch` phải vét cạn (exhaustive), do đó **bắt buộc phải có `default`** nếu các case chưa bao phủ hết trường hợp. Không cần dùng `break` ở mỗi case.

```swift
let grade = "A"
switch grade {
case "A", "A+":
    print("Xuất sắc")
case "B":
    print("Khá")
default:
    print("Cần cố gắng")
}
```

### 8.3. Vòng lặp For - In

```swift
// Duyệt mảng
let arr = [1, 2, 3]
for item in arr { print(item) }

// Duyệt Range (Dải số)
for i in 1...5 { print(i) }  // 1 đến 5 (Bao gồm 5)
for i in 1..<5 { print(i) }  // 1 đến 4 (Không bao gồm 5)

// Duyệt Dictionary
let dict = ["a": 1, "b": 2]
for (key, value) in dict { print(key, value) }
```

## 9. Functions (Hàm)

### 9.1. Argument Labels và Parameter Names
Swift cho phép định nghĩa nhãn gọi hàm (Argument label) để đọc code tự nhiên hơn, và tên tham số (Parameter name) để dùng bên trong hàm.

```swift
// 'to' là argument label, 'name' là parameter name
func greet(to name: String, _ age: Int) -> String {
    return "Hello \(name), age \(age)"
}
greet(to: "Nam", 21) // Lúc gọi hàm rất tự nhiên và dễ đọc
```

### 9.2. Inout Parameters
Mặc định, tham số truyền vào hàm là hằng số (`let`). Nếu muốn hàm thay đổi trực tiếp giá trị của biến gốc truyền vào (truyền tham chiếu), phải dùng `inout` và thêm `&` khi gọi hàm.

```swift
func swapNumbers(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var x = 10
var y = 20
swapNumbers(a: &x, b: &y) // x = 20, y = 10
```

## 10. Struct vs Class
* **Struct:** Là **Value Type** (Truyền trị). Tạo ra bản sao mới khi gán. Không hỗ trợ kế thừa.
* **Class:** Là **Reference Type** (Truyền tham chiếu). Truyền địa chỉ bộ nhớ. Hỗ trợ Kế thừa (Inheritance).

### Ví dụ về Struct (Mutating Method)
Mặc định func trong struct không được phép thay đổi properties của chính nó. Phải thêm `mutating`.

```swift
struct Point {
    var x: Int
    var y: Int
    
    mutating func moveBy(deltaX: Int) {
        x += deltaX // Phải có 'mutating' mới sửa được x
    }
}
var p1 = Point(x: 1, y: 1) // Tự sinh ra init
```

### Ví dụ về Class (Init & Inheritance)
Class **bắt buộc** phải khởi tạo mọi property chưa có giá trị ban đầu.

```swift
class Animal {
    var name: String
    
    // Bắt buộc phải có init nếu property chưa có giá trị mặc định
    init(name: String) {
        self.name = name
    }
    
    func speak() { print("...") }
}

// Kế thừa
class Dog: Animal {
    override func speak() {
        print("Woof")
    }
}
```

## 11. Properties (Thuộc tính)

### 11.1. Stored Properties (Thuộc tính lưu trữ)
Lưu trữ giá trị trực tiếp. Dùng được cho cả Class và Struct.

```swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
```

### 11.2. Computed Properties (Thuộc tính tính toán)
Không lưu trữ giá trị. Cung cấp `getter` và tuỳ chọn `setter` để tính toán ra giá trị mỗi khi được gọi.

```swift
struct Square {
    var sideLength: Double
    
    var area: Double {
        get {
            return sideLength * sideLength
        }
        set { // Mặc định biến truyền vào tên là newValue
            sideLength = newValue.squareRoot()
        }
    }
}
```

### 11.3. Property Observers (Người quan sát thuộc tính)
Theo dõi và phản hồi ngay lập tức khi giá trị bị thay đổi.
* `willSet`: Chạy ngay **trước khi** giá trị bị lưu (có biến `newValue`).
* `didSet`: Chạy ngay **sau khi** giá trị mới được lưu (có biến `oldValue`).

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("Chuẩn bị đổi lên \(newValue)")
        }
        didSet {
            print("Vừa thêm \(totalSteps - oldValue) bước")
        }
    }
}
```

### 11.4. Type Properties (Thuộc tính của kiểu)
Gắn liền với bản thân Kiểu (Class/Struct) chứ không gắn với thực thể (Instance). Gọi thông qua tên Class/Struct.

```swift
struct MathStruct {
    static let pi = 3.14159
}
print(MathStruct.pi) // Không cần tạo instance
```

## 12. Protocols (Giao thức)
Định nghĩa một bộ khung (blueprint) các phương thức, thuộc tính mà một Class/Struct/Enum **bắt buộc phải tuân thủ**. Giúp đa hình và tách biệt interface.

### Khai báo và áp dụng

```swift
protocol FullyNamed {
    var fullName: String { get } // Yêu cầu property
    func sayFullName()           // Yêu cầu method
}

struct Person: FullyNamed {
    var fullName: String
    
    func sayFullName() {
        print("Tên tôi là \(fullName)")
    }
}
```

## 13. Any, AnyObject & Type Casting

* **Any**: Có thể đại diện cho **bất kỳ kiểu dữ liệu nào** (Class, Struct, Enum, Int, String, Function, v.v.).
* **AnyObject**: Chỉ đại diện cho **các thực thể của Class** (Reference Types).

**Ép kiểu (Type Casting):** Dùng `as?` hoặc `as!` để máy tính biết chính xác kiểu dữ liệu gốc.
* `as?`: Trả về Optional (thành công ra giá trị, thất bại ra `nil`). Khuyên dùng.
* `as!`: Ép buộc chuyển kiểu. Nếu sai kiểu sẽ gây **Crash**.

```swift
var items: [Any] = [1, "Nam", true]

for item in items {
    if let number = item as? Int {
        print("Đây là số nguyên: \(number)")
    } else if let str = item as? String {
        print("Đây là chuỗi: \(str)")
    }
}
```
