import UIKit

var carName: String?    //값이 있을수도있고 없을수도있다

let actor: String? = nil
let num = Int("10")

carName = "없어요"
print(carName!)

if let unwrapperdCarName = carName {
// carName에 값이 있을경우 unwrapperdCarName에 변수값을 할당하고, 없는경우에는 else의 실행코드를 출력 , 알아둘것은 nil은 값이 아니다.
    print(unwrapperdCarName)
} else {
        print("Car Name 없다")
}

func printParsedInt(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
        // cyclomatic complexity
        //if parsedInt > 0 {
          //  print(parsedInt)
      //  }
    } else {
        print("Int로 컨버팅 안된다 짜샤. ")
    }
}
printParsedInt(from: "헬로우 마이네임이즈")

func printParsedInt2(from: String) {
    guard let parsedInt = Int(from) else{
        print("Int로 컨버팅 안된다 짜샤")
        return
    }
        print(parsedInt)
}
printParsedInt2(from: "100")

// 가드 문법은 첫줄에 선언되는 대상의 값이 있으면 바로 아래 프린트쪽으로 가고 만약 값이 없으면 else쪽으로 가서 지정된 프린트를 출력하고 리턴해서 빨리 나오게 하는 방법이다 결과적으로 이방법은
// cyclomatic complexity를 줄일수 있게 해주는 방법이다.


carName = nil
let myCarName: String = carName ?? "모델 S"
// 얘를 문자열로 하고싶은데 만약 얘가 nil이면 "모델 S"라고 해줘 라고하는 것이다 물음표 ??(Nil coalescing)을 사용하면 조건을 줄수있다.

//--- 도전과제
// 1. 최애 음식이름을 담는 변수를 작성 (String?)
// 2. 옵셔널 바인딩을 이용해서 값을 확인해 보기
// 3. 닉네임을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?

let favFood: String? = "감자탕"
print(favFood!)

let expose: String = favFood ?? "앙없자나"

if let myyyyfood = favFood {
    print(myyyyfood)
} else {
    print("없다")
}

func exposing(name: String?) {
    guard let myFav = name else {
        print("응 그런거 없어")
        return
    }
        print(myFav)
    
}

exposing(name: nil)
