import UIKit

var initialTime = 0

class ViewController: UIViewController {

    @IBOutlet weak var initialTimeLabel: UILabel!
    @IBOutlet weak var initialStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialTimeLabel.text = "5 min"
    }
    
    @IBAction func initialStepperPressed(_ sender: UIStepper) {
        initialTimeLabel.text = String(Int(initialStepper.value)) + " min"
    }
    
    @IBAction func initialContinuePressed(_ sender: UIButton) {
        initialTime = Int(initialStepper.value)
    }
}

