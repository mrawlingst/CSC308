// Author: Michael Rawlings
// Date: 04/03/18
// CSC 308 - Assignment 07
// Description: An app that loads a wiki page of
//              a given item selected from the following:
//              - Plant
//                  - Beargrass
//                  - Dandelion
//                  - Hibiscus
//              - Animal
//                  - Bear
//                  - Elephant
//                  - Lion
//                  - Panda
//                  - Penguin
//                  - Wolf
//              Also loads an image in the background related to
//              selected item.
//              Text's color are also customizable in hexadecimal values

import UIKit

class PlantAnimalNameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var currentCategory = 0 // 0 - Plant, 1 - Animal
    var currentObject = 0
    
    @IBOutlet weak var plantAnimalPicker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let initialVC = presentingViewController as! ViewController
        currentCategory = initialVC.currentCategory
        currentObject = initialVC.currentObject
        
        plantAnimalPicker.selectRow(currentCategory, inComponent: 0, animated: false)
        plantAnimalPicker.selectRow(currentObject, inComponent: 1, animated: false)
        
        imageView.image = initialVC.images[initialVC.categories[currentCategory]![currentObject]] as? UIImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 2
        } else {
            let initialVC = presentingViewController as! ViewController
            return (initialVC.categories[plantAnimalPicker.selectedRow(inComponent: 0)]?.count)!
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            if row == 0 {
                return "Plant"
            } else {
                return "Animal"
            }
        } else {
            let initialVC = presentingViewController as! ViewController
            return (initialVC.categories[plantAnimalPicker.selectedRow(inComponent: 0)]?[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        plantAnimalPicker.reloadComponent(1)
        
        if component == 0 {
            currentCategory = row
        } else {
            currentObject = row
        }
        
        let initialVC = presentingViewController as! ViewController
        imageView.image = initialVC.images[initialVC.categories[currentCategory]![currentObject]] as? UIImage
    }
    
    @IBAction func dismissPlantAnimalChooser(_ sender: UIButton) {
        let initialVC = presentingViewController as! ViewController
        initialVC.currentCategory = currentCategory
        initialVC.currentObject = currentObject
        
        dismiss(animated: true, completion: nil)
    }
}
