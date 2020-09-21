import UIKit

var evenNumbers: [Int] = [2, 4, 6, 8]
//let 으로 선언할경우 값을 추가하거나 뺄수 없다.

evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])


let isEmpty = evenNumbers.isEmpty       // 비어있는지 확인할수 있는 메서드

evenNumbers.count  // 몇개의 데이터가 있는지 확인 (1부터시작)

print(evenNumbers.first)

let firstItem = evenNumbers.first
// 여기서 firstItem의 타입이 옵셔널이 나오는이유는 배열안이 비어있을수가 있기 때문이다. []

if let firstElement = evenNumbers.first {
    print("--> first item is :\(firstElement)")  // 값이 있으면 프린트를 출력 else 생략
}

evenNumbers.min()  // 최소값
evenNumbers.max() // 최대값


var Item0 = evenNumbers[0]
var Item2 = evenNumbers[2]
//var ItemOver = evenNumbers[10]       // 배열의 범위를 넘어가는 값을 호출하려 할경우 오류가 발생

let firstThree = evenNumbers[0...2]

evenNumbers.contains(3)     // 데이터가 있는지 검사할수있다.

evenNumbers.insert(0, at: 0) // 원하는 자리에 데이터를 추가

//evenNumbers.removeAll()
evenNumbers

evenNumbers[0] = -2

evenNumbers[0...2] = [-2, 0, 2]  //이렇게 값을 바꿔줄수 있다

//evenNumbers.swapAt(0, 9)  // 데이터의 위치를 서로 바꾼다

for num in evenNumbers {
    // 자바스크립트에서는 for in은 데이터의 인덱스값을 불러오는 것이였는데 스위프트는 요소를 순서대로 불러오는군
    print(num)
}

for (index, num) in evenNumbers.enumerated() {
    // Swift에서는 키와 밸류를 동시에 받을수 있는 메서드가 있는것 같다 (enumerated)
    print("\(index), \(num)")
}

evenNumbers.dropFirst(3)  // 소스배열에 영향을 주지않고 앞에서부터 3개의 데이터를 빼고 출력해줌
evenNumbers

evenNumbers.dropLast(1)  // 소스배열에 영향을 주지않고 뒤에서부터 1개의 데이터를 빼고 출력해줌
evenNumbers

evenNumbers.prefix(3)  // 소스배열에 영향을 주지않고 앞의 데이터 3개를 가져온다
evenNumbers

evenNumbers.suffix(3) //. 소스배열에 영향을 주지않고 뒤의 데이터 3개를 가져온다
evenNumbers
