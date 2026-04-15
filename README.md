Swift bacsic 


1. swift không cần viết dấu ; ở mỗi cuối câu lệnh ( good )
2. Let , Var ( Simple values )

* Khai báo biến: 
* var : Dùng cho các giá trị có thể thay đổi , có thể gán lại sau khi đã gán lần đầu 
* let :  Dùng khi không được phép thay đổi sau lần đầu tiên đã gán giá trị 

  3. Sử dụng ba dấu ngoặc kép (""") đối với các chuỗi chiếm nhiều dòng. Thụt lề ở đầu mỗi dòng trích dẫn sẽ bị xóa, miễn là nó khớp với thụt lề của dấu ngoặc kép kết thúc. 

  4. Trong swift có những kiểu dữ liệu sau : 
	- Basic Type
	+) Nhóm số : Int ( không có thập phân ) , Double ( Có thập phân )
 	+) Nhóm Text : String , Character 
	+) Nhóm logic : Boolean

	- Collection Type
	+) Array : [String] , [Int] , [Boolean] , …
	+) Dictionary : [String : Int ] , ….
	+) Set : Set<Type>
	
	-Tuples Types
	+) Gom nhiều giá trị thành 1 biến , các giá tri có thể khác kiểu dữ liệu nhau , cấu trúc cố định ngay từ lúc khai báo 
	+) khai báo bằng (…..)  -> VD:  (Int, String, Bool)

	-Function types
	+) Kiểu của một hàm được xác định bởi: (Tham số đầu vào) -> Kiểu trả về.
	-> VD : func checkFunc(a: Int , b: String) -> Bool {  ….  } , hàm không có return thì không cần ->
	
	- Struct
	+) Struct là kiểu dữ liệu do người dùng định nghĩa (custom type), giống tuple nhưng mạnh hơn, có thể tái sử dụng và có function . Struct trong Swift là value type → khi gán hoặc truyền sẽ copy dữ liệu.
	-> VD : struct nameStruct { 
		var name: String
		var age: Int	
		
		func hello() { 
			print(“Hello”) 
			}
		}
	*Lưu ý : mặc định func trong struct của Swift là KHÔNG được phép thay đổi giá trị thuộc tính bên trong struct , nếu muốn thay đổi phải dùng mutating đứng ở trước func đó 

	-CLASS
	
	+) Class và Struct giống nhau đến 90% về cách viết, nhưng "tính cách" bên trong lại trái ngược hoàn toàn. Nếu Struct là Value Type (Truyền giá trị - sao chép bản mới), thì Class là Reference Type (Truyền tham chiếu - dùng chung địa chỉ).
	+) Class dùng để tạo đối tượng , có thể tham chiếu dữ liệu 
	
	1. Cách khai báo 
	-> VD: 	class Person {
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
*LƯU Ý : self = this ( ngôn ngữ khác ) , init = contructor 
		- Init() không bắt buộc nếu khai báo sẵn giống class Person {
    													var name = "Nam"
    													var age = 21
												}
		- Nếu không có init giống class Person {
    								var name: String
    								var age: Int
								} => Sẽ bị lỗi , trong trường hợp phải tạo init và dùng self 



	- Optional ( Kiểu có hoặc không )
	+) Optional là có thể có giá trị hoặc không có giá trị ( = nil giống null các ngôn ngữ khác )
	-> VD : var name: String? 

	

	- Protocol 
	+) Protocol = tập hợp các yêu cầu (rules) mà class / struct / enum phải tuân theo , giống interface bên các ngôn ngữ khác 

	+) Tạo chuẩn chung (interface)
	+) Giúp đa hình (polymorphism)
	+) Tách interface và implementation

	
	- Any
	+) Any có thể đại diện cho bất kỳ kiểu dữ liệu nào, bao gồm cả: Class, Struct, Enum, Int, String, hay thậm chí là một cái hàm (Function).

	-> VD:    1.var x: Any
			x = 10        // Int
			x = "Hello"   // String
			x = true      // Bool

			2. var list: [Any] = [1, "Nam", true, 3.14]

	*LƯU Ý : Vì Any cái gì cũng chứa được, nên khi lấy ra dùng, bạn phải "ép kiểu" để máy tính hiểu nó là gì. Chúng ta dùng từ khóa as? hoặc as!.
		
	- AnyObject
	+) AnyObject hẹp hơn Any. Nó chỉ có thể đại diện cho các thực thể là Class. Nếu bạn cố tình bỏ một Struct hay Int vào AnyObject, Swift sẽ báo lỗi ngay.


	5. if - else trong Swift
	-> VD: 
	if condition {
	…..
	} 
	else{ } 
 	*condition  phải là boolean 
	
	6. switch/case
	* Bắt buộc phải có default
	…..



 	7. For-in
	
	-Duyệt mảng 
 -> VD: let arr = [1,2,3] 
		    for item in arr {
			print(item)
		   }


	-Duyệt range ( a…b)
	-> VD: for i in 1...5 {
    			print(i)
		     } 
	*Lưu ý : ( ..< ): không bao gồm, (…) bao gồm cả 5


	-Duyệt dictionary ( là key - value )
	-> VD: 
		let dict = ["a": 1, "b": 2]

		for (key, value) in dict {
    			print(key, value)
		}
	
	
