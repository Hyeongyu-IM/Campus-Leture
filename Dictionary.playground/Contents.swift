import UIKit

var scoreDic: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90] // 이방법을 주로 많이 사용하게된다.
//var scoreDic: Dictionary[String, Int] = ["Jason": 80, "Jay": 95, "Jake": 90]  이렇게도 표현할수 있다.

if let score = scoreDic["jason"] {
    score
}

scoreDic["Jason"]
scoreDic["Jerry"]         // 존재하지 않는 키값을 호출하면 nil이 리턴된다



//scoreDic = [:]  // 비어있는 컨테이너를 표시하는게 신기하다
scoreDic.isEmpty   // 배열과 같음
scoreDic.count      // 배열과 같음

//기존 사용자 업데이트
scoreDic["Jason"] = 99
scoreDic

//사용자 추가
scoreDic["Jack"] = 100
scoreDic

//사용자 제거
scoreDic["Jack"] = nil
scoreDic

// For Loop

for (name, score) in scoreDic {
    print("\(name), \(score)")
}

for key in scoreDic.values {           // keys를 사용하면 키값을 하나씩 받아오게 된다. valuse도 있네 ㅋㅋ.
    print(key)
}

/////#### 주의해야할 사항은 for문을 사용할때 순서대로 나오는 것 처럼 보이지만 Dictionary에서는 순서가 보장되지 않는다!!!


// 이름, 직업, 도시 에 대해서 본인의 딕셔너리 만들기
// 여기서 도시를 부산으로 업데이트 하기
// 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기

var hyeongyuInfo: [String : String] = ["name": "Hyeongyu IM", "job": "NONE" , "city": "Seoul"]

hyeongyuInfo

hyeongyuInfo["city"] = "busan"
hyeongyuInfo

func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print(name, city)
    } else {
        "cannot find"
    }
}

printNameAndCity(dic: hyeongyuInfo)


