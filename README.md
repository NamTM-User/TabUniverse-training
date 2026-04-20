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

## 14. Initialization (Khởi tạo)
Quá trình chuẩn bị cho một thực thể (instance) của class, struct, hoặc enum sẵn sàng để sử dụng. Bắt buộc phải gán giá trị cho toàn bộ `Stored Properties` trước khi quá trình khởi tạo hoàn tất.

```swift
struct Fahrenheit {
    var temperature: Double
    
    // Khởi tạo mặc định
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()

// Failable Initializer (Khởi tạo có thể thất bại, trả về Optional)
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

## 15. Deinitialization (Hủy khởi tạo)
Hủy khởi tạo là quá trình tự động dọn dẹp bộ nhớ ngay trước khi một thực thể (instance) bị hệ thống giải phóng.
* **Đặc điểm:** Chỉ áp dụng cho **Class** (Reference type). Struct và Enum là Value type nên không có `deinit`.
* **Cách hoạt động:** Hàm `deinit` được gọi tự động, bạn không thể tự gọi nó bằng tay.
* **Ứng dụng:** Thường được dùng để dọn dẹp các tài nguyên không được quản lý tự động, ví dụ như đóng file đang mở, ngắt kết nối mạng, hoặc gỡ bỏ các observer .

```swift
class FileHandler {
    let filename: String
    
    init(filename: String) {
        self.filename = filename
        print("Đang mở file \(filename)...")
    }
    
    // Hàm deinit không có ngoặc tròn vì không nhận tham số
    deinit {
        print("Đang đóng file \(filename) một cách an toàn!")
    }
}

// Khai báo một Optional để có thể gán bằng nil
var myFile: FileHandler? = FileHandler(filename: "data.txt")

// Khi gán bằng nil, instance không còn ai tham chiếu tới -> deinit được gọi
myFile = nil 
// Console in ra: "Đang đóng file data.txt một cách an toàn!"


## 16. Concurrency

### A. Async / Await

### 1. Ý nghĩa
`async` (asynchronous) đánh dấu một hàm có thể tạm dừng thực thi để chờ một tác vụ khác hoàn thành (ví dụ: tải mạng, đọc file). 
`await` được đặt trước lời gọi hàm `async`, đánh dấu một "điểm tạm dừng" (suspension point). Trong thời gian chờ, thread hiện tại không bị "đóng băng" (block) mà được hệ thống thu hồi để đi làm việc khác.

### 2. Syntax cơ bản và Ví dụ
```swift
// 1. Khai báo hàm bất đồng bộ với từ khóa 'async'
func fetchUsername() async throws -> String {
    // Giả lập delay 1 giây tải dữ liệu từ mạng
    try await Task.sleep(nanoseconds: 1_000_000_000)
    return "Swift_Lover_99"
}

// 2. Sử dụng hàm async
func loadProfile() async {
    do {
        // Dùng 'await' để chờ kết quả trả về
        let username = try await fetchUsername()
        print("Xin chào, \(username)!")
    } catch {
        print("Đã xảy ra lỗi: \(error)")
    }
}
```

### 3. Giải thích ý nghĩa từng phần
- `async`: Báo cho compiler biết hàm này tốn thời gian, có thể bị tạm dừng.
- `throws`: Đi kèm nếu hàm có thể quăng lỗi. Khi gọi phải dùng `try await`.
- `await`: Điểm mấu chốt. Dòng code sẽ dừng tại đây tới khi có data. Code trông rất tuần tự, dễ đọc, không bị lồng ghép rườm rà như Closure (Callback hell).

---

## B. Task { }

### 1. Task là gì?
Hàm `async` không thể tự nhiên được gọi từ một hàm đồng bộ (như `viewDidLoad` hay action của Button). `Task` sinh ra để tạo ra một "môi trường bất đồng bộ" (async context) ngay bên trong code đồng bộ, làm cầu nối để khởi chạy các hàm `async`.

### 2. Các loại Task, Syntax và Ý nghĩa

#### a. Task (Task thông thường)
Kế thừa các thuộc tính từ môi trường gọi nó (ví dụ: kế thừa độ ưu tiên priority, kế thừa Actor như @MainActor).
```swift
func userDidClickButton() {
    // Tạo một Task mới từ code đồng bộ
    Task {
        let data = await downloadData()
        print("Tải xong: \(data)")
    }
}
```

