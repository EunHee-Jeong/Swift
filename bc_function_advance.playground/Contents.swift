import UIKit

// 1. 매개변수 기본값
/*
 func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수2기본값...) -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
 }
 */
// 예시
func greeting1(friend: String, me: String = "majayong") {
    print("Hello \(friend)! I'm \(me).")
}

// 기본값을 가지는 매개변수는 호출 시 생략할 수 있다.
greeting1(friend: "pikachu") // Hello Pikachu! I'm majayong.
// 기본값은 말 그대로 기본값이기 때문에 변경 가능하다.
greeting1(friend: "chicken", me: "daisuki") // Hello chicken! I'm daisuki.


// 2. 전달인자 레이블 (Argument Label)
/*
 func 함수이름(전달인자레이블 매개변수1이름: 매개변수1타입, 전달인자레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
 }
 */

// '함수 내부'에서 전달인자를 사용할 때 -> '매개변수 이름' 사용
func greeting2(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me).")
}

// '함수 외부'에서 전달인자를 사용할 때 -> '전달인자 레이블' 사용
greeting2(to: "pikachu", from: "majayong")


// 3. 가변 매개변수
/*
 func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입...) -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
 }
 */
// 예시
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)."
}
print(sayHelloToFriends(me: "majayong", friends: "pikachu", "raichu", "rosa")) // Hello ["pikachu", "raichu", "rosa"]! I'm majayong.
print(sayHelloToFriends(me: "majayong")) // Hello []! I'm majayong.


// 4. 데이터 타입으로서의 함수
// Swift -> functional paradigm language -> 함수 == 1급객체 -> 함수를 타입으로 사용할 수 있음

// (매개변수1타입, 매개변수2타입...) -> 반환타입
// 예시
var someFunction: (String, String) -> Void = greeting2(to:from:) // 타입으로 (String, String) -> Void 사용
someFunction("pikachu", "majayong") // Hello pikachu! I'm majayong.

// 타입이 다른 함수는 할당할 수 없음 -> 컴파일 오류 발생
// someFunction = sayHelloToFriends(me:friends:)

func runAnother(function: (String, String) -> Void) {
    function("pikachu", "majayong")
}

runAnother(function: greeting1(friend:me:)) // Hello pikachu! I'm majayong.
runAnother(function: someFunction) // Hello pikachu! I'm majayong.
