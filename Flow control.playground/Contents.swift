import UIKit
import Foundation

var str = "Hello, playground"

//--- while

//while 조건 {
//    실행문
//}
var i = 0
while i < 10 {
    print(i)
    if i == 5 {
        break
    }
    i += 1
}

i = 0
repeat {
    print(i)
    i += 1
} while i < 10


// --- For Loop

let closedRangee = 0...10
let halfClosedRange = 0..<10

var sum = 0
for i in halfClosedRange {
    print(i)
    sum += i
}

var sinValue: CGFloat = 0
for i in closedRangee {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

for i in closedRangee {
    if i % 2 == 0 {
        print("---> 짝수: \(i)")
    }
}

for i in closedRangee where i % 2 == 0 {
    print("---> 짝수: \(i)")
}

for i in closedRangee {
    if i == 3 {
        continue
    }
    print("---> \(i)")
}


// ------ Switch

let num = 10

switch num {
case 0:
    print("--> 0 입니다")
case 0...10:
    print("--> 0 ~ 10사이 입니다")
case 10:
    print("--> 10 입니다")
default :
    print("--> 나머지 입니다")
}

let pet  = "bird"

switch pet {
case "dog", "cat", "bird"  :
    print("--> \(pet) 입니다")

default:
    print("---> 잘 모르겠습니다")
}

let number = 20

switch number {
case _ where num % 2 == 0:
    print("---> 짝수")
default:
    print("---> 잘 모르겠습니다")
}

let coordinate = (x: 10, y:10)

switch coordinate {
case (0, 0):
    print("---> 원점이네요")
case (_, 0):
    print("---> X축 이네요")
case (0, _):
    print("---> Y축 이네요") // _ 뭐가되든 상관없어 x가 0이면되
default:
    print("---> 좌표 어딘가")
}

switch coordinate {
case (0, 0):
    print("---> 원점이네요")
case (let x, 0):
    print("---> X축 이네요, x:\(x)")
case (0, let y):
    print("---> Y축 이네요m y:\(y)") // _ 뭐가되든 상관없어 x가 0이면되
case (let x, let y) where x == y:
    print("---> x와 y가 같네요 x,y : \(x), \(y)")
case (let x, let y):
    print("---> 좌표 어딘가 x,y : \(x), \(y)")
}

