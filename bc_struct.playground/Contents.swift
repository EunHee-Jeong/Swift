import UIKit

// 1. 구조체 문법

// 구조체 프로퍼티 및 메서드 구현
struct Sample {
    // 가변 프로퍼티 (값 변경 가능)
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티 (값 변경 불가
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티 (타입이 사용하는 프로퍼티)
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드 (인스턴스가 사용하는 메서드)
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드 (타입이 사용하는 메서드)
    static func typeMethod() {
        print("type method")
    }
}

// 구조체 사용
var mutable: Sample = Sample()  // 가변 인스턴스 생성
mutable.mutableProperty = 200
// mutable.immutableProperty = 200  // 컴파일 오류 발생
                                    // 불변 프로퍼티는 인스턴스 생성 후 변경할 수 없기 때문
let immutable: Sample = Sample()  // 불변 인스턴스 생성
// immutable.mutableProperty = 200  // 컴파일 오류 발생
                                    // 불변 인스턴스는 가변 프로퍼티라도 인스턴스 생성 후 변경할 수 없음

Sample.typeProperty = 300   // type property
Sample.typeMethod() // type method

// mutable.typeProperty = 300   // 컴파일 오류 발생
// muteble.typeMethod() // 컴파일 오류 발생
                        // 인스턴스에서는 타입 프로퍼티나 메서드를 사용할 수 없기 때문


// 2. 구조체 만들어보기
struct Student {
    var name: String = "unknown"    // 가변 프로퍼티
    var `class`: String = "Swift"   // 키워드는 `(option + ~)로 묶어주면 이름으로 사용할 수 있음
    static func selfIntroduce() {   // 타입 메서드
        print("학생 타입입니다")
    }
    func selfIntroduce() {  // 인스턴스 메서드
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce() // 타입 메서드 사용
// 학생 타입입니다

var majayong: Student = Student()   // 가변 인스턴스 생성
majayong.name = "majayong"
majayong.class = "스위프트"
majayong.selfIntroduce()    // 저는 스위프트반 마자용입니다.

let pikachu: Student = Student()    // 불변 인스턴스 생성
// pikachu.name = "pikachu" // 불변 인스턴스이므로 프로퍼티 값 변경 불가 -> 컴파일 오류 바생
pikachu.selfIntroduce() // 저는 Swift반 unknown입니다.
