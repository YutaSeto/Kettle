import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//水温の変数設定 0<x<=100
//水量の変数設定 0<y<=1200
//スイッチを入れると時間によって温度が上がる
//水温が100度になったらタイマーが止まる
//水量によってかかる時間が変わる。

class Alarm {
    var timer: Timer?
    var count: Int = 0
    var limit: Int = 5
    
    func start() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countup),
            userInfo: nil,
            repeats: true )
    }

    @objc func countup() {
        count += 1
        print("カウントは\(count)です")
        if limit <= count {
            print("ジリリリリ！(カウントをストップします)")
            timer?.invalidate()
        }
    }
}
