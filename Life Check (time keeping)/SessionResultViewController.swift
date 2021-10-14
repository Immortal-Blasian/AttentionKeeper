import UIKit

class SessionResultViewController: UIViewController {
    
    @IBOutlet weak var sessionResultLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        timer.invalidate()
        sessionResultLabel.text = "You have worked for \(sessionTime) minutes!"
    }
    @IBAction func backbuttonPressed(_ sender: UIButton) {
    }
}
