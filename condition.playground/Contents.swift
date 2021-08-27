import UIKit

// 1. if-else 구문
// 조건에는 항상 Bool type이 들어와야 함
/*
 if 조건 {
    /* 실행 구문 */
 } else if 조건 {
    /* 실행 구문 */
 } else {
    /* 실행 구문 */
 }
 */
// 예시
let someInteger = 100
if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
}
// 100

// 2. switch 구문
// switch 구문은 여러가지 스위프트 기본 type을 지원함.
/*
 switch 비교값 {
 case 패턴:
    /* 실행 구문 */
 default:
    /* 실행 구문 */
 */

// 예시1
switch someInteger {
case 0:
    print("zero")
case 1..<100: // 1이상 100미만
    print("1~99")
case 100:
    print("100")
case 101...Int.max: // 101이상 Int.max이하
    print("over 100")
default:
    print("unknown")
} // 100
// 예시2
switch "majayong" {
case "pikachu":
    print("pikachu")
case "raichu":
    print("raichu")
default:
    "majayong!!"
} // majayong!!
