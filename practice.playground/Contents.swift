import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let person1 = [1, 2, 3, 4, 5]
    let person2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let person3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var top: [Int: Int] = [:]

    for i in 0..<answers.count {
        if answers[i] == person1[i%person1.count] {
            top[1] = (top[1] ?? 0)+1
        }
        if answers[i] == person2[i%person2.count] {
            top[2] = (top[2] ?? 0)+1
        }
        if answers[i] == person3[i%person3.count] {
            top[3] = (top[3] ?? 0)+1
        }
    }
    let topOftop = top.values.max()!
    let result = top.filter { $0.value == topOftop }.keys.sorted()

    return result
}
////
////var i = 0
////while i < 5 {  // i 가 5보다 작으니까 0에서 1.2 3. 4 5 이렇게 커짐
////    print(i)
////    i += 1
////}
////func checking() -> String{
////let ten = [10, 9, 8, 5, 4, 2, 1]
////var result = ""
////for q in ten {
////    if q == 5 {
////        result = result + "i met a num"
////
////    } else {
////        result = "where is my num ..."
////    }
////}
////    return result
////}
////checking()
//
//
//let num = 1
//
//switch num {
//case 1:
//    print("is this 1?")
//default:
//    "없어요"
//}
//
//
//let nu1 = 3
//
//switch nu1 {
//case _ where nu1 == 3:
//    print("i met 3")
//default:
//    "??"
//}

//var string = "string"
//var asdf: String
//for i in string.indices {
//  asdf = String(string[i])
//    print(asdf)
//}
// 먼저 담을 변수를 선언.
// 두개씩 비교해서 같으면 두가지 요소를 삭제
// 두개씩 비교해서 안같으면 두요소를 변수에 담기.


//import Foundation
//
//let input = readLine()!
//func reduce(string: String) -> String? {
//    if string.isEmpty {
//        return nil
//    }
//    for index in 0..<(string.count-1) {
//        let index1 = string.index(string.startIndex, offsetBy: index)
//        let index2 = string.index(string.startIndex, offsetBy: index + 1)
//        let char1 = string[index1]
//        let char2 = string[index2]
//        if char1 == char2 {
//            if string.count == 2 {
//                return ""
//            }
//            return string.substringWithRange(string.startIndex..<index1) + string.substringWithRange((index2.advancedBy(1))..<string.endIndex)
//        }
//    }
//    return nil
//}
//
//var remaining = input
//
//while(true) {
//    if let reduced = reduce(string: remaining) {
//        remaining = reduced
//    } else {
//        break
//    }
//}
//
//if remaining.isEmpty {
//    print("Empty String")
//} else {
//    print(remaining)
//}
//
//
//reduce(string: "aabbccasdf")
//let input = 10.52834213
//let roundedNum = round(input * 1000) / 1000
//
//roundedNum

//let a:Double = 10
//let b:Double = 3
//let format = a+b
////let result = a / b
////let format = String(format: "%.9f", result)
//print(format) //"3.333333333\n" 스트링 타입


//import Foundation
//
//var line = readLine()!.components(separatedBy: " ")
//let num = line.map(Int($0)!)
//
////input 1 2 3 4 5
//let input = readLine()!.components(separatedBy: " ").map {Int($0)!}
//print(input) // [1, 2, 3, 4, 5]

//input 12345
//let stringarr = Array(readLine()!).map {Int(String($0))! }
//print(stringarr) //[1, 2, 3, 4, 5]
//import Foundation
//print("Hello")
//
//var line = readLine()!

//var arr = [1, 2, 3, 4]
//for i in 0...arr {
//    print([i])
//}
//
//while let value = readLine() {
//   let a = value.components(separatedBy: " ")
//    let b = Int(a[0])!
//    let c = Int(a[1])!
//    print(a + b)
//
//}



//func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
//    var board = board
//    var basket: [Int] = []
//    var result = 0
//
//    for i in moves{
//        let direction = move - 1
//        for folk in 0..<board.count {
//            let doll = board[folk][direction]
//            guard doll != 0 else { continue }
//            board[folk][direction] = 0
//            if basket.last == doll {
//                basket.removeLast()
//                result += 2
//            } else { basket.append(doll) }
//            break
//        }
//    }
//    return result
//}

//크레인 인형뽑기 게임
// 배열 1 = 몇개의 배열이 올지는 모른다.
// 배열 2 = 배열을 선택해서 뽑는다. 선택한 배열의 특정 자릿수가 0이면 다음 배열로 이동.
// 뽑은 숫자를 다른 변수에 담고, 뽑은 숫자는 0으로 바꾼다.
// 담은 변수를 바구니변수에 담기전에, 끝의 숫자와 같으면 카운트 +2를하고 삭제한다.
// 만약 같지 않다면 추가.
// 만약 추가되는 숫자가 생기면 해당 반복을 중지하고 새로운 반복을 시작한다.
