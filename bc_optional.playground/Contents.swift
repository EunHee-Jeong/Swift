import UIKit

// 1. nil 값

var movie = "깨어난 포스"
// movie = nil // 컴파일 오류 발생
// var otherWise: String = nil // 컴파일 오류 발생
var num = Int("Hello") // nil
num // nil
// 여기서 num은 nil이 될 수도 있고, 안 될 수도 있는 자료형임.
// var num: Int? = Int("Hello")를 축약한 것


// 2. Optional
var optionalMovie1: String? = "깨어난 포스"   // "깨어난 포스"
optionalMovie1 = nil // nil
var optionalMovie2: String? = nil   // nil
optionalMovie2 = "깨어난 포스"   // "깨어난 포스"

// 옵셔널 문법 = enum + generics
// 옵셔널 선언
/*
enum Optional<Wrapped>: ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
}
let optionalValue: Optional<Int> = nil
let optionalValue: Int? = nil
*/


// 3. Wrapped Optional
Optional("100")! // 100
var n = Int("100")! + Int("200")! // 300
n // 300

// 암시적 추출 옵셔널 Implicitly Unwrapped Optional
// 기존 변수처럼 사용하거나 nil을 할당할 수 있음.
// 선언
/*
var optionalValue: Int! = 100
switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}
*/
