import UIKit

//{ (param) - > return type in
//    statement
//    ...
//}


// Simple Closure

//let simpleClosure = {
//
//}

// 코드블럭을 구현한 Closure

//let simpleClosure = {
//    print("Hello, 클로져, 코로나 하이!")
//}
//
//simpleClosure()

// 인풋 파라미터를 받는 Closure

//let simpleClosure: (String) -> Void = { name in
//    print("Hello, 클로져, 코로나 하이! 나의 이름은 \(name) 입니다!")
//}
//
//simpleClosure("코로나")

// 값을 리턴하는 Closure

//let simpleClosure: (String) -> String = { name in
//    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거에요!"
//    return message
//}
//
//let result = simpleClosure("코로나가 제일시러")
//print(result)

// Closure를 파라미터로 받는 함수 구현

//func somesimpleFunction(simpleClosure: () -> Void) {
//    print("함수에서 호출되었어요")
//    simpleClosure()
//}
//
//somesimpleFunction(simpleClosure: {
//    print("헬로 코로나 from Closure")
//})



// Trailing Closure

func somesimpleFunction(message: String, simpleClosure: () -> Void) {
    print("함수에서 호출이 되었어요, 메세지는 \(message)")
    simpleClosure()
}

//somesimpleFunction(message: "로나로나 메로나, 코로나 극혐", simpleClosure: {
//    print("헬로 코로나 from Closure")
//})

somesimpleFunction(message: "로나로나 메로나, 코로나 극혐") {
    print("헬로 코로나 from Closure")
}
