import UIKit

// Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다"
someAny = 123.12

// let someDouble: Double = someAny // 컴파일 오류 발생
// Any 타입에 Double 자료를 넣어두었더라도, Any는 Double 타입이 아니기 때문에 할당할 수 없음
// 명시적으로 타입을 변환해 주어야 함

// AnyObject
class SomeClass {}
var someAnyObject: AnyObject = SomeClass()

// someAnyObject = 123.12 // 컴파일 오류 발생
// AnyObject는 클래스의 인스턴스만 수용 가능하기 때문에 클래스의 인스턴스가 아니면 할당할 수 없기 때문

// nill
// 다른 언어의 NULL, Null, null 등과 유사한 표현

// someAny = nil // 컴파일 오류 발생
// someAnyObject = nil // 컴파일 오류 발생
// someAny는 Any 타입이고, someAnyObject는 AnyObject 타입이므로 nil을 할당할 수 없기 때문

// nil을 다루는 방법은 옵셔널 파트에서 배움
