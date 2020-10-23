import UIKit



func solution(_ n:Int64) -> [Int] {
    let arr = String(n).map { String($0) }
    var result = [Int]()
    for i in stride(from: arr.count-1, to: -1, by: -1) {
     result.append(Int(arr[i])!)
    }
    return result
}



//프로그래머스 이상한 문자 만들기
//func solution(_ s:String) -> String {
//var index = 0
//let str = s.map { (str: Character) -> String in
//        var result = ""
//        if str != " " {
//            if index % 2 == 0 {
//            result = result + str.uppercased()
//        } else {
//            result = result + str.lowercased()
//        }
//            index += 1
//        }else {
//            index = 0
//            result = result + " "
//        }
//        return result
//    }
//    return str.joined()
//}

//프로그래머스 약수의 합
//func solution(_ n:Int) -> Int {
//   var result = Set<Int>()
//    for i in 1...n/2 {
//        if n % i == 0 {
//            result.insert(i)
//            if i != n/i {
//                result.insert(n/i)
//            }
//        }
//    }
//    return result.reduce(0,+)
//}
//solution(12)




// 프로그래머스 시저 암호
//func solution(_ s:String, _ n:Int) -> String {
//    let lower = Array("abcdefghijklmnopqrstuvwxyz")
//    let upper = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//    var arr = Array(s)
//
//for i in 0..<arr.count {
//    if lower.contains(arr[i]) {
//        let index = (lower.firstIndex(of: arr[i])!+n)%26
//        arr[i] = lower[index]
//    } else if upper.contains(arr[i]) {
//        let index = (upper.firstIndex(of: arr[i])!+n)%26
//        arr[i] = upper[index]
//    }
//}
//    return String(arr)
//}
//func solution(_ s:String, _ n:Int) -> String {
//    let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
//    return String(s.map {
//        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
//        let letter = alphabets[(index + n) % alphabets.count]
//        return $0.isUppercase ? Character(letter.uppercased()) : letter
//    })
//}






// 알파벳 배열구성
// 조건문 두가지를 작성 upper or lower
//


// Prints "4"

//func solution(_ s:String) -> Int {
//     return Int(s) ?? 0
//
//}
//solution("asdf")

//
//func solution(_ n:Int) -> String {
//    var a = "수박"
//    for i in 0...n/2 {
//        a = a + a
//    }
//    return String(Array(a)[0..<n])
//}
//print(solution(50))
//func solution1(_ n: Int) -> Int {
//    var result = 0
//    var array = Array.init(repeating: false, count: n+1)
//
//    for i in 2...n {
//        if (!array[i]){
//            result += 1
//            for j in stride(from: i, through: n, by: i) {
//               array[j] = true
//            }
//        }
//    }
//    return result
//}

// 숫자들이 있고
// 순서대로 숫자들을 곱하면서 배수에 해당하는 숫자를 0으로 만들어준다.
// 대신 숫자가 0이면 다음 숫자 부터 시작

//let seoul = ["Jane me", "Kim me"]
//func solution(_ seoul:[String]) -> String {
//    return "김서방은 \(seoul.firstIndex(of: "Kim me")!)에 있다"
//}
//solution(seoul)
//"asdf".last
//func solution(_ s:String) -> Bool {
//    if s.count == 4 || s.count == 6 {
//    let num = "0123456789"
//   let without = s.filter { num.firstIndex(of: $0) != nil }
//
//return s.count == without.count
//    }
//    return false
//}
//func solution(_ s:String) -> String {
//    let abc = "abcdefghijklmnopqrstuvwxyz"
//    let lowercase = (s.filter { abc.firstIndex(of: $0) != nil}).sorted(by: >)
//    let uppercase = (s.filter { lowercase.firstIndex(of: $0) == nil}).sorted(by: >)
//
//    return String(lowercase) + String(uppercase)
//}
//let num = 45
//let seven = 7
//var str = String(num, radix: 3)
//var str2: String = ""
//for i in str.reversed() {
//   str2 += String(i)
//}
//String(seven, radix: 3)
//
//Int(str2, radix: 10)



//var str = "pPoooyY"
//var arr = Array(str.lowercased())
//print(arr)
//
//func solution(_ s:String) -> Bool
//{
//    let arr = Array(s.lowercased())
//    let p = arr.filter { ($0) == "p" }.count
//    let y = arr.filter { ($0) == "y" }.count
//
//    return p == y || (p == 0 && y == 0) ? true : false
//
//}
//
//solution("Pyy")
//var asf = "abcde"
//String(Array(asf)[(asf.count/2)-1...(asf.count/2)])
//
//var asdf = Array(asf)
//asdf[0] == "a"
//배열을 인덱스별로 나누어서 새로 만들어준다 [[Int]]
//나눈 배열을 문자열의 알파벳으로 다시 쪼개준다. [[],[],[],[]]
// 쪼갠배열의 알파벳 순서 비교하기
//
//
//func solution(_ strings:[String], _ n:Int) -> [String] {
//    return strings.sorted{  Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n] }
//}
//solution(["abcd", "abce", "cdx"], 2)
//
//let arr  = ["abcd", "abce", "cdx"]
//
//var arr2 = Array(arr[0])[2]
//
//let str  = "strtttt"
//let arr3 = Array(str)
//let str = "asdf"
//let str2 = "aadf"
//let index = str[str.index(str.startIndex, offsetBy: 1)] //"s"
//let index2 = str2[str.index(str.startIndex, offsetBy: 1)] // "a"
// index < index2 // false

