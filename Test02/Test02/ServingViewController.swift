// Author: Michael Rawlings
// Date: 04/19/18
// CSC 308 - Test 02
// Description: An app that calculates total
//              calories in selected food with
//              given weight (in lbs and oz)

import UIKit

class ServingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // References for outlets
    @IBOutlet weak var servingPicker: UIPickerView!
    @IBOutlet weak var ounceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Only two columns for the picker (pound and ounce)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Pound is first (0) column - only 0 - 9 (10 rows)
    // Ounce is second (1) column - only 0 - 15 (16 rows)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? 10 : 16
    }
    
    // Set label of the row by their row's number
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    // Calculate the total ounces by converting pounds to ounces and add the remaining ounces
    // then display it on the label and save it in parent controller for future calculations
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let initialVC = (parent as! TabBarViewController)
        initialVC.totalOunces = (Int(servingPicker.selectedRow(inComponent: 0)) * 16) + Int(servingPicker.selectedRow(inComponent: 1))
        
        ounceLabel.text = "\(initialVC.totalOunces) ounces"
    }
}
