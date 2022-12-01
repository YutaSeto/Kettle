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
        if waterAmount > 0 && waterAmount <= 200{
            timer = Timer.scheduledTimer(timeInterval: 1,target: self,selector: #selector(countup),userInfo: nil,repeats: true)
        }else if waterAmount > 200 && waterAmount <= 400{
            timer = Timer.scheduledTimer(timeInterval: 2,target: self,selector: #selector(countup),userInfo: nil,repeats: true)
        }else if waterAmount > 400 && waterAmount <= 600{
            timer = Timer.scheduledTimer(timeInterval: 3,target: self,selector: #selector(countup),userInfo: nil,repeats: true)
        }else if waterAmount > 600 && waterAmount <= 800{
            timer = Timer.scheduledTimer(timeInterval: 4,target: self,selector: #selector(countup),userInfo: nil,repeats: true)
        }else if waterAmount > 800 && waterAmount <= 1000{
            timer = Timer.scheduledTimer(timeInterval: 5,target: self,selector: #selector(countup),userInfo: nil,repeats: true)
        }else if waterAmount > 1000 && waterAmount <= 1200{
            timer = Timer.scheduledTimer(timeInterval: 6,target: self,selector: #selector(countup),userInfo: nil,repeats: true)
        }else{
            print("水量に不備がある")
        }
    }

    @objc func countup() {
        waterTemperature += 10
        print("温度は\(waterTemperature)度です")
        if waterTemperature >= 100 {
            print("(100度になったので動作を止める)")
            timer?.invalidate()
        }
    }
}
