import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//水温の変数設定 0<x<=100
//水量の変数設定 0<y<=1200
//スイッチを入れると時間によって温度が上がる
//水温が100度になったらタイマーが止まる
//水量によってかかる時間が変わる。


var waterTemperature: Int = 20 //0<x<=100度
var waterAmount: Int = 0 //0<y<=1200 ml

class Alarm {
    var timer: Timer?
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1,target: self,selector: #selector(countup),userInfo: nil,repeats: true )
    }

    @objc func countup() {
        waterTemperature += 10
        print("カウントは\(waterTemperature)度です")
        if limit <= count {
            print("(100度になったので動作を止める)")
            timer?.invalidate()
        }
    }
}
