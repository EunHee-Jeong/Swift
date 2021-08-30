import UIKit

// 1. Swift Type Casting (형 변환)

// 클래스 생성
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}
class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}
class UnivStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다")
    }
}

// 인스턴스 생성
var majayong: Person = Person()
var pikachu: Student = Student()
var raichu: UnivStudent = UnivStudent()


// 2. 타입 확인

var result: Bool

result = majayong is Person // true
result = majayong is Student    // false
result = majayong is UnivStudent    // false

result = pikachu is Person  // true
result = pikachu is Student // true
result = pikachu is UnivStudent // false

result = raichu is Person   // true
result = raichu is Student  // true
result = raichu is UnivStudent  // true

if majayong is UnivStudent  {
    print("majayong은 대학생입니다")
} else if majayong is Student {
    print("majayong은 학생입니다")
} else if majayong is Person {
    print("majayong은 사람입니다")
}   // majayong은 사람입니다

switch pikachu {
case is Person:
    print("pikachu는 사람입니다")
case is Student:
    print("pikachu는 학생입니다")
case is UnivStudent:
    print("pikachu는 대학생입니다")
default:
    print("pikachu는 사람도, 학생도, 대학생도 아닙니다")
}   // pikachu는 사람입니다

switch pikachu {
case is UnivStudent:
    print("pikachu는 대학생입니다")
case is Student:
    print("pikachu는 학생입니다")
case is Person:
    print("pikachu는 사람입니다")
default:
    print("pikachu는 사람도, 학생도, 대학생도 아닙니다")
}   // pikachu는 대학생입니다


// 3. Up Casting

// UnivStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UnivStudent() as Person

var jenny: Student = Student()
// var jina: UnivStudent = Person() as UnivStudent  // 컴파일 오류

// UnivStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var jina: Any = Person()


// 4. Down Casting

// 조건부 다운 캐스팅
// 캐스팅에 실패하면 nil 반환 -> 결과 타입 옵셔널
var optionalCasted: Student?

optionalCasted = mike as? UnivStudent
optionalCasted = jenny as? UnivStudent  // nil
optionalCasted = jina as? UnivStudent   // nil
optionalCasted = jina as? Student   // nil

// 강제 다운 캐스팅
// 캐스팅에 실패하면 런타임 오류 발생
var forcedCasted: Student

forcedCasted = mike as! UnivStudent
// forcedCasted = jenny as! UnivStudent // 런타임 오류 발생
// forcedCasted = jina as! UnivStudent // 런타임 오류 발생
// forcedCasted = jenny as! Student // 런타임 오류 발생


// 5. 활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UnivStudent:
        (someone as! UnivStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)  // 멤버쉽 트레이닝을 갑니다
doSomethingWithSwitch(someone: mike)    // 멤버쉽 트레이닝을 갑니다
doSomethingWithSwitch(someone: jenny)   // 등교를 합니다
doSomethingWithSwitch(someone: majayong)    // 숨을 쉽니다

func doSomething(someone: Person) {
    if let univStudent = someone as? UnivStudent {
        univStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)    // 멤버쉽 트레이닝을 갑니다
doSomething(someone: mike)  // 멤버쉽 트레이닝을 갑니다
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: majayong)  // 숨을 쉽니다
