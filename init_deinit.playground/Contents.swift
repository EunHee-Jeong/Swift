import UIKit

// 1. 프로퍼티 초기값
class PersonA {
    
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

// 인스턴스 생성
let jason: PersonA = PersonA()

jason.name = "jason"    // 기본값이 인스턴스가 지녀야 할 값과 맞지 않다면 생성된 인스턴스의 프로퍼티에 새로운 값 할당
jason.age = 30
jason.nickName = "j"


// 2. Initializer
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // initializer
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

class PersonC {
    var name: String
    var age: Int
    var nickName: String?   // 초기값이 굳이 필요하지 않다면 옵셔널 사용
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

/*
// 위와 동일한 기능 수행 (== class 내부의 init을 사용할 때는 convenience 사용)
convenience init(name: Stirng, age: Int, nickName: String) {
    init(name: name, age: age)
    self.nickName = nickName
}
 */

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 초기값을 할당하지 않고자 할 때는 암시적 추출 옵셔널 사용
class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
// happy.goOut()    // 주인이 없는 상태라 오류 발생
happy.owner = jenny
happy.goOut()   // happy가 주인 jenny와 산책을 합니다.


// 실패 가능한 이니셜라이저
// 전달하는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있음 -> nil 반환 => 옵셔널 타입
class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if(0...120).contains(age) == false {
            return nil
        }
        
        if name.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

let jhon: PersonD? = PersonD(name: "jhon", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)  // nil
let batman: PersonD? = PersonD(name: "", age: 10)   // nil


// 3. Deinitializer
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    deinit {    // 인스턴스가 메모리에서 해제되는 시점에 자동 호출
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil    // donald 인스턴스가 더이상 필요 없으므로 메모리에서 해제됨
// donale가 jenny에게 happy를 인도합니다
