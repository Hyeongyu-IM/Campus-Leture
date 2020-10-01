import UIKit

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    // if문안에 있는 조건을 만족하면 return nil로 인스턴스가 nil로 선언되어 반환됩니다.
    
    init?(name: String, age: Int) {
            if (0...120).contains(age) == false {
                    return nil
            }
            if name.count == 0 { // count가 0이라는 것은 "" 문자열이 없다는 것입니다
                    return nil
            }
            self.name = name
            self.age = age
      }
}

let hyeon: PersonD? = PersonD(name: "hyeon", age: 20)

hyeon?.nickName = "GGYU"

hyeon?.nickName
let john: PersonD? = PersonD(name: "John", age: 23)

