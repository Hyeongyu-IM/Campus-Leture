import UIKit

struct professor {
    let name: String
    let lecturename : String
    let studentCount : Int
    }

let lecture1 = professor(name: "Jason", lecturename: "Math", studentCount: 10)
let lecture2 = professor(name: "Dylan", lecturename: "Coding", studentCount: 99)
let lecture3 = professor(name: "Mark", lecturename: "ENG", studentCount: 80)


func checkingName(name: String) -> String {
    var lectureName = ""
    
    for lecture in lectures {
        if name == lecture.name {
            lectureName = lecture.lecturename
        }
    }
    return lectureName;
    // let lectureName = lectures.first { $0.instructor == instructor }?.name ?? "" // 이렇게도 쓸수있다 리턴생략, for in 생략 ㄷ .ㄷ....

}

let lectures = [lecture1, lecture2, lecture3]


checkingName(name: "Jason")