#### b. Task.detached
Tạo ra một task hoàn toàn độc lập, "đứt kết nối" với môi trường gọi nó. Nó không kế thừa @MainActor, không kế thừa priority.
**Ý nghĩa:** Dùng khi bạn muốn thực hiện một tác vụ cực nặng dưới background, muốn chắc chắn 100% nó không dính líu gì tới luồng giao diện (UI Thread) để tránh giật lag.
```swift
func processHeavyVideo() {
    Task.detached(priority: .background) {
        // Chạy hoàn toàn độc lập trên một background thread
        await applyVideoFilter()
    }
}
```

---

## C. withTaskGroup

### 1. Cách hoạt động
Dùng để chạy nhiều tác vụ bất đồng bộ *cùng một lúc* (song song) và gom kết quả của chúng lại. Đây gọi là "Structured Concurrency" (Bất đồng bộ có cấu trúc). Nhóm sẽ chỉ hoàn thành khi tất cả các task con bên trong hoàn thành.

### 2. Syntax đầy đủ và Giải thích
- `addTask`: Bắn một task con vào nhóm để chạy song song.
- `addTaskUnlessCancelled`: Tương tự addTask nhưng an toàn hơn, nó sẽ kiểm tra xem nhóm có đang bị hủy không, nếu bị hủy rồi thì không thêm vào nữa.
- `cancelAll()`: Hủy bỏ toàn bộ các task đang chạy trong nhóm ngay lập tức.
- `Task.isCancelled`: Thuộc tính để các task con tự kiểm tra xem mình có đang bị yêu cầu hủy không để tự dừng lại.

### 3. Ví dụ code chi tiết
```swift
func downloadAllImages(urls: [String]) async -> [UIImage] {
    // Khởi tạo TaskGroup, quy định kiểu trả về của mỗi task con là UIImage?
    let finalImages = await withTaskGroup(of: UIImage?.self) { group in
        var downloaded = [UIImage]()
        
        for url in urls {
            // Thêm từng task tải ảnh vào group để chạy song song
            group.addTaskUnlessCancelled {
                // Kiểm tra nếu group bị hủy giữa chừng thì dừng việc tải
                if Task.isCancelled { return nil }
                return await fetchImage(from: url)
            }
        }
        
        // Vòng lặp này sẽ chờ và nhận kết quả ngay khi có bất kỳ task con nào xong
        // Thứ tự hoàn thành có thể không giống thứ tự đưa vào
        for await result in group {
            if let image = result {
                downloaded.append(image)
            }
        }
        
        return downloaded
    }
    
    return finalImages
}
```

---

## D. Task API  

| API | Ý nghĩa | Ví dụ |
| :--- | :--- | :--- |
| `Task.sleep(nanoseconds:)` | Dừng task hiện tại trong một khoảng thời gian (tính bằng nano giây) mà không làm "chết" thread. | `try await Task.sleep(nanoseconds: 2 * 1_000_000_000)` (Ngủ 2 giây) |
| `Task.yield()` | Chủ động nhường quyền CPU cho các Task khác đang đợi. Dùng trong các vòng lặp nặng để hệ thống không bị nghẽn. | `for i in 0..<1000 { ...; await Task.yield() }` |
| `Task.cancel()` | Phát cờ báo hiệu yêu cầu dừng Task. Chú ý: Task không tự lăn ra chết, nó chỉ bật cờ báo hiệu. | `let myTask = Task { ... }; myTask.cancel()` |
| `Task.isCancelled` | Kiểm tra xem cờ cancel có đang được bật không. Nếu có, lập trình viên phải tự viết code thoát khỏi hàm (như `return`). | `if Task.isCancelled { return }` |
| `Task.priority` | Độ ưu tiên của Task, hệ thống dựa vào đây để cấp phát tài nguyên (.high, .medium, .low, .background). | `Task(priority: .high) { ... }` |

---

## E. @MainActor

### 1. @MainActor là gì?
Đây là một "Global Actor" đặc biệt, đại diện cho **Main Thread** (Luồng chính). Trong iOS/macOS, Main Thread là luồng duy nhất được phép vẽ và cập nhật giao diện (UI).

### 2. Khi nào dùng và Tại sao cần?
- **Tại sao cần:** Nếu bạn cố thay đổi text của Label hay ảnh của ImageView từ một luồng background (ví dụ sau khi tải mạng xong), ứng dụng sẽ bị crash ngay lập tức hoặc bị lỗi hiển thị.
- **Khi nào dùng:** Bất cứ class nào (như ViewModel) hoặc hàm nào có nhiệm vụ thay đổi giao diện, hãy dán nhãn `@MainActor` lên đầu. Swift sẽ tự động đảm bảo code bên trong luôn chạy trên luồng chính.

### 3. Ví dụ code
```swift
@MainActor // Đánh dấu toàn bộ class này luôn thao tác trên Main Thread
class HomeViewModel: ObservableObject {
    @Published var welcomeMessage = "Đang tải..."

    func loadData() async {
        // Hàm tải mạng chạy ở background (ngoài luồng chính)
        let data = await fetchNetworkData() 
        
        // Nhờ @MainActor, lệnh gán này tự động được điều hướng về Main Thread
        // Không cần bọc trong DispatchQueue.main.async {} như cách cũ nữa
        self.welcomeMessage = data.message 
    }
}
```

---

## F. Actor

### 1. Actor là gì?
`Actor` là một kiểu dữ liệu tham chiếu (Reference Type) giống hệt như `Class`, nhưng nó có một "siêu năng lực": **Tự động bảo vệ dữ liệu bên trong khỏi vấn đề Race Condition**. Actor chỉ cho phép một Task duy nhất được truy cập và sửa đổi dữ liệu (mutable state) của nó tại một thời điểm. Mọi Task khác muốn truy cập đều phải xếp hàng đợi.

### 2. Tại sao cần Actor (Race Condition)?
Khi có nhiều luồng (threads) cùng đọc và ghi vào một biến tại cùng một khoảnh khắc (như nhiều người cùng rút tiền ở 1 tài khoản), dữ liệu sẽ bị sai lệch hoặc ứng dụng bị crash. Đó gọi là Data Race / Race Condition.

### 3. Ví dụ minh họa

#### a. Không dùng Actor (Bị Race Condition)
```swift
class BankAccount {
    var balance = 1000
    
    func withdraw(amount: Int) {
        // Nếu 2 thread cùng nhảy vào đây lúc balance = 1000
        if balance >= amount { 
            // Cả 2 cùng trừ tiền, khiến balance bị sai lệch
            balance -= amount 
        }
    }
}
```

#### b. Dùng Actor (Fix lỗi hoàn hảo)
Chỉ cần thay chữ `class` bằng chữ `actor`.
```swift
actor SafeBankAccount {
    var balance = 1000
    
    func withdraw(amount: Int) {
        if balance >= amount {
            balance -= amount
        }
    }
}

// Cách sử dụng:
let myAccount = SafeBankAccount()

Task {
    // Vì Actor sẽ bắt các luồng phải xếp hàng, nên thao tác gọi hàm của Actor 
    // có khả năng phải đợi luồng khác xong việc. Do đó bắt buộc phải có 'await'.
    await myAccount.withdraw(amount: 500)
    
    // Ngay cả việc đọc biến cũng phải có 'await'
    let currentBalance = await myAccount.balance
    print("Số dư hiện tại: \(currentBalance)")
}
```

## 17. Macro

### 1. Freestanding Macros (Dùng dấu `#`)
Loại macro này đứng độc lập, không gắn vào bất kỳ khai báo nào. Chúng hoạt động giống như một biểu thức hoặc một câu lệnh độc lập.

#### A. Khái niệm & Giải thích
- **Cách dùng:** Sử dụng ký tự `#` phía trước tên macro (ví dụ: `#stringify`, `#warning`, `#error`).
- **Ý nghĩa:** Nó nhận đầu vào và thay thế vị trí đó bằng một đoạn code mới hoặc một giá trị cụ thể ngay khi biên dịch.

#### B. Ví dụ so sánh

**Khi không dùng Macro:**
Bạn phải viết code thủ công để in ra cả biểu thức và giá trị của nó.
```swift
let a = 10
let b = 20
print("a + b = \(a + b)") 
// Bạn phải viết tay chuỗi "a + b ="
```

**Khi dùng Macro (`#stringify`):**
Macro sẽ tự động lấy đoạn code bạn viết làm chuỗi và tính toán giá trị của nó.
```swift
let a = 10
let b = 20
let (result, codeString) = #stringify(a + b)

print("Giá trị: \(result)")     // 30
print("Mã nguồn: \(codeString)") // "a + b"
```

