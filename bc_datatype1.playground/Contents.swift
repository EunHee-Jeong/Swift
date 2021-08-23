import UIKit

// Bool
var someBool : Bool = true
someBool = false
// someBool = 0 // 컴파일 오류 발생
// someBool = 1 // 컴파일 오류 발생

// Int
var someInt: Int = -100
// someInt = 100.1 // 컴파일 오류 발생

// UInt
var someUInt: UInt = 100
// someUInt = -100 // 컴파일 오류 발생
// someUInt = someInt // 컴파일 오류 발생

// Float
var someFloat: Float = 3.14
someFloat = 3

// Double
var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat // 컴파일 오류 발생

// Character
var someCharacter: Character = "☂️"
someCharacter = "가"
someCharacter = "A"
// someCharacter = "하하하" // 컴파일 오류 발생
print(someCharacter)

// String
var someString: String = "비온다 ☂️"
someString = someString + "우산을 써요"
print(someString)
// someString = someCharacter // 오류 발생
