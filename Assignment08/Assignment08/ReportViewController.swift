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
    
    func calculateBMR() -> Float {
        let initialVC = parent as! TabBarViewController

        let age = initialVC.age
        let weight = initialVC.weight
        let height = initialVC.height
        
        var bmr = (10 * weight) + (6.25 * height) - (5 * Float(age))
        
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