---

### 2. Attached Macros (Dùng dấu `@`)
Loại macro này được "gắn" trực tiếp vào một khai báo (như class, struct, enum, hoặc biến) để bổ sung thêm chức năng cho khai báo đó.

#### A. Khái niệm & Giải thích
- **Cách dùng:** Sử dụng ký tự `@` phía trước tên macro (giống như Attributes).
- **Ý nghĩa:** Nó có thể thêm các phương thức mới, bắt các biến thực thi theo một cách nhất định, hoặc tự động tạo ra các Init (hàm khởi tạo).

#### B. Ví dụ so sánh (Dùng `@Observable`)
Đây là macro phổ biến nhất trong SwiftUI để biến một Class thành đối tượng có thể theo dõi sự thay đổi dữ liệu.

**Khi không dùng Macro (Cách cũ):**
Bạn phải kế thừa `ObservableObject`, đánh dấu từng biến là `@Published` rất mất thời gian.
```swift
class User {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
// Để UI cập nhật khi 'name' đổi, bạn phải thêm rất nhiều code bổ trợ thủ công.
```

**Khi dùng Macro (`@Observable`):**
Chỉ cần một dòng code, Swift tự động sinh ra toàn bộ logic theo dõi dữ liệu ngầm bên dưới.
```swift
@Observable
class User {
    var name: String = "Sơn"
    var age: Int = 20
}

// Macro @Observable sẽ tự động sinh code để thông báo cho SwiftUI 
// mỗi khi 'name' hoặc 'age' thay đổi mà bạn không cần viết thêm gì.
```

---

## 18. Type Casting
### 1. Type Casting là gì?
Type casting là cách để bạn kiểm tra kiểu của một instance, hoặc đối xử với instance đó như thể nó thuộc về một lớp cha (superclass) hoặc lớp con (subclass) khác trong hệ thống phân cấp của nó.

Trong Swift, chúng ta sử dụng hai toán tử chính:
- **is**: Để kiểm tra kiểu (Type Checking).
- **as**: Để chuyển đổi kiểu (Type Casting).

---

### 2. Kiểm tra kiểu (Type Checking) với `is`

Sử dụng toán tử `is` để kiểm tra xem một instance có thuộc về một kiểu cụ thể nào đó hay không. Nó trả về `true` nếu đúng và `false` nếu sai.

### Ví dụ đơn giản:
```swift
let items: [Any] = [10, "Hello", 3.14]

for item in items {
    if item is Int {
        print("\(item) là một số nguyên (Int)")
    } else if item is String {
        print("\(item) là một chuỗi (String)")
    } else if item is Double {
        print("\(item) là một số thực (Double)")
    }
}
```

---

### 3. Chuyển đổi kiểu (Type Casting) với `as?` và `as!`

Để truy cập vào các thuộc tính hoặc phương thức của một kiểu cụ thể, bạn cần thực hiện chuyển đổi kiểu. Vì việc chuyển đổi có thể thất bại, Swift cung cấp hai hình thức:

- **as? (Conditional Cast)**: Trả về một giá trị Optional. Nếu chuyển đổi thành công, nó chứa giá trị; nếu thất bại, nó trả về `nil`.
- **as! (Forced Cast)**: Ép kiểu cưỡng bức. Nếu thất bại, ứng dụng sẽ bị **runtime crash**. Chỉ dùng khi bạn chắc chắn 100% kiểu dữ liệu đó là đúng.

### Ví dụ đơn giản với mảng `Any`:
```swift
let mixedList: [Any] = ["Swift", 2024, 5.5]

for value in mixedList {
    // Thử ép kiểu sang String bằng Optional Binding
    if let text = value as? String {
        print("Đây là chuỗi có độ dài: \(text.count)")
    } 
    // Thử ép kiểu sang Int
    else if let number = value as? Int {
        print("Đây là số nguyên: \(number)")
    }
}
```

---

### 4. Casting cho kiểu `Any` và `AnyObject`

Swift cung cấp hai kiểu đặc biệt để làm việc với các kiểu dữ liệu không xác định:
- **Any**: Có thể đại diện cho instance của bất kỳ kiểu nào (bao gồm cả kiểu hàm - function types).
- **AnyObject**: Có thể đại diện cho instance của bất kỳ kiểu lớp (class type) nào.

