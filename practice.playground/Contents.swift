import UIKit
//
//var i = 0
//while i < 5 {  // i 가 5보다 작으니까 0에서 1.2 3. 4 5 이렇게 커짐
//    print(i)
//    i += 1
//}
//func checking() -> String{
//let ten = [10, 9, 8, 5, 4, 2, 1]
//var result = ""
//for q in ten {
//    if q == 5 {
//        result = result + "i met a num"
//
//    } else {
//        result = "where is my num ..."
//    }
//}
//    return result
//}
//checking()


let num = 1

switch num {
case 1:
    print("is this 1?")
default:
    "없어요"
}


let nu1 = 3

switch nu1 {
case _ where nu1 == 3:
    print("i met 3")
default:
    "??"
}






