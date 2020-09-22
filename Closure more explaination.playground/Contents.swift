import UIKit


var multiplyClosure: (Int, Int) -> Int = {
    (a: Int, b: Int) -> Int in return a*b
}

//var multiplyClosure: (Int, Int) -> Int = {
//  (a, b) in
//    return a*b
//}         // 이정도가 줄이는데 적합하다

//var multiplyClosure: (Int, Int) -> Int = {$0 * $1}   // 이렇게도 쓸수 있다 //쓰지말고 알아만 두자

multiplyClosure(4, 2)


func operatTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operatTwoNum(a: 4, b: 2, operation: multiplyClosure) // 파라미터에 함수를 넣는 법

var addClosure: (Int, Int) -> Int = {a, b in
    return a+b
}

operatTwoNum(a: 4, b: 2) { a, b in    //실행문에 클로저를 넣는 방법
    return a / b
}

let vodiClosure: () -> Void = {
    print("ios 개발자 짱, 클로저 사랑해")
}

vodiClosure()

// Capturing Values  // 스코프 안쪽에서 선언되었을 경우 카운트를 참조할수 없었다

var count = 0

let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()
incrementer()

count
q