//func solution(_ a:Int, _ b:Int) -> Int {
//   var result = a
//    if a == b {
//        result = a
//    } else if a > b {
//        result = b
//        for i in b+1...a {
//            result += i
//        }
//    } else {
//    for i in a+1...b {
//        result += i
//    }
//
//    }
//    return result
//}
//solution(3, 3)



//func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
//
//let check = arr.filter { ($0)%divisor == 0 }
//return check.count == 0 ? [-1] : check.sorted()
//}
//가운데 문자열 출력
//문자열을 배열의 형태로 -> 배열에서 문자열의 형태로 ->
//func solution(_ s:String) -> String {
//    var result = [String]()
//    let arr = s.map {String($0)}
//    let judge = arr.count%2 == 0 ? true : false
//    if judge {
//        result.append(arr[arr.count/2-1])
//        result.append(arr[arr.count/2])
//    } else {
//        result.append(arr[arr.count/2])
//    }
//    return result.joined()
//}
//solution("abde")
//let asdf = "asdf"
//String(asdf).count
//
//String(Array(asdf)[(asdf.count/2)-1...(asdf.count/2)])
//
//var arr = Array(asdf)[0]
//arr
//var str = String(arr)

// 2016년
//// 2016년은 윤년이다 == 366일
//// 2016 1 1 = 금요일
//// 2016 2월은 29일까지
//// 생각하여야할 것은 fri를 1로 시작해서 한바뀌돌면 8이라는것
//func solution(_ a:Int, _ b:Int) -> String {
//let weekArray = [ "MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
// let monthDayArray = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//
//    var first = 4
//    for day in 0..<a-1 {
//        first += monthDayArray[day]
//    }
//    first += b-1
//
//    return "\(weekArray[first%7])"
//}

//func solution(_ a:Int, _ b:Int) -> String {
//
//    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
//    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//    let totalDay = monthDay[0..<a-1].reduce(0, +) + b
//
//    return w[totalDay % 7]
//}


// 체육복
// 바로 앞이나 뒤만 체육복을 빌려줄수 있습니다. 조건문 두개 if if
// 최대한 많은 학생이 들을수 있게
// 전체 학생수 n , 도난당한 학생 lost, 여벌의 체육복 reserve
// 수업을 듣는학생수 return
// reserve의 학생도 도난당할수 있다.
// 여벌복이 있어야 빌려줄수 있다.

// 먼저 여벌복을 가진 학생을 새로운 배열에 담는다. 도난학생에서 빠집니다.[ 새로운 도난학생 배열 ]
//여벌복을 소진하면 값을 0으로 바꾸어준다. 매개변수 복제

// 여벌복을 가진 배열을 번호의 앞뒤로 검사해서 lost가 나올경우 해당 로스트의 값을 0으로 변환한다. 매개변수 복제
// 리턴값 계산 = n - 남아있는 lost 배열의 숫자 = 듣는 학생수

//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    var realLost = lost.sorted()
//    var realReserve = reserve.sorted()
//    var count = 0
//
//    for i in 0..<realLost.count {
//        for q in 0..<realReserve.count {
//            if realLost[i] == realReserve[q] {
//                realLost[i] = 0
//                realReserve[q] = 0
//                count += 1
//                break
//            }
//        }
//    }
//
//    //var losted = lost.filter{!reserve.contains($0)}
//    //var reserved = reserve.filter{!lost.contains($0)}
//
//    for num in 0..<realLost.count {
//        for cloth in 0..<realReserve.count {
//            if realReserve[cloth] == 0 || realLost[num] == 0 {
//                continue
//            } else if realLost[num]-1 == realReserve[cloth] ||
//                        realLost[num]+1 == realReserve[cloth] {
//                realReserve[cloth] = 0
//                count += 1
//                break
//            }
//        }
//    }
//
//    return n - lost.count + count
//
//}
//solution(5 ,[2, 4], [1, 3, 5] )


// 배열이 주어졌을때 임의의 정수 i 와 q 사이의 정렬된 배열에서 r을 찾는 문제
// 배열 = array
// 조건 = command = index1 = 길이기준 i, index2 = 길이기준 q, index3 = 정렬된배열의 길이기준 r
//1. 배열을 자른다. 2. 배열을 정렬한다. 3. 배열에서 r을 찾는다. 4. 찾은 r을 새로운 배열에 넣는다.
//let person1 = [1, 2, 3, 4, 5]
//person1[0...3]
//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//    var result = [Int]()
//
//    for slice in 0..<commands.count {
//        var newBasket = array[commands[slice][0]-1...commands[slice][1]-1].sorted()
//        result.append(newBasket[commands[slice][2]-1])
//    }
//
//    return result
//}
//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] { return commands.map{ let i = $0[0]-1; let j = $0[1]-1; let k = $0[2]-1 return array[i...j].sorted()[k] } } 이렇게도 풀다니... ㅠㅜ



//func solution(_ answers:[Int]) -> [Int] {
//    let person1 = [1, 2, 3, 4, 5]
//    let person2 = [2, 1, 2, 3, 2, 4, 2, 5]
//    let person3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
//    var top: [Int: Int] = [:]
//
//    for i in 0..<answers.count {
//        if answers[i] == person1[i%person1.count] {
//            top[1] = (top[1] ?? 0)+1
//        }
//        if answers[i] == person2[i%person2.count] {
//            top[2] = (top[2] ?? 0)+1
//        }
//        if answers[i] == person3[i%person3.count] {
//            top[3] = (top[3] ?? 0)+1
//        }
//    }
//    let topOftop = top.values.max()!
//    let result = top.filter { $0.value == topOftop }.keys.sorted()
//
//    return result
//}
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
