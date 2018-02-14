//
//  ViewController.swift
//  Assignment02
//
//  Created by Michael Rawlings on 2/8/18.
//  Copyright © 2018 cs.eku.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let destinations = [
        "Lexington": ["Keeneland", "Arborteum"],
        "Chengdu": ["Panda", "Pedestrain Street"],
        "Chicago": ["Millennium Park", "Skydeck", "Cruise", "Planetarium"],
        "Hongkong": ["Disneyland", "Ocean Park", "The Peak"]
    ]
    
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
//        print("test")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cityChanged(_ sender: UISegmentedControl) {
//        print(citySegmentedControl.titleForSegment(at: citySegmentedControl.selectedSegmentIndex)!)
        let selected: String = citySegmentedControl.titleForSegment(at: citySegmentedControl.selectedSegmentIndex)!
        locationSegmentedControl.removeAllSegments()
        for (index, element) in (destinations[selected]?.enumerated())! {
//            print(element)
            locationSegmentedControl.insertSegment(withTitle: element, at: index, animated: false)
        }
        locationSegmentedControl.selectedSegmentIndex = 0
        imageView.image = images[selected]?[0]
        destinationLabel.text = selected + ": " + (destinations[selected]?[0])!
    }

    @IBAction func locationChanged(_ sender: UISegmentedControl) {
        let selected: String = citySegmentedControl.titleForSegment(at: citySegmentedControl.selectedSegmentIndex)!
        let index: Int = locationSegmentedControl.selectedSegmentIndex
        imageView.image = images[selected]?[index]
        destinationLabel.text = selected + ": " + (destinations[selected]?[index])!
    }
}

