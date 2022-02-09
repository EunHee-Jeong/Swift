import UIKit

// 클래스의 상속 (Inheritance of Class)

// 1. 문법
/*
class 이름: 상속받을 클래스 이름 {
    /* 구현부 */
}
*/

// 2. 사용

// 기반 클래스 Person
class Person {
    var name: String = ""
    
    func selfIntro() {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용해 재정의를 방지할 수 있다.
    final func sayHi() {
        print("Hi")
    }
    
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    // 재정의 가능한 타입 메서드 class라도 앞에 final 붙여주면 재정의 할 수 없음
    // static == final class
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

// Person을 상속받는 Student
class Student: Person {
    var major: String = ""
    
    override func selfIntro() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    override class func classMethod() {
        print("overriden type method - class")
    }
}

// 3. 구동 확인
let majayong: Person = Person()
let eunie: Student = Student()

majayong.name = "majayong"
eunie.name = "eunie"
eunie.major = "Swift"

majayong.selfIntro()    // 저는 majayong입니다
eunie.selfIntro()   // 저는 eunue이고, 전공은 Swift입니다

Person.classMethod()    // type method - class
Person.typeMethod() // type method - static
Person.finalClassMethod()   // type method - final class