### Ví dụ sử dụng `switch` để cast kiểu:
```swift
let things: [Any] = [0, 0.0, "hello", (3.0, 5.0)]

for thing in things {
    switch thing {
    case 0 as Int:
        print("Số nguyên không")
    case let someInt as Int:
        print("Một số nguyên khác: \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("Một số thực dương: \(someDouble)")
    case let someString as String:
        print("Một chuỗi: \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("Một tọa độ (x, y): \(x), \(y)")
    default:
        print("Một kiểu dữ liệu khác")
    }
}
```

---

### 5. Lưu ý quan trọng
- **Downcasting**: Chuyển từ kiểu chung (như `Any`) sang kiểu cụ thể hơn (như `Int`). Luôn ưu tiên dùng `as?` để đảm bảo an toàn.
- **Upcasting**: Chuyển từ kiểu cụ thể sang kiểu chung hơn (Ví dụ: `Int` sang `Any`). Việc này luôn thành công và thường được trình biên dịch tự động thực hiện (implicit cast), hoặc dùng toán tử `as`.

```swift
let age = 25
let anyAge = age as Any // Upcasting luôn an toàn
```

## 18. Nested Types

### 1. Nested Types là gì?

Trong Swift, Nested Types là khả năng định nghĩa một kiểu dữ liệu mới (chẳng hạn như `enumeration`, `class`, `structure`, hoặc `protocol`) ngay bên trong phạm vi (scope) của một kiểu dữ liệu khác. 

Hệ thống của Swift không giới hạn số lượng cấp độ lồng nhau; bạn hoàn toàn có thể định nghĩa một kiểu bên trong một kiểu, và tiếp tục định nghĩa thêm một kiểu khác bên trong kiểu vừa tạo.

### 2. Mục đích và Lợi ích cốt lõi

Tính năng này được thiết kế để giải quyết các vấn đề về tổ chức mã nguồn và kiến trúc phần mềm:

* **Thể hiện sự phụ thuộc về ngữ cảnh (Contextual Dependency):** Thường có những kiểu dữ liệu (như các hằng số trạng thái, mã lỗi) được sinh ra chỉ để phục vụ duy nhất cho chức năng của một Class hoặc Struct cụ thể. Đặt chúng làm Nested Type giúp lập trình viên khác ngay lập tức hiểu được ngữ cảnh sử dụng của chúng.
* **Quản lý không gian tên (Namespacing tự nhiên):** Nested Types hoạt động như một không gian tên riêng biệt. Điều này giúp ngăn chặn xung đột tên (name collision) trong toàn bộ dự án. Hai Class hoàn toàn khác nhau có thể sở hữu hai Nested Type có chung một tên gọi mà không gây ra sự nhầm lẫn hay lỗi biên dịch nào cho chương trình.
* **Tăng tính đóng gói (Encapsulation):** Bằng cách kết hợp với Access Control, Nested Types giúp che giấu sự phức tạp của các logic nội bộ.

### 3. Quy tắc tham chiếu (Reference Rules)

Cách gọi hoặc tham chiếu đến một kiểu lồng nhau phụ thuộc vào vị trí đoạn mã đang được thực thi:

* **Truy cập nội bộ:** Khi viết logic ở ngay bên trong thân của kiểu dữ liệu chứa (outer type), bạn có thể gọi trực tiếp tên của kiểu lồng nhau (nested type) một cách ngắn gọn.
* **Truy cập từ bên ngoài:** Để sử dụng một kiểu lồng nhau từ bên ngoài phạm vi của kiểu chứa nó, Swift bắt buộc phải sử dụng **cú pháp dấu chấm (dot syntax)**. Đường dẫn tham chiếu phải đi từ cấu trúc ngoài cùng, nối bằng dấu chấm, cho đến cấu trúc lồng nhau cần gọi.

### 4. Tương tác với Access Control (Kiểm soát truy cập)

Các kiểu lồng nhau tuân thủ nghiêm ngặt các cấp độ kiểm soát truy cập của Swift (`private`, `fileprivate`, `internal`, `public`, `open`). 

Mức độ hiển thị của kiểu lồng nhau bị giới hạn bởi mức độ hiển thị của kiểu chứa nó. Ví dụ: Nếu kiểu chứa (outer type) là `private` thì kiểu lồng bên trong cũng không thể được truy cập từ bên ngoài, bất kể bản thân kiểu lồng đó được khai báo như thế nào. Điều này tạo ra một cơ chế bảo vệ kép cho dữ liệu nội bộ của ứng dụng.


