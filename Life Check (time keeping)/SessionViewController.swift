import UIKit

class SessionViewController: UIViewController {
    
    @IBOutlet weak var sessionResultLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval((initialTime * 60)), repeats: false) { _ in
            sessionTime += secondTime
            self.sessionResultLabel.alpha = 1
            self.sessionResultLabel.text = "Nice! You've worked for \(secondTime / 60) minutes! You should keep going!"
            self.cancelButton.alpha = 0
            self.noButton.setTitle("Finish", for: .normal)
            self.noButton.alpha = 1
            self.yesButton.setTitle("Add Time", for: .normal)
            self.yesButton.alpha = 1
        }
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        cancelButton.alpha = 0
        yesButton.alpha = 1
        yesButton.setTitle("Yes", for: .normal)
        noButton.alpha = 1
        noButton.setTitle("No", for: .normal)
        sessionResultLabel.alpha = 1
        sessionResultLabel.text = "Are you sure?"
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
        if noButton.currentTitle == "No" {
            noButton.alpha = 0
            yesButton.alpha = 0
            cancelButton.alpha = 1
            sessionResultLabel.alpha = 0
        } else {
            self.performSegue(withIdentifier: "toSessionResult", sender: nil)
        }
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        if yesButton.currentTitle == "Yes" {
            self.performSegue(withIdentifier: "toSessionResult", sender: nil)
        } else {
            yesButton.alpha = 0
            noButton.alpha = 0
            sessionResultLabel.alpha = 0
            cancelButton.alpha = 1
            secondTime = 0
            sessionProgress = 0
            timer.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if sessionProgress != 1.0 {
                    secondTime += 1
                    sessionProgress = Float((Double(secondTime) / Double(addOnTime * 60)))
                    print(sessionProgress)
                } else {
                    sessionTime += secondTime
                    self.sessionResultLabel.alpha = 1
                    self.sessionResultLabel.text = "Nice! You've worked for \(secondTime / 60) minutes! You should keep going!"
                    self.cancelButton.alpha = 0
                    self.noButton.setTitle("Finish", for: .normal)
                    self.noButton.alpha = 1
                    self.yesButton.setTitle("Add Time", for: .normal)
                    self.yesButton.alpha = 1
                }
            }
        }
    }
}
