import UIKit


let s = "hôm nay là một ngày đẹp trời"

let s1 = s[s.startIndex..<s.index(s.startIndex, offsetBy: 3)]


let i = s.index(before: s.endIndex)



@MainActor
class ABC {
    static var test1: Int = 10
}

let check1 = ABC()

//print(ABC.test1)


var a: [(()->Void)?] = [{
//    print("zz")
}]

a.first??()

// Gia lap function upload - completion (tuy nhien ko upload that ma dung Task de delay 1s)

// test {}

// viet protocol sao cho 1 ham dieu khien 2 object khong cung class

// data?.person?.increaseAge() - func thi k phai unwrap
// - propery thi p unwrap

// demo async await, task, sleep,


// tao ham nhan Thing, neu truyen Table -> in table, neu truyen Mouse -> in ra mouse

// co tinh tao leak memory

// ================================= 1.String =======================================
let str = "hôm nay là  một ngày đẹp trời"

// 1. Tìm 1 ký tự character dùng firstIndex(of: ) , là tìm phần tử đầu tiên thoả mãn
if let indexChar = str.firstIndex(of: "m") { // Optional => unwrap
    let idx = str.distance(from: str.startIndex, to: indexChar) // parse UTF8 -> index
//    print(idx)
}
// -> distance(from: A, to: B) đếm xem có bao nhiêu bước từ A đến B

// 2. Tìm chuỗi con (substring) dùng range(of: ) . Tìm substring đầu tiên khớp với giá trị đưa vào
if let range = str.range(of: "đẹp") {
    let start = str.distance(from: str.startIndex, to: range.lowerBound) // 21
    let end = str.distance(from: str.startIndex, to: range.upperBound)
//    print(start,end)
}

// 3. Tìm tất cả các chuỗi con có trong string
let str2 = "hôm nay là một ngày đẹp, ngày mai cũng là ngày vui"
let keyword = "ngày" // chuỗi con cần tìm trong chuỗi string

var startIndex = str2.startIndex
while let range = str2.range(of: keyword , range: startIndex ..< str2.endIndex) {
    let idx = str2.distance(from: str2.startIndex, to: range.lowerBound)
    startIndex = range.upperBound
}

// -------------------------- index ------------------------------------
let str3 = "hôm nay là một ngày đẹp, ngày mai cũng là ngày vui"
// String trong Swift không có cơ chế truy cập theo số thứ tự cố định
// 👉 index không phải thay thế cho số
// 👉 mà là cách duy nhất để định vị trong String
// ----> print(str2[3]) , "Lỗi"

// -> dùng index để truy cập

let idxStr3 = str3.index(str3.startIndex , offsetBy: 2) // 0 --> 2 , offsetBy : số bước muốn di chuyển từ một vị trí (index) trong String.
print(str3[idxStr3]) // output: m

// index(after: )
let idxStrAfter = str3.index(after: str3.startIndex) // after: Đi tiến tới ký tự tiếp theo
print(str3[idxStrAfter]) // output: ô

// index(before: )

let idxStrBefore = str3.index(before: str3.endIndex) // before: Đi lùi xuống
print(str3[idxStrBefore]) // output: i


// ============================== 2. Viết protocol sao cho 1 hàm điều khiển 2 object không cùng class ==================================================

protocol Switch {
    func turnOn()
    func turnOff()
}

class FlashLight: Switch {
    func turnOn() {
        print("Light is ON")
    }
    
    func turnOff() {
        print("Light is OFF")
    }
}

class Electric: Switch {
    func turnOn() {
        print("Electric is ON")
    }
    
    func turnOff() {
        print("Electric is OFF")
    }
}

let light = FlashLight()
let electric = Electric()

// Hàm điều khiển được hành vi 2 object
func control(device: Switch, action: Bool) {
    if action {
        device.turnOn()
    }
    else{
        device.turnOff()
    }
}

control(device: light, action: false)
control(device: electric, action: true)

// ================================= 3.Giả lập hàm upload - completion (không upload thật, mà dùng Task để delay 1 giây) ==================================
func uploadFile(name: String) async {
        print("Bat dau upload .......... ")
        
        // delay 5s
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        print("Done upload...")
}
// upload 1 file
Task {
//    await uploadFile(name: "fileCheck")
}

// update upload 2 file song song
Task {
//    await uploadFile(name: "file1")
//    await uploadFile(name: "file2")
    
    print("Upload 2 file thanh cong")
}

// =============================== 4. Tạo một hàm nhận vào một tham số kiểu Thing. Nếu đối tượng truyền vào là Table thì in ra thông tin của Table, nếu là Mouse thì in ra thông tin của Mouse. ========================================

protocol Thing {
    func printInfo()
}

class Table: Thing {
    func printInfo() {
        print("This is a Table")
    }
}

class Mouse: Thing {
    func printInfo() {
        print("This is a Mouse")
    }
}

// Thử làm bằng cách truyền closure
func handleThing(_ item: Thing, action: (Thing) -> Void) {
    action(item)
}

handleThing(Table()) { item in
    if item is Table {
        item.printInfo()
    }
    else if item is Mouse {
        item.printInfo()
    }
}


// =================================================== 5.Leak Memory ==============================================================================
//  Swift dùng ARC (Automatic Reference Counting) để tự quản lý bộ nhớ.
//  Mỗi object có “reference count” (số người đang giữ nó)
//  Khi count = 0 → object bị giải phóng
class A {
    var b: B?
    
    deinit {
        print("A deinit")
    }
}

class B {
    var a: A?
    
    deinit {
        print("B deinit")
    }
}

func testLeakMemory() {
    let a = A()
    let b = B()
    
    // memory leak
    a.b = b
    b.a = a
    
    // fix memory leak
    a.b = nil
    b.a = nil
    
}

testLeakMemory()

// ======> deinit không chạy vì 2 object đang giữ tham chiếu tới nhau khiến đang không về 0




// ================================================ Weak =====================================================

// Swift quản lý bộ nhờ bằng ARC

// Mỗi object (class) có một reference count (số lượng tham chiếu trỏ tới nó) khi:
// +1: có thêm biến giữ nó
// -1: biến bị giải phóng
//Khi count = 0 → object bị deinit (giải phóng bộ nhớ)

class Person {
    var name: String
    var idCard: IDCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Person \(name) deinit")
    }
}

class IDCard {
    var number: String
    weak var owner: Person?
    
    init(number: String) {
        self.number = number
    }
    
    deinit {
        print("IDCard \(number) deinit")
    }
}

// ======> person giữ Card  , card giữ Person nếu không dùng weak

// ======> person giữ card -> OK card.owner là weak -> KHÔNG giữ person

func testLeak() {
    let person = Person(name: "Nam")
    let card = IDCard(number: "123")
    
    person.idCard = card
    card.owner = person
}

testLeak()
