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
    var inputValue:Float? = 0
    var clearFlag = false
    var decimalFlag = false
    var decimalCount:Int = 0
    
    @IBAction func handleClearTap(sender: UIButton) {
        if clearFlag {
            inputValue = 0
            currentValue = 0
        } else {
            inputValue = 0
        }
    }
    
    @IBAction func handlePlusMinusTap(sender: UIButton) {
    
    }
    @IBAction func handlePercentButtonTap(sender: UIButton) {
    
    }
    @IBAction func handleOperationButtonTap(sender: UIButton) {
        currentOperation = Operation(rawValue: sender.tag)
        if (inputValue != nil) {
            currentValue = inputValue!
            inputValue = nil
        }
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
    
    func updateInputValueAndString(input: Int) {
        if inputValue == 0 || inputValue == nil {
            inputValue = Float(input)
            inputString = "\(inputValue)"
        } else {
            inputString += "\(input)"
            let intify = inputString.toInt()!
            inputValue = Float(intify)
        }
    }


}

