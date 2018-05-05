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
import CoreData

class TransactionListViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    let managedOjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var month = ""
    var category = ""
    
    var results: [Transactions]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let parentVC = (parent as! TransactionNavigationViewController)
        month = parentVC.selectedMonth
        category = parentVC.selectedCategory
        
        queryData()
        displayResults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func queryData() {
        // Create a request to fetch data matching the month and category user picked
        let fetchRequest = NSFetchRequest<Transactions>(entityName: "Transactions")
        fetchRequest.predicate = NSPredicate(format: "month == %@ AND category == %@", month, category)
        
        do {
            // Save the results that has been fetched for later use
            results = try managedOjectContext.fetch(fetchRequest)
        } catch {
            return
        }
    }
    
    func displayResults() {
        // Basic approach to listing all results
        var txt = "Spending on \(category) in \(month):\n"
        
        for r in results! {
            let day = r.value(forKey: "day")!
            let amount = r.value(forKey: "amount")!
            let note = r.value(forKey: "note")!
            txt += "\(month) \(day): $\(amount) \(note)"
            txt += "\n"
        }
        
        resultLabel.text = txt
    }
}
