import UIKit

// 1. 클로저 사용

let sum: (Int, Int) -> Int = { (a: Int, b: Int) in  // sum이라는 상수에 클로저를 할당함
    return a + b
}

let sumResult: Int = sum(1, 2)
print(sumResult)    // 3


// 2. 함수 전달인자로서의 클로저

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: divide) // 5
calculated = calculate(a: 50, b: 10, method: substract) // 40

// 함수를 호출할 때 클로저를 작성하여 전달할 수도 있음.
calculated = calculate(a: 50, b: 10, method: {(left: Int, right: Int) -> Int in
    return left * right
})
print(calculated)   // 500


// 3. 축약 전 후 비교
var result: Int

// 축약 전
result = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left + right
})

// 축약 후
result = calculate(a: 50, b: 10) { $0 + $1 }    // $0: 0번째 인자, $1: 1번째 인자
