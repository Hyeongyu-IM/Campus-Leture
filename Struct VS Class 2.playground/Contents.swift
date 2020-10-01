import UIKit

// 처음 주어진 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student {
//    var grades: [Grade] = []
//
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}


struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    // 구조체를 불러올때 []
    var grades: [Grade] = []
}


let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jasson", lastName: "Lee")

jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)

jason.grades.append(math)
jason.grades.append(history)
//jay.grades

jason.grades.count



// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
    func train() {
        trainedTime += 1
    }
}

// 운동선인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"
    
    // 부모의 함수를 변경할때는 override키워드를 사용해야 한다
    override func train() {
        trainedTime += 2
    }
}

// Person > Student > Athelete > Football Player  -> 상속은 점점 깊어질수 있다.

var athelete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)
athelete2.grades.append(math)

athelete2.grades

athelete1.minimumTrainingTime
athelete2.minimumTrainingTime

//athelete1.footballTeam
athelete2.footballTeam

// 실행 할때마다 트레이닝 타임이 1만큼 증가된다
athelete1.train()
athelete1.trainedTime

// 실행 할때마다 트레이닝 타임이 2만큼 증가된다
athelete2.train()
athelete2.train()
athelete2.train()
athelete2.trainedTime


// UpperCast 라고 함
// athelete2는 athelete1을 상속했기 때문에 1는 2가 될수있다
athelete1 = athelete2 as StudentAthlete
athelete1.train()
athelete1.trainedTime

// 1을 2라고 선언했기 때문에
// 1이 만약 FootballPlayer에 접근할수 있으면 프린트 해줘 라는 것이다.
if let son = athelete1 as? FootballPlayer {
    print("--> team:\(son.footballTeam)")
}
