import UIKit

// ------------------------------------------------------------- Concurrency ----------------------------------------------------------------------------------

// syntax async
// 1.
func fetchData() async -> String {
    return "check data async"
}
// syntax true
func caller() async {
    let data = await fetchData()
    print(data)
}
// cach goi caller() khong the dung truc tiep await caller() duoc vi ko co context async
// syntax false
//func tesst() {
//    let data = await fetchData() //Vì test() không phải async → nên không được dùng await
//}

// ================= Task ============================

// 1. group.addTask
func groupAddTask() async {
    await withTaskGroup(of: String.self){ group in
        // Tạo các child task chạy song song và được quản lý bởi TaskGroup
        group.addTask {
            return "group A"
        }
        group.addTask{
            return "group B"
        }
        group.addTask{
            return "group C"
        }
        for await result in group {
//            print(result)
        }
    }
}

// use groupAddTask
Task {
    await groupAddTask()
}

// 2. group.addTaskUnlessCancelled
func testAddTaskUnlessCancelled() async {
    await withTaskGroup(of: Int.self) {     group in
        group.addTask{
            return 10
        }
        group.addTask{
            return 12
        }
//        group.addTaskUnlessCancelled {
//            return 3
//        }
        group.cancelAll() // Huy group
        
        group.addTaskUnlessCancelled {
            return 3
        }
        
        group.addTaskUnlessCancelled{
            // Kiem tra group bi cancel chua?
            if Task.isCancelled {
                return 0
            }else {
                return 4
            }
        }
        // lay ket qua
        for await result in group {
//            print(result)
        }
    }
}

Task {
    await testAddTaskUnlessCancelled()
}

func testCheckTask() async {
    await withTaskGroup(of: Void.self) { group in
        group.addTask {
            for idx in 1...5 {
                if Task.isCancelled {
//                    print("Task da bi huy tai \(idx)")
                    return
                }
                
//                print("Task đang chạy \(idx)")
                // task dừng lại 1 giây vào không làm gì hết . Không huỷ , không kết thúc chỉ đứng im chờ
                try? await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
        
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        group.cancelAll() // ra tín hiệu huỷ tất cả task trong group, nhưng không ép dừng ngay lập tức
    }
}

Task {
    await testCheckTask()
}

// =============================== @MainActor & Actor ======================================

// Nếu không có Actor , sẽ viết dưới dạng class
class Counter1 {
    var value = 0
    
    func increase() {
        self.value = value + 1
        print(value)
    }
}

let counter1 = Counter1()
// nhieu thread cung goi increase()

for _ in  0..<100 {
    DispatchQueue.global().async {
//        counter1.increase()
    }
}

// => Có 100 người ( 100 thread cùng làm 1 việc sẽ bị ghì đè lên nhau )


// Dùng Actor
actor Counter2 {
    var value = 0
    
    func increase() {
        self.value = self.value + 1
    }
}

let counter2 = Counter2()

for _ in 1..<100 {
    Task {
        await counter2.increase()
    }
}

// result se~ dong bo hon

// ============================ @MainActor ============================================

//print(Thread.isMainThread) // Kiểm tra có phải luồng chính không ? ( Main Thread )
//print(Thread.current) // in ra thread hiện tại

// =========================== Type Casting =================================
// 1. kiem tra dieu kien voi toan tu (is)
class Animal {
    func printAnimal(){
        print("Parent Animal")
    }
}

class Dog: Animal{
    func dogABC(){
        print("this is class dog")
    }
}
class Cat: Animal{}

let a:Animal = Dog()


//print(a is Animal) // true
//print(a is Dog) // true
//print(a is Cat) // false

// ====== toan tu as? =============
let dynamicValue: Any = 1322

if let text = dynamicValue as? String {
    print("Ép kiểu thành công: \(text)")
} else {
    print(dynamicValue)
}



// ==================================== Nested Types ========================================
struct BankAccount {
    // Đây là một Nested Type (Enum lồng trong Struct)
    enum Status {
        case active
        case locked
    }
    
    // Một Nested Type khác
    enum Currency: String {
        case vnd = "VND"
        case usd = "USD"
    }
    
    var balance: Double
    var status: Status
    var currency: Currency
    
    func displayInfo() {
        print("Số dư: \(balance) \(currency.rawValue), Trạng thái: \(status)")
    }
}

// Cách sử dụng:
let myAcc = BankAccount(balance: 1000, status: .active, currency: .vnd)
myAcc.displayInfo()

// ======================== Extensions ============================

// Thêm Initializers (Hàm khởi tạo)
struct User {
    var name: String
    var age: Int
}

extension User {
    // Thêm hàm khởi tạo nhanh cho người dùng mới (0 tuổi)
    init(newName: String) {
        self.name = newName
        self.age = 0
    }
}

let user1 = User(name: "An", age: 20) // Vẫn dùng được init mặc định
let user2 = User(newName: "Bình")    // Dùng được init mới từ extension
