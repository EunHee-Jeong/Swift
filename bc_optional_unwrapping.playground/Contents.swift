import UIKit

// 1. Optional Binding

// --잘못된 예시--
func printName(_ name: String) {
    print(name)
}

var myName: String? = nil
// printName(myName)    // 컴파일 오류 발생
                        // 전달된 값의 타입이 다르기 때문

// --바른 예시--
if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

var yourName: String! = nil

if let name: String = yourName {
    printName(name)
} else {
    print("yourName == nil")
}

// printName(name)  // 오류발생
                    // name 상수는 if-let구문 내에서만 사용 가능하기 때문

// 여러 옵셔널을 한 번에 바인딩 -> , 사용
myName = "majayong"
yourName = nil

if let name = myName, let friend = yourName {
    print("\(name) and \(yourName)")    // yourName이 nil이기 때문에 컴파일 오류 발생
}

yourName = "pikachu"
if let name = myName, let friend = yourName {
    print("\(name) and \(yourName)")    // majayong and pikachu
}


// 2. Force Unwrapping
var yourName1: String! = nil

yourName1 = nil
// printName(yourName1) // nil값이 전달되므로 런타임 오류 발생
