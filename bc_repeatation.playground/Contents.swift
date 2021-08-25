import UIKit

// 1. for-in 구문
/*
 for item in items {
    /* 실행 구문 */
 }
 */
// 예시
var integers = [1, 2, 3]
let pocketmon = ["majayong": 10, "kkobugi": 15, "pikachu": 12]

for integer in integers {
    print(integer)
} // 1
  // 2
  // 3
for (name, age) in pocketmon {
    print("\(name): \(age)")
} // pikachu: 12
  // majayong: 10
  // kkobugi: 15


// 2. while 구문
/*
 while 조건 {
    /* 실행 구문 */
 }
 */
// 예시
while integers.count > 1 {
    integers.removeLast()
} // [1, 2]

// 3. repeat-while 구문
/*
 repeat {
    /* 실행 구문 */
 } while 조건
 */
// 예시
repeat {
    integers.removeLast()
} while integers.count > 0
// [1]
