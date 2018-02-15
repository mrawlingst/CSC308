// Author: Michael Rawlings
// Date: 02/15/18
// CSC 308 - Assignment 02
// Description: A travel guide application that advise
//          the tourist attractions of cities.
//          The following cities are available:
//              - Lexington
//              - Chengdu
//              - Chicago
//              - Hongkong

import UIKit

class ViewController: UIViewController {
    // Dictionary of attractions for each city
    let destinations = [
        "Lexington": ["Keeneland", "Arborteum"],
        "Chengdu": ["Panda", "Pedestrain Street"],
        "Chicago": ["Millennium Park", "Skydeck", "Cruise", "Planetarium"],
        "Hongkong": ["Disneyland", "Ocean Park", "The Peak"]
    ]
    
    // Dictionary of images for each city
    let images = [
        "Lexington": [#imageLiteral(resourceName: "keeneland"), #imageLiteral(resourceName: "arboretum")],
        "Chengdu": [#imageLiteral(resourceName: "panda"), #imageLiteral(resourceName: "pedestrain_street")],
        "Chicago": [#imageLiteral(resourceName: "millennium_park"), #imageLiteral(resourceName: "skydeck"), #imageLiteral(resourceName: "cruise"), #imageLiteral(resourceName: "planetarium")],
        "Hongkong": [#imageLiteral(resourceName: "disneyland"), #imageLiteral(resourceName: "ocean_park"), #imageLiteral(resourceName: "the_peak")]
    ]
    
    @IBOutlet weak var citySegmentedControl: UISegmentedControl!
    @IBOutlet weak var locationSegmentedControl: UISegmentedControl!

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Fired when city segemented control is interacted with
    @IBAction func cityChanged(_ sender: UISegmentedControl) {
        // Get the current selected city
        let selected: String = citySegmentedControl.titleForSegment(at: citySegmentedControl.selectedSegmentIndex)!
        
        // Clear all segments and install new segments based on the current selected city
        locationSegmentedControl.removeAllSegments()
        for (index, element) in (destinations[selected]?.enumerated())! {
            locationSegmentedControl.insertSegment(withTitle: element, at: index, animated: false)
        }
        
        // Update selected index for updated segmented control
        locationSegmentedControl.selectedSegmentIndex = 0
        
        // Display picture based on selected city/attraction
        imageView.image = images[selected]?[0]
        
        // Update label to reflect the selected city/attract
        destinationLabel.text = selected + ": " + (destinations[selected]?[0])!
    }
    
    // Fired when attraction segment control is interacted with
    @IBAction func locationChanged(_ sender: UISegmentedControl) {
        let selected: String = citySegmentedControl.titleForSegment(at: citySegmentedControl.selectedSegmentIndex)!
        let index: Int = locationSegmentedControl.selectedSegmentIndex
        
        // Update image and label based on current selected attraction
        imageView.image = images[selected]?[index]
        destinationLabel.text = selected + ": " + (destinations[selected]?[index])!
    }
}

