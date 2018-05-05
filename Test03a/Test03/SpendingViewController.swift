import UIKit
import CoreData

class SpendingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var datePicker: UIPickerView!
    
    let managedOjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    let categories = ["Food", "Grocery", "Transporation", "Education", "Entertainment", "Health"]
    
    var currentMonth = 0
    var currentDay = 0
    var currentCategory = "Food"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Two columns - month : day
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 2
        } else {
            return 1
        }
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            datePicker.reloadComponent(1)
            
            currentMonth = datePicker.selectedRow(inComponent: 0)
            currentDay = datePicker.selectedRow(inComponent: 1)
        } else {
            currentCategory = categories[row]
        }
    }
    
    @IBAction func saveTransaction(_ sender: UIButton) {
        let entityDescription = NSEntityDescription.entity(forEntityName: "Transaction", in: managedobjectcontext)
    }
    
    @IBAction func dismissKeyboard(_ sender: UIButton) {
        self.view.endEditing(true)
    }
}
