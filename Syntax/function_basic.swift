import UIKit

// 1. 함수 선언의 기본 형태
/*
 func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입, ...) -> 반환타입 {
     /* 함수 구현부 */
     return 반환값
 }
*/
// 예시
func sum(a: Int, b: Int) -> Int {
    return a+b
}


// 2. 반환값이 없는 함수
/*
 func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입, ...) -> Void {
    /* 함수 구현부 */
    return
 }
*/
// 예시
func printMyname(name: String) -> Void {
    print(name)
}

// 반환값이 없는 경우, 반환타입(Void)을 생략해도 된다.
func printYourName(name: String) {
    print(name)
}


// 3. 매개변수가 없는 함수
/*
 func 함수이름() -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
 }
 */
// 예시
func maximumintegerValue() -> Int {
    return Int.max
}


// 4. 매개변수와 반환값이 없는 함수
/*
 func 함수이름() -> Void {
    /* 함수 구현부 */
    return
 */

// 함수 구현이 짧은 경우, 가독성을 해치지 않는 범위에서 줄바꿈을 하지 않고 한 줄에 표현해도 무관함
func hello() -> Void { print("Hello") }

// 반환 값이 없는 경우, 반환타입(Void) 생략가능
/*
 func 함수이름() {
    /* 함수 구현부 */
    return
 }
 */
// 예시
func bye() { print("BYE") }


// 5. 함수의 호출
sum(a: 3, b: 5) // 8
printMyname(name: "majayong") // majayong
maximumintegerValue() // Int의 최대값
hello() // hello
bye() // bye
