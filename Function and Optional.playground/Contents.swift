import UIKit

var str = "Hello, playground"

func name () {
    print(str)
}
name()

func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}
printMultipleOfTen(value: 10)

// param 2개
// 물건값과 갯수를 받아서 전체 금액을 출력하는 함수

func printTotalPrice(price: Int, count: Int) {
    print("Total Price: \(price * count)")
}

printTotalPrice(price: 1500, count: 5)

func printTotalPrice2(_ price: Int, _ count: Int) {   // _는 값만 넘겨줄때 사용. _  자리에 한글로 넣어도 가능
    print("Total Price: \(price * count)")
}

printTotalPrice2(1500, 5)

func printTotalPrice3(가격 price: Int, 갯수 count: Int) {   // _는 값만 넘겨줄때 사용. _  자리에 한글로 넣어도 가능
    print("Total Price: \(price * count)")
}

printTotalPrice3(가격 : 1500,갯수 : 5)

// 스위프트는 한글로도 코딩이 가능합니다


func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {   // price를 보면 기본값을 선언해준것을 볼수 있다(값을 넣지 않으면 반영되고, 넣으면 넣은값으로 실행이된다)
    print("Total Price: \(price * count)")
}

printTotalPriceWithDefaultValue(count: 10)

func totalPrice(price: Int, count: Int) -> Int {          // 리턴키워드가 있을때 리턴되는 키워드의 타입까지 명시를 해주어야 한다 -> 처럼
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice
