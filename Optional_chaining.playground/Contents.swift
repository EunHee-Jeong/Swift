import UIKit

// 1. Optional chaining
// 옵셔널이 연쇄적으로 연결되어 있을 때 매번 nil값을 확인하지 않아도 원하는 값을 바로 확인할 수 있게 해줌

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

// unusing Optional chaining
let majayong: Person? = Person(name: "majayong")
let apart: Apartment? = Apartment(dong: "3", ho: "201")
let superman: Person? = Person(name: "superman")
// 옵셔널 체이닝의 실행 후 결과값이 nil일 수도 있으므로 결과 타입도 옵셔널인 것임

func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}
guardJob(owner: majayong)

// using Optional chaining
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없습니다")
    }
}
guardJob(owner: majayong)

majayong?.home?.guard?.job  // nil
majayong?.home = apart
majayong?.home  // Optional(apart)
majayong?.home?.guard   // nil
majayong?.home?.guard = superman    // 경비원 할당
majayong?.home?.guard   // Optional(Person)
majayong?.home?.guard?.name // superman
majayong?.home?.guard?.job // nil
majayong?.home?.guard?.job = "경비원"


// 2. nil 병합 연산자
// Optional ?? Value
// Optional 값이 nil일 경우 우측의 Value를 반환, 띄어쓰기 주의

var guardJob: String
guardJob = majayong?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 경비원

majayong?.home?.guard?.job = nil

guardJob = majayong?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨
