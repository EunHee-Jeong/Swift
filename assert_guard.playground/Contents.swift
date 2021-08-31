import UIKit


// application이 동작 도중에 생성하는 다양한 연산 결과 값을 동적으로 확인 & 안전하게 처리

// 1. Assertion
// 디버깅 모드에서만 동작, 조건의 검증을 위해 사용됨

var someInt: Int = 0

assert(someInt == 0, "someInt != 0")

someInt = 1
// assert(someInt == 0) // 동작 중지, 검증 실패
// assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패, assertion failed: someInt != 0: file guard_assert.swift, line 26 메시지를 띄움

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age!)세 입니다")
}
functionWithAssert(age: 50)
functionWithAssert(age: -1) // 동작 중지, 검증 실패
functionWithAssert(age: nil)    // 동작 중지, 검증 실패


// 2. guard (빠른 종료 - Early Exit)
// 잘못된 값의 동작 시 특정 실행구문을 빠르게 종료
// 모든 조건에서 동작
// else 블럭 내부에는 특정 블럭을 종료하는 지시어 return, break등이 반드시 필요

func functionWithGuard(age: Int?) {
    
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else {
            print("나이값 입력이 잘못되었습니다")
            return
    }
    
    print("당신의 나이는 \(unwrappedAge)세 입니다")
}

var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}
// 1
// 2

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "majayong", "age": 10])  // majayong: 10


// 3. if let / guard를 이용한 옵셔널 바인딩 비교

/*
// if let 옵셔널 바인딩
if let unwrapped: Int = someValue {
    // do something
    unwrapped = 3
}
// if 구문 외부에서는 unwrapped 사용 불가

// guard 옵셔널 바인딩
guard let unwrapped: Int = someValue else {
    return
}
unwrapped = 3   // guard 구문 이후에도 unwrapped 사용 가능
*/
