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

class CategoryTableViewController: UITableViewController {
    let categories = ["Food", "Grocery", "Transporation", "Education", "Entertainment", "Health"]

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

    // Only one section..
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    // Set label of the new cell for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")
        
        cell!.textLabel!.text = categories[indexPath.row]
        
        return cell!
    }
    
    // Perform segue and save selected category for later use (to search results)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentVC!.selectedCategory = categories[indexPath.row]
        performSegue(withIdentifier: "toResult", sender: (Any).self)
    }
}
