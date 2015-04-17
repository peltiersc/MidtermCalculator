//
//  ViewController.swift
//  MidtermCalculator
//
//  Created by Brian Frutig on 4/16/15.
//  Copyright (c) 2015 Sarah Peltier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inputString = "0"
    var currentOperation:Operation? = nil
    var currentValue:Float = 0
    var inputValue:Float? = nil
    
    @IBAction func handleClearTap(sender: UIButton) {
    
    }
    
    @IBAction func handlePlusMinusTap(sender: UIButton) {
    
    }
    @IBAction func handlePercentButtonTap(sender: UIButton) {
    
    }
    @IBAction func handleOperationButtonTap(sender: UIButton) {
        currentOperation = Operation(rawValue: sender.tag)
        sender.layer.borderWidth = 5
    }
    @IBAction func handleNumericButtonTap(sender: UIButton) {
        
    }
    
    @IBAction func handleEqualsButtonTap(sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updatStringWithInput(input: String) {
        if currentValue == 0 {
            inputString = "\(input)"
        } else {
            inputString += "\(input)"
        }
    }


}

