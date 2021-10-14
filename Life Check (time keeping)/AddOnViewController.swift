import UIKit

var addOnTime = 0

class AddOnViewController: UIViewController {

    @IBOutlet weak var addOnStepper: UIStepper!
    @IBOutlet weak var addOnTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addOnStepperPressed(_ sender: Any) {
        addOnTimeLabel.text = String(Int(addOnStepper.value)) + " min"
    }
    
    @IBAction func addOnContinuePressed(_ sender: UIButton) {
        addOnTime = Int(addOnStepper.value)
    }
}
