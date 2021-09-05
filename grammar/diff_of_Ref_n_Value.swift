import UIKit

// Comparison of Reference Type and Value Type

struct ValueType {
    var property = 1
}
class ReferenceType {
    var property = 1
}

let firstStructureInstance = ValueType() // 첫 번째 구조체 인스턴스
var secondStructInstance = firstStructureInstance   // 두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사

secondStructInstance.property = 2    // 두 번째 구조체 인스턴스 프로퍼티 값 수정

print("first struct instance property: \(firstStructureInstance.property)") // 1
print("second struct instance property: \(secondStructInstance.property)")  // 2
// 두 번째 구조체 인스턴스는 첫 번째 구조체를 똑같이 복사한 별도의 인스턴스이기 때문에
// 두 번째 구조체 인스턴스의 프로퍼티 값을 변경해도 첫 번재 구조체 인스턴스의 프로퍼티 값에 영향 줄 수 x

let firstClassReference = ReferenceType()   // 클래스 인스턴스 생성 후 첫 번째 참조 생성
let secondClassReference = firstClassReference  // 두 번째 참조 인스턴스에 첫 번째 참조 할당

secondClassReference.property = 2   // 두 번째 참조 인스턴스 프로퍼티 값 수정

print("first class reference property: \(firstClassReference.property)")    // 2
print("second class reference property: \(secondClassReference.property)")  // 2
// 두 번재 클래스 참조는 첫 번째 클래스 인스턴스를 참조하기 때문에
// 두 번째 참조를 통해 인스턴스 프로퍼티의 값을 변경하면 첫 번째 클래스 인스턴스의 프로퍼티 값도 변경됨
