// Author: Michael Rawlings

import UIKit

class ReportViewController: UIViewController {
    @IBOutlet weak var reportLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reportLabel.text = String(calculateBMR())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Calculate and return the resulting BMR
    func calculateBMR() -> Float {
        let initialVC = parent as! TabBarViewController

        let age = initialVC.age
        let weight = initialVC.weight
        let height = initialVC.height
        
        // Swift doesnt seem to support PEMDAS in one line
        var bmr = 10 * weight
        bmr += 6.25 * height
        bmr -= 5 * Float(age)
        
        // Male
        if initialVC.gender == 0 {
            bmr += 5
        }
        //Female
        else {
            bmr -= 161
        }
        
        return bmr
    }
}
