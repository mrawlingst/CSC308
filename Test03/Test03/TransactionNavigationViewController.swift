// Author: Michael Rawlings
// Date: 05/04/18
// CSC 308 - Test 03 (Finals)
// Description: An app that tracks spending in year 2018.
//              - Saves info entered in spending scene
//                  to core data
//              - Navigation scene from Months -> Category
//                  -> Result and display all data relevant
//                  to the month and category picked
//              - The result page disaplys the amount and
//                  the note on each day in the month of the
//                  category

import UIKit

class TransactionNavigationViewController: UINavigationController {
    
    // Used to determine which month and category were picked during navigation
    var selectedMonth = ""
    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
