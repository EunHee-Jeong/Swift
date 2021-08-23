// 콘솔로그와 문자열 보간법
// consolelog & string interpolation

import UIKit

let age: Int = 23

"안녕하세요! 저는 \(age)살 입니다"
// == 안녕하세요! 저는 23살 입니다

"안녕하세요! 저는 \(age + 5)살 입니다"
// 안녕하세요! 저는 28살 입니다

print("안녕하세요! 저는 \(age)살 입니다")
print("---------------------------")

class Person {
    var name: String = "은희"
    var age: Int = 23
}

let 은희: Person = Person()

print(은희)
print("---------------------------")
dump(은희)
