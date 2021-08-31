import UIKit


// 1. 프로토콜 구현

// 프로퍼티 요구 (var - get, set)
protocol Talkable {
    
    // 프로퍼티 요구
    var topic: String { get set }
    var language: String { get }
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}


// 2. 프로토콜 채택 및 준수

// 프로토콜 채택
struct Person: Talkable {
    
    // 프로퍼티 요구 준수
    var topic: String
    let language: String
    
    // 읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체 가능하다.
    // var language: String { return "한국어" }
    
    // 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체 가능하다.
    /*
     var subject: String = ""
     var topic: String {
        set {
            self.subject = newValue
        }
        get {
            return self.subject
        }
    }
     */
    
    // 메서드 요구 준수
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다.")
    }
    
    // 이니셜라이저 요구 준수
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

struct Person: Talkable {
    var subject: String = ""
    
    // 연산 프로퍼티로 프로퍼티 요구 대체
    var topic: String {
        set {
            self.subject = newValue
        }
        get {
            return self.subject
        }
    }
    var language: String { return "한국어" }
    
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다.")
    }
    
    init(topic: String, language: String) {
        self.topic = topic
    }
}


// 3. 프로토콜 상속
// 다중상속이 가능
protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadSpeakable: Readable {
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}


// 4. 클래스 상속과 프로토콜
// 상속받을 클래스 먼저 명시
class SuperClass: Readable {
    func read() { }
}
class SubClass: SuperClass, Writeable, ReadSpeakable {
    func write() { }
    func speak() { }
}


// 5. 프로토콜 준수 확인
// is, as 연산자 이용
let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable // true
someAny is ReadSpeakable    // false

someAny = sub
someAny is Readable     // true
someAny is ReadSpeakable    // true

someAny = sup
if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}   // read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
}   // 동작하지 않음

someAny = sub
if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}   // read
