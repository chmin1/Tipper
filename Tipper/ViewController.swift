//
//  ViewController.swift
//  Tipper
//
//  Created by Chavane Minto on 6/20/17.
//  Copyright © 2017 Chavane Minto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var percent: UISegmentedControl!
    
    @IBOutlet weak var fhpercentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onScreenTap(_ sender: Any)
    {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any)
    {
        let tipPercentage = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0 //change text to double. if user enters non-numerics, default 0
        let tip = bill * tipPercentage[percent.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func onSliderChange(_ sender: UISlider)
    {
        let sliderValue = Double(sender.value)
        fhpercentage.text = String(format: "%.2f%%", sliderValue)
        let tipPercentage = sliderValue * 0.01
        let bill = Double(billField.text!) ?? 0 //change text to double. if user enters non-numerics, default 0
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

