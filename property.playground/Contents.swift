import UIKit


// 1. property

struct Student {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {   // 읽기전용
            return koreanAge - 1
        }
        set(inputValue) {   // 읽기, 쓰기 모두 가능
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    /*
     // 인스턴스 메서드
        func selfIntroduce() {
            print("저는 \(self.class)반 \(name)입니다")
        }
     */
    
    // 읽기전용 인스턴스 연산 프로퍼티
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"   // selfIntroduce()를 대체할 수 있음
        }
    }
    
    /*
     // 타입 메서드
        static func selfIntroduce() {
            print("학생 타입입니다")
        }
     */
    
    // 읽기전용 타입 연산 프로퍼티
    static var selfIntroduction: String {
        return "학생 타입입니다"   // 읽기전용에서는 get을 생략할 수 있음
    }
}
    
// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction) // 학생 타입입니다
    
// 인스턴스 생성
var majayong: Student = Student()
majayong.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
majayong.name = "majayong"
print(majayong.name)

// 인스턴스 연산 프로퍼티 사용
print(majayong.selfIntroduction)    // 저는 Swift반 majayong입니다.

print("제 한국나이는 \(majayong.koreanAge)살이고, 미쿡나이는 \(majayong.westernAge)살 입니다")    // 제 한국나이는 10살이고, 미쿡나이는 9살입니다.


// 2. 응용
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()
moneyInMyPocket.won = 11000
print(moneyInMyPocket.won)  // 11000

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)  // 11000


// 3. 지역변수 및 전역변수

var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum)  // 300
