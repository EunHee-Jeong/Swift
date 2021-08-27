import UIKit

// -- 명령형 프로그래밍 --
func doSomething1() {
    print("do something")
}
func doAnotherThing1() {
    print("do another thing")
}
func excuteAll1() {
    doSomething1()
    doAnotherThing1()
}
excuteAll1() // "do something"
            // "do another thing"

// -- 함수형 프로그래밍 --
func doSomething2() {
    print("do something")
}
func doAnotherThing2() {
    print("do another thing")
}
func excute2(tasks: [() -> Void]) {
    for task in tasks {
        task()
    }
}
excute2(tasks: [doSomething2, doAnotherThing2]) // "do something"
                                                // "do another thing"


// -- 두 수의 합을 구하고 싶은 경우 --

// 명령형 프로그래밍
func sum1(first: Int, second: Int) -> Int {
    return first + second
}
sum1(first: 2, second: 1)   // 3

// 함수형 프로그래밍
func sum2(first: Int) -> ((Int) -> Int) {
    return { second in first + second }
}
sum2(first: 2)(5)   // 3
