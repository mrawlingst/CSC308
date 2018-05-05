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

class SpendingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // Just references
    @IBOutlet weak var datePicker: UIPickerView!
    @IBOutlet var textFields: [UITextField]!
    
    // Used to save data to core data
    let managedOjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // To set up picker wheel
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    // To set up picker wheel
    let categories = ["Food", "Grocery", "Transporation", "Education", "Entertainment", "Health"]
    
    // Used to save info to core data
    var currentMonth = 0
    var currentDay = 0
    var currentCategory = "Food"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Using tag to determine which picker wheel is being used
    // 0 - date
    // 1 - category
    // 2 comps for date picker - month : date
    // 1 comp for category picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    // Determine the number of rows for given picker and active month (for date month)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            if component == 0 {
                return 12
            } else {
                return daysInMonth[datePicker.selectedRow(inComponent: 0)]
            }
        } else {
            return categories.count
        }
    }
    
    // Set label for each row in each component (days are dynamic as month are selected)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            if component == 0 {
                return months[row]
            } else {
                return String(row + 1)
            }
        } else {
            return categories[row]
        }
    }
    
    // Perform action when a row has been selected, intended to update days column when a month has been picked
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            datePicker.reloadComponent(1)
            
            currentMonth = datePicker.selectedRow(inComponent: 0)
            currentDay = datePicker.selectedRow(inComponent: 1)
        } else {
            currentCategory = categories[row]
        }
    }
    
    // Save data to core data when add button has been clicked
    @IBAction func saveTransaction(_ sender: UIButton) {
        for tf in textFields {
            if tf.text! == "" {
                return
            }
        }
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Transactions", in: managedOjectContext)
        let transaction = Transactions(entity: entityDescription!, insertInto: managedOjectContext)
        transaction.month = months[currentMonth]
        transaction.day = Int16(currentDay + 1)
        transaction.category = currentCategory
        transaction.amount = Double(textFields[0].text!)!
        transaction.note = textFields[1].text!
        
        do {
            try managedOjectContext.save()
            
            for tf in textFields {
                tf.text = ""
            }
        } catch _ {
            return
        }
    }
    
    // Used to dismiss keyboard when user clicks outside editbox/keyboard
    @IBAction func dismissKeyboard(_ sender: UIButton) {
        self.view.endEditing(true)
    }
}

