import UIKit


struct Person {
    // stored property
    // 오브젝트에 값을 저장하는 프로퍼티
    var firstName: String {
        // didSet은 변수가 바뀔경우 어떻게 바뀌어가는지를 출력할수있는 기능이다. Store Property에서만 사용가능하다
        // 값이 세팅되고나서 확인 didSet, 값이 세팅되기 직전에 확인 willSet
//        willSet {
//            print("willSet: \(firstName) --> \(newValue)")
//        }
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    
    // Lazy Property
    // 모든 사용자에게 해당코드의 정보가 필요없을때 필요한 사용자에게 선택적으로 제공하여 성능을 높일수있다.
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    
    // compute property
    // - var 키워드로만 선언 가능하다
    // 값을 직접 저장하지 않고 store에 저장된 값을 이.용.하고 계산하여 반환합니다.
    // 읽기전용 입니다
    // 단. getter setter를 이용하면 값을 입력할수있습니다.
    var fullName: String {
        
        // 읽기전용 키워드 get
        get {
            return "\(firstName) \(lastName)"
        }
        // 쓰기 키워드 set
        // 새로운 값이 들어왔을때(newValue) 지정된 코드가 실행되며 아래의 코드에는 " " 를 기준으로 앞과 뒤를 나누는데 앞은 퍼스트네임으로 뒤는 라스트네임으로 지정된다.
        set {
            // newValue "Jay Park"
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }

            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }

        }
    }
//    // compute property
//    var fullName: String {
//        return "\(firstName) \(lastName)"
//    }
    
    
    // 메서드
//    func fullName() -> String {
//        return "\(firstName) \(lastName)"
//    }
    
    
   // Type property - 생성된 인스턴스에 상관없이 그 스트럭트의 타입자체의 속성을 정하고 싶을때 사용하는 것.
    // 선언된 인스턴스의 타입을 설정할수있다
    static let isAlien: Bool = false
}

var person = Person(firstName: "Jason", lastName: "Lee")

person.firstName
person.lastName

person.firstName = "Jim"
person.lastName = "Kim"

person.firstName
person.lastName

person.fullName
person.fullName = "Jay Park"
person.firstName
person.lastName


Person.isAlien

person.isPopular

//person.fullName
//person.fullName()
