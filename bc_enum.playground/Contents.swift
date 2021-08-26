import UIKit

// 1. 열거형
enum WeekDay {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: WeekDay = WeekDay.mon
day = .tue
print(day)  // tue

switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case .fri:
    print("불금입니다~")
case .sat, .sun:
    print("주말입니다!")
}


// 2. 원시값 rawValue

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    // case mango = 0   // 원시값은 case별로 달라야 함!
}
print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)") // Fruit.peach.rawValue == 2

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case univ
}

print("School.middle.rawValue == \(School.middle.rawValue)")    // School.middle.rawValue == 중등
print("School.univ.rawValue == \(School.univ.rawValue)")    // School.univ.rawValue == univ
                                                            // 열거형의 원시값 타입이 String일 때 원시값이 지정되지 않았다면 case의 이름을 원시값으로 사용


// 3. 원시값을 통한 초기화

let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다.")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
}   // rawValue 5에 해당하는 케이스가 없습니다.


// 4. 메서드
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("더운 여름~")
        case .sep, .oct, .nov:
            print("선선한 가을~")
        case .dec, .jan, .feb:
            print("추운 겨울~")
        }
    }
}

Month.apr.printMessage()    // 따스한 봄~
