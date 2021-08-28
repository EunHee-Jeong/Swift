import UIKit

// property observer

struct Money {
    
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
    
    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다") // willSet의 암시적 매개변수 이름 -> newValue
        }
        didSet {
            print("\(dollar)달러에서 \(oldValue)달러로 변경될 예정입니다") // didSet의 암시적 매개변수 이름 -> oldValue
        }
    }
    
    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        /*
         willSet {
         
         }
         // 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 x
         */
    }
}

var moneyInMyPocket: Money = Money()
moneyInMyPocket.currencyRate = 1150 // 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket.dollar = 10 // 0.0달러에서 10.0달러로 변경될 예정입니다
print(moneyInMyPocket.won)  // 11500.0
