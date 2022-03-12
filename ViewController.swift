//
//  ViewController.swift
//  Space Age
//
//  Created by Brendan Moran on 10/2/17.
//  Copyright © 2017 Brendan Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //properties, variables, etc
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var planetPicker: UIPickerView!
    var selectedPlanet = Planet()
    var count: Int = 0;
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //actions, event listener
    @IBAction func showCalculation(_ sender: Any) {
        if let age = userInput.text {
            if age != "" {
                userInput.text = ""
                calculationLabel.text = "You are \(selectedPlanet.convertEarthYearsToPlanetYears(Double(age)!)) \(selectedPlanet.demonym) years old!"
            } else {
                calculationLabel.text = "Please enter your age."
            }
        
        }
    }
    
    //UIPickerView Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return planets.count
    }
    
    //UIPickerView Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return planets[row].name //row selects an element in the array, which element is of type Planet() which contains properties name, demonym, orbitalRatio
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPlanet = planets[row]
        userInput.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = planets[row].name
        let color = UIColor(red: 1, green: 253/255, blue: 225/255, alpha: 1)
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font: UIFont(name: "Futura", size: 26.0)!, NSAttributedStringKey.foregroundColor:color])
        return myTitle
    }
    
    @IBAction func tapOnPicker(_ sender: Any) {
        userInput.resignFirstResponder()
    }
    
}



