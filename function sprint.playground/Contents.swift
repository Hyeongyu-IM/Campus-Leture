import UIKit

var str = "Hello, playground"

// 성이랑 이름을 받아서 full name을 출력하는 함수 만들기
// 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname 출력하는 함수 만들기
// 성, 이름을 받아서 fullname return 하는 함수 만들기



var firstname = "HyeonGyu"
var lastname = "IM"

func printName (firstname : String = firstname, lastname : String = lastname ) -> String {
    print( "\(firstname) \(lastname)" )

    return "\(firstname) \(lastname)"
}
printName(firstname: firstname, lastname: lastname)

printName()

