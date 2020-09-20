import UIKit

var str = "Hello, playground"

// 성이랑 이름을 받아서 full name을 출력하는 함수 만들기
// 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname 출력하는 함수 만들기
// 성, 이름을 받아서 fullname return 하는 함수 만들기


//func functionName(param: paramType) -> returnType {
//    //.........
//    return returnValue
//}


var firstname = "HyeonGyu"
var lastname = "IM"

func printName (firstname : String = firstname, lastname : String = lastname ) -> String {
    print( "\(firstname) \(lastname)" )

    return "\(firstname) \(lastname)"
}

func printName2 ( _ firstname : String, _ lastname : String) -> String {
    print( "\(firstname) \(lastname)" )

    return "\(firstname) \(lastname)"
}
printName(firstname: firstname, lastname: lastname)

printName()

let fullname2 = printName2(firstname, lastname)
fullname2

//--- In-out Parameter

var value = 3
func incrementAndPrint( _ value: inout Int) {
// Swift는 파라미터가 정해지면 값을 바꾸지 못하게 시스템적으로 막고 있다. 이파라미터를 상수가 아닌 변수로 활용하려면 inout을 써줘야한다
    value += 1
    print(value)
}
incrementAndPrint(&value)  // 그리고 파라미터를 넣을때 & 써줘야 한다

// --- Function as a param
func add(_ a :Int, _ b: Int) -> Int {
    return a+b
}

func subtract( _ a:Int, _ b: Int) -> Int {
    return a-b
}

var function = add
function(4, 2)

var minus = subtract
minus(9, 5)

func printResult( _ function: (Int, Int) -> Int, _ a:Int, _ b: Int) {
    // 파라미터를 넘길때 같은 타입의 파라미터를 넘겨야 한다 함수안의 파라미터와 뒤의 파라미터의 타입이.
    let result = function(a, b)
    print(result)
}

printResult(add, 10, 5)

//함수는 될수있으면 한가지의 일만하는 것이 가장 중요하다.
//계속 고민을 하다보면 좋은 코드를 쓸수 있다
//함수를 짤때 10줄을 넘지 않게 짜도록 노력하자
