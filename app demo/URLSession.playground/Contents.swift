import UIKit

//URL

let urlString = "http://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)
//문자열 출력
url?.absoluteString
// 어떤방식으로 네트워크 통신을 하고있느냐
url?.scheme
// 메인주소
url?.host
// 뭘할건지
url?.path
//  요청을 보낼때 검색이라던지 쿼리들을 같이 묶어서 보낼수있다. 쿼리정보 출력
url?.query
//
url?.baseURL

// 기반이 되는 홈페이지를 만듬
let baseURL = URL(string: "https://itunes.apple.com")
// 부가적인 정보 제공 및 연관 기반 선택
// Gdragon을 한글로 쓰면 에러가 난다.
// 한글을 인식시키려면 인코딩을 해주어야한다. nil반환
// 중간에 검색어가 띄어쓰기가 들어간다면 nil반환
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)

relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL

//URLComponents
// 각각의 아이템을 객체로 접근하거나 추가할때 사용된다.
// 따라서 한글로 쿼리에 값을 전달해줄려면 URL컴포넌트를 쓰는게 좋다

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
// 이뒤에는 요청사항을 쿼리로 나누어서 나누어준다 쿼리의 조건은 위에서 & 로 구분할수있다 media,entity, term
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "Gdragon")
//let termQuery = URLQueryItem(name: "term", value: "지드래곤") 이렇게 써두면 아래코드를 구성할때 자동으로 인코딩되어서 이해할수 있는 언어로 컴파일된다.

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

urlComponents?.url //urlComponents?.url.scheme  // 이렇게 접근도 가능
urlComponents?.string
urlComponents?.queryItems   //urlComponents?.queryItems?.last?.value // 이렇게 접근도 가능
