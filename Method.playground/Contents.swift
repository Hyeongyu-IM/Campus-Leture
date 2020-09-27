import UIKit

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0
    
    // 함수안에서 선언한 메서드.
    // 연관된 데이터를 기반으로 작동하기때문에 Struct안에서 선언되었다
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }
    
    //mutating이란 기본 Struct에 있는 값을 변화시키기 때문에 작성자가 변화를 인지하고 있는지 확인하기 위한 키워드 이다.
    mutating func register() {
        //학생수 증가시키기
        numOfRegistered += 1
    }
    // Type property 선언
    static let target: String = "Anybody want to learn something"
    
    // Type property Method 선언
    static func 학원이름 () -> String {
        return "FastCampus"
    }
}

var lec = Lecture(title: "iOS Basic")


// Struct구조 밖에서 함수선언을 할때에는 파라미터를 넣어주고 변수명을 붙여주어야 하지만
// Struct구조 안에서 선언할 때에는 자기 구조체에서 가져다 쓰기 때문에 파라미터는 필요없고, 변수명도 필요없다
//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeats = lec.maxStudents - lec.numOfRegistered
//    return remainSeats
//}

struct Math {
    // 절대값 알고리즘
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20)  // 20


// Struct를 확장시키는 키워드이다
// Struct안에 넣을 수도 있지만 모든 사용자가 아래와 같은 기능을 필요로 하지는 않을 수도 있기에 밖에서 확장시키는게 좋을수도 있다
// 그리고 함수안에 여러 확장 코드를 넣으면 충돌이 날수도 있기에 주의
extension Math {
    static func sqaure(value: Int) -> Int {
        return value * value
    }
    static func half(value: Int) -> Int {
        return value/2
    }
}

var value: Int = 3

// self 자기자신
// 원래있던 구조체에 자신이 원하는 타입을 추가할수 있다
// 심지어 지금은 Int라는 밸류타입에 아래의 함수형 타입프로퍼티를 추가하는것
// 엄청 많이 쓰인다. 잘 배워두자 ㅎㅎ
extension Int {
    func square() -> Int {
        return self * self
    }
    func half() -> Int {
        return self/2
    }
}


