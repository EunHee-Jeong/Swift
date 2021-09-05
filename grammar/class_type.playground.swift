import UIKit

// 1. 클래스 문법
// 프로퍼티 및 메서드 구현
class Sample {
    var mutableProperty: Int = 100  // 가변 프로퍼티
    var immutableProperty: Int = 100    // 불변 프로퍼티
    static var typeProperty: Int = 100  // 타입 프로퍼티
    
    func instanceMethod() { // 인스턴스 메서드
        print("instance method")
    }
    
    // 타입 메서드
    static func staticMethod() {  // 상속 시 재정의가 불가한 메서드 static
        print("type method - static")
    }
    class func classMethod() {  // 상속 시 재정의가 가능한 메서드 class
        print("type method - class")
    }
    
}

// 클래스 사용
var mutableReference: Sample = Sample() // 가변 인스턴스 생성 -> 참조정보 수정 가능
mutableReference.mutableProperty = 200
// mutableReference.immutableProperty = 200 // 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없으므로 컴파일 오류 발생
let immutableReference: Sample = Sample()   // 불변 인스턴스 생성 -> 참조정보 수정 불가
immutableReference.mutableProperty = 200    // '클래스'의 인스턴스 -> '참조 타입' -> let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능하다!
// immutableReference = mutableReference    // 참조 정보를 변경할 수는 없음 -> 컴파일 오류 발생
// immutableReference.immutableProperty = 200   // 참조 타입이라도 불변 프로퍼티는 인스턴스 생성 후 변경할 수 없음
Sample.typeProperty = 300   // type property
Sample.staticMethod()   // type method

// 2. 인스턴스 만들어보기
class Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce() // 학생 타입입니다.
var majayong: Student = Student()
majayong.name = "majayong"
majayong.class = "스위프트"
majayong.selfIntroduce()    // 저는 스위프트반 majayong입니다.
let pikachu: Student = Student()
pikachu.name = "pikachu"
pikachu.selfIntroduce() // 저는 Swift반 pikachu입니다.

// --------------------
/*
 1. '사람'을 나타내는 클래스를 만들어 봅시다.
 2. 사람이 가질 수 있는 속성을 프로퍼티로, 사람이 할 수 있는 행동을 메서드로 구현할 수 있습니다.
 3. 이름짓기 규칙을 다시 한 번 살펴보세요.
 */

class Human {
    var inner: String = "속성"
    var action: String = "행동"
    
    static func selfIntro() {
        print("사람입니다.")
    }
    
    func selfIntro() {
        print("\(inner)을(를) 가지고 \(action)을(를) 하는 사람입니다.")
    }
}

Human.selfIntro() // 사람입니다.
var eunie: Human = Human()
eunie.inner = "꿈"
eunie.action = "공부"
eunie.selfIntro() // 꿈을(를) 가지고 공부을(를) 하는