## 19. Extensions

### 1. Extension là gì?

**Extensions** (Tiện ích mở rộng) cho phép bạn thêm các tính năng mới vào một `class`, `structure`, `enumeration`, hoặc `protocol` đã tồn tại. Điều đặc biệt là bạn có thể mở rộng các kiểu dữ liệu mà bạn không có quyền truy cập vào mã nguồn gốc của chúng (ví dụ như `Int`, `String`, `Double` của thư viện chuẩn Swift).

**Lưu ý quan trọng:** Extension có thể *thêm* tính năng mới, nhưng **không thể** ghi đè (override) các tính năng đã có sẵn.

### Cú pháp cơ bản
Sử dụng từ khóa `extension` để khai báo:

```swift
extension SomeType {
    // Thêm các tính năng mới cho SomeType tại đây
}
```

Bạn cũng có thể dùng extension để áp dụng một hoặc nhiều protocol cho kiểu dữ liệu hiện tại:

```swift
extension SomeType: SomeProtocol, AnotherProtocol {
    // Cài đặt các yêu cầu của protocol tại đây
}
```

---

### 2. Thêm Computed Properties 

Extension có thể thêm các `computed instance properties` (thuộc tính tính toán của instance) và `computed type properties` (thuộc tính tính toán của kiểu).

**Lưu ý:** Extension **không thể** thêm `stored properties` (thuộc tính lưu trữ) hay thêm property observers vào các thuộc tính đã tồn tại.

### Ví dụ minh hoạ: Thêm đơn vị đo lường cho `Double`

```swift
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("Một inch bằng \(oneInch) mét")
// In ra: "Một inch bằng 0.0254 mét"

let aMarathon = 42.km + 195.m
print("Một cuộc đua marathon dài \(aMarathon) mét")
// In ra: "Một cuộc đua marathon dài 42195.0 mét"
```

---

### 3. Thêm Initializers (

Extension có thể thêm các hàm khởi tạo (`initializers`) mới vào các kiểu hiện có. Đối với `struct`, nếu bạn thêm initializer qua extension, bạn vẫn có thể giữ lại được *default memberwise initializer* (hàm khởi tạo mặc định do Swift tự sinh ra). 

*(Lưu ý: Extension không thể thêm `designated initializers` hay `deinitializers` vào một `class`, chúng phải được khai báo trong định nghĩa gốc của class).*

### Ví dụ minh hoạ: Thêm custom init cho Struct

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

// Thêm một hàm khởi tạo tính toán tọa độ từ tâm (center)
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// Sử dụng init mới
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
```

---

### 4. Thêm Methods (Phương thức)

Bạn có thể thêm các phương thức instance (instance methods) và phương thức kiểu (type methods) mới.

### Ví dụ 1: Thêm Instance Method cho `Int`

```swift
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

// Chạy khối lệnh 3 lần
3.repetitions {
    print("Xin chào!")
}
// In ra "Xin chào!" 3 lần
```

### Ví dụ 2: Mutating Instance Methods
Nếu extension được áp dụng cho `struct` hoặc `enum` và phương thức đó làm thay đổi (modify) chính giá trị của instance (`self`), bạn phải thêm từ khóa `mutating`.

```swift
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt) 
// In ra: 9
```

---

### 5. Thêm Subscripts

Extension có thể thêm subscript hoàn toàn mới vào một kiểu dữ liệu.

### Ví dụ minh hoạ: Lấy chữ số thứ n của một số nguyên
Subscript này giúp lấy chữ số từ phải sang trái (index 0 là hàng đơn vị, 1 là hàng chục...).

```swift
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(746381295[0]) // Trả về 5 (hàng đơn vị)
print(746381295[1]) // Trả về 9 (hàng chục)
```

---

### 6. Thêm Nested Types 

Bạn có thể đưa định nghĩa các class, struct, enum mới lồng vào bên trong một class, struct, enum đã có sẵn thông qua extension.

### Ví dụ minh hoạ: Thêm enum `Kind` vào `Int`
Enum này phân loại xem số nguyên là số âm, số dương hay số không.

```swift
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative: print("- ", terminator: "")
        case .zero:     print("0 ", terminator: "")
        case .positive: print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// In ra: + + - 0 - 0 +
```
