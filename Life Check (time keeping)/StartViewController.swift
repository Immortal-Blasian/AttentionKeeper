import UIKit

var sessionTime = 0
var sessionProgress: Float = 0
var secondTime = 0
var timer = Timer()

class StartViewController: UIViewController {

    @IBOutlet weak var timeRemainingBar: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    var startButtonPressed = 0
    
    @IBAction func startPressed(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if sessionProgress != 1.0 {
                secondTime += 1
                sessionProgress = Float((Double(secondTime) / Double(initialTime * 60)))
                print(sessionProgress)
            } else {
                timer.invalidate()
                sessionTime += secondTime
                secondTime = 0
            }
        }
    }
}
