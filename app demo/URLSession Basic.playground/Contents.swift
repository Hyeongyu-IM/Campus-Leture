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

// 구조체를 만들때 Postman에서 받는 정보의 이름과 파라미터와 같으면 따로 값을 지정해주지 않아도 된다.
// 리스폰즈의 역할은 받아오는 데이터를 받을때 받는 대상의 역할을 정해주는 것이다.
// 지금의 코드에서는 resultCount = 50이라고 되어있고, results ={ [] [] []... 이런게 50개가 있다}
// 따라서 카운트는 트랙의 개수이며, 트랙의 정보는 results[Int] 안에 있다.

// 리스폰즈에 Codable을 컨펌 시켜준다(프로토콜준수)
struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    // 코딩키는 파싱할 대상을 지정한다.
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}
// 트랙의 정보를 받을 것을 정한다.
// 트랙의 제목, 가수이름, 이미지 주소
struct Track: Codable {
    // 이것은 내가 정한 임의의 데이터 네임
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    // 여기서 ="" 은 받아오는 데이터에서 쓰여진 이름
    // 따라서 임의의 데이터이름에 받아오는 데이터를 연결시켜주어야 하기때문에
    // 똑같으면 지정하지 않아도 되지만 틀리다면 아래처럼 지정해 주어야한다.
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl100"
    }
}


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
    
    // 하고싶은 일 목록
    // -Data -> Track 목록으로 가져오고 싶다 [Track]
    // -Track 오브젝트를 만들어야 겠다.
    // -Data에서 struct로 파싱하고 싶다.
    // parsing은 받은 데이터를 우리가 원하는 형태로 변환시키는것
    //   -Json 파일, 데이터 -> 오브젝트로 만들때에 (Codable이용)
    //   -Response, Track 이렇게 두개 만들어야 겠다.
    
    // 해야할일
    // -Response, Track struct
    // - struct의 프로퍼티 이름과 실제 데이터의 키를 맞추기( Codable 디코딩 하기 위해서)
    // - 파싱하기 (Decoding)
    // 트랙리스트 가져오기
  
    // 파싱 및 트랙 가져오기
    
    do {
        let decoder = JSONDecoder()
        // 여기서 Resoponse.self의 의미는 Resoponse.self형태로 디코더 한다는 말이다.
        // try는 에러가 생기면 catch로 빠져나간다.
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        print(tracks[0].artistName)
        print("--> tracks: \(tracks.count)  -\(tracks.first?.title), \(tracks.last?.thumbnailPath)")
    } catch {
        print("---> error: \(resultString)")
    }
    
    
    
//    print("---> result : \(resultString)")
}
// 함수 실행
dataTask.resume()

// 이러한 결과들을 보려면 Postman에 가서 requestURL을 똑같이 붙여넣으면 변환된 dataTask 값이 그대로 나오게 됩니다.
