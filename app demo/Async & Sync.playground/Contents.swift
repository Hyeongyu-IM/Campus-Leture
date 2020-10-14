import UIKit

//Queue - Main, Global, Custom

DispatchQueue.main.async {
    //UI update
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)  // color literal
}

// - Global
// qos를 성해주지않으면 알아서 시스템에서 순위를 결정한다.
DispatchQueue.global(qos: .userInteractive).async {
    //진짜 중요한것, 지금 당장 해야하는것
}

DispatchQueue.global(qos: .userInitiated).async {
    //거의 바로 해줘야 할것, 사용자가 결과를 기다린다.
}

DispatchQueue.global(qos: .default).async {
    //우선 순위를 신경안쓰겠다는 뜻
    // default라고 쓰는것보다 global() 이런식으로 쓰는게 낫다
}

DispatchQueue.global(qos: .utility).async {
    //시간이 좀 걸리는 일들 , 사용자가 당장 기다리지 않는것, 네트워킹, 큰파일 불러올때
}

DispatchQueue.global(qos: .background).async {
    //사용자한테 당장 인식될 필요가 없는 것들
    // 뉴스테이터 미리 받기, 위치 업데이트, 영상 다운받는 등
}

// - Custom Queue
let concurrntQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)

//복합적인 상황
func downloadImageFromServer() -> UIImage {
    //Heavy Task
    return UIImage()
}
func updateUI(image: UIImage){

}
DispatchQueue.global(qos: .background).async {
    // download
    let image = downloadImageFromServer()
    // ui쪽은 main큐로 넘겨주어야 한다. 크래시 가능성을 가짐
    DispatchQueue.main.async {
        updateUI(image: image)
    }
}

//Sync, Async

// Async

DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("Devil \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("Engel \(i)")
    }
}

// Sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("Devil \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("Engel \(i)")
    }
}
