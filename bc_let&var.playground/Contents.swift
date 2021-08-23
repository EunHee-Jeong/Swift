import UIKit

// 상수와 변수 활용
let constant: String = "차후에 변경이 불가능한 상수 let"
var variable: String = "차후에 변경이 가능한 변수 var"

variable = "변수는 이렇게 차후에 다른 값을 할당할 수 있지만"
// constant = "상수는 차후에 값을 변경할 수 없습니다" // 오류발생

let sum: Int
let inputA: Int = 100
let inputB: Int = 200

// 선언 후 첫 할당
sum = inputA + inputB

// sum = 1 // 그 이후에 다시 값을 바꾸려고 하면 오류 발생

// 변수도 차후에 할당할 수 있음
var nickName: String

nickName = "majayong"

nickName = "마자용" // 변수는 차후에 다시 값을 할당해도 문제 없음
