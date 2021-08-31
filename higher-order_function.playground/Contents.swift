import UIKit

// 1. map
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)  // ["0", "1", "2", "3", "4"]

doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)  // ["0", "1", "2", "3", "4"]

doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers)   // [0, 2, 4, 6, 8]


// 2. filter
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}
print(filtered) // [0, 2, 4]

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)  // [0, 2, 4]

let oddNumbers: [Int] = numbers.filter {
    $0 % 2 != 0
}
print(oddNumbers)   // [1, 3]


// 3. reduce
let someNumbers: [Int] = [2, 8, 15]

var result: Int = 0

for number in someNumbers {
    result += number
}
print(result)   // 25

let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first + second
})
print(sum)  // 25

var subtract: Int  = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first - second
})
print(subtract) // -25

let sumFromThree = someNumbers.reduce(3){ $0 + $2 }
print(sumFromThree) // 28
