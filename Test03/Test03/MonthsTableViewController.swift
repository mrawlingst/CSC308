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

class MonthsTableViewController: UITableViewController {
    // List of months
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var parentVC: TransactionNavigationViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        parentVC = (parent as! TransactionNavigationViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // How many rows for months (would have done 12 hardcoded but whatever)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    // Basically setting the text label of a new cell for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monthCell")
        
        cell!.textLabel!.text = months[indexPath.row]
        
        return cell!
    }
    
    // Perform segue when a row/month has been selected
    // Also save the selected month for later use
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentVC!.selectedMonth = months[indexPath.row]
        performSegue(withIdentifier: "toCategory", sender: (Any).self)
    }
}
