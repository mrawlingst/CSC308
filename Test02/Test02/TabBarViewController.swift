// Author: Michael Rawlings
// Date: 04/19/18
// CSC 308 - Test 02
// Description: An app that calculates total
//              calories in selected food with
//              given weight (in lbs and oz)

import UIKit

class TabBarViewController: UITabBarController {
    // Used to hold the total oz for future calculations
    var totalOunces: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
