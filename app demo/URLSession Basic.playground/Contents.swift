import UIKit

//URLSession

//1. URLSesseionConfiguration
//2. URLSession
//3. URLSessionTask 를 이용해서 서버와 네트워킹

//URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
// URL Components
// 각자의 쿼리는 요청사항을 의미합니다
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")
// url컴포넌트에 요청사항들 추가
urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
// 모든값을 조합한것을 url로 설정 url은 옵셔널이라서 !
let requestURL = urlComponents.url!

//dataTask는 클로저 형태를 작성해주며 매개변수는 data, resoponse, error가 있다.
// 여기서 받는 데이터는 옵셔널형태로 들어오기때문에 guard를 써주어서 까주었다.
// 첫줄에 에러는 발생하면 아무것도 하지않는다는 코드입니다.
let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    // 이코드는 200 299 까지는 status의 성공 범위이기때문에
    let successRange = 200..<300
    
    // 따라서 코드가 성공범위 안에 있다면 다음의 코드를 실행합니다.
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    // resultData는 bytes형태 라서 우리가 알아볼수 있도록 인코딩 하는것
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    print("---> result : \(resultString)")
}
// 함수 실행
dataTask.resume()

// 이러한 결과들을 보려면 Postman에 가서 requestURL을 똑같이 붙여넣으면 변환된 dataTask 값이 그대로 나오게 됩니다.
