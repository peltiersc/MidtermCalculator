//
//  ViewController.swift
//  MidtermCalculator
//
//  Created by Brian Frutig on 4/16/15.
//  Copyright (c) 2015 Sarah Peltier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    typealias Node = (Operation, Float)
    
    var inputString = "0"
    var currentOperation:Operation?
    var currentValue:Float?
    var inputValue:Float?
    var clearFlag = false
    var decimalFlag = false
    var honorOoO = false
    var decimalCount:Int = 0
    var operationQueue = [Node]()
    
    @IBAction func handleClearTap(sender: UIButton) {
        if clearFlag {
            inputValue = nil
            currentValue = nil
            clearFlag = false
            inputString = "0"
        } else {
            inputValue = nil
            inputString = "0"
            clearFlag = true
        }
        
        
    }
    
    @IBAction func handleDecimalButtonTap(sender: UIButton) {
        decimalFlag = true
        if decimalCount == 0 {
            decimalCount++
        }
    }
    
    @IBAction func handlePlusMinusTap(sender: UIButton) {
        if currentValueIsDisplayed() {
            currentValue! -= currentValue! * 2
            updateDisplayWithCurrent()
        } else {
            if inputValue != nil {
                inputValue! -= inputValue! * 2
                updateDisplayWithInput()
            }
        }
    }
    @IBAction func handlePercentButtonTap(sender: UIButton) {
        if currentValueIsDisplayed() {
            currentValue! /= 100
            updateDisplayWithCurrent()
        } else {
            if inputValue != nil {
                inputValue! /= 100
                updateDisplayWithInput()
            }
        }
    }
    @IBAction func handleOperationButtonTap(sender: UIButton) {
        decimalFlag = false
        decimalCount = 0
        let newOp = Operation(rawValue: sender.tag)!
        if currentOperation != nil {
            if inputValue != nil {
                operationQueue.append((currentOperation!, inputValue!))
               
            }
        } else {
            if currentValue == nil {
                self.currentFromInput()
            }
        }
        
        self.resolveQueue()
        
        currentOperation = newOp
        inputValue = nil
        
        sender.layer.borderWidth = 2
    }
    @IBAction func handleNumericButtonTap(sender: UIButton) {
        self.updateInputValueAndString(sender.tag)
    }
    
    @IBAction func handleEqualsButtonTap(sender: UIButton) {
        if currentOperation != nil && inputValue != nil {
            operationQueue.append((currentOperation!, inputValue!))
        }
        self.evaluateCurrentExpression()
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
        println("update called")
        if inputValue == 0 || inputValue == nil {
            inputValue = Float(input)
            inputString = "\(input)"
            println("inputVal: \(inputValue)")
        } else {
            self.formatInputString("\(input)")
            self.formatInputValue()
            println("inputString: \(inputString)")
            println("inputVal: \(inputValue)")
        }
    }
    
    func evaluateCurrentExpression() {
        if currentValue == nil {
            currentValue = inputValue != nil ? inputValue : 0
        }
        
        currentValue = walkTree(operationQueue, currentValue!)
        inputString = "\(currentValue)"
        println("\(currentValue)")
        self.clearCurrentAndQueue()
    }
    
    func resolveQueue() {
        if !honorOoO {
            if operationQueue.isEmpty == false {
                 self.evaluateCurrentExpression()
            }
        }
    }
    
    func clearCurrentAndQueue() {
        currentOperation = nil
        inputValue = nil
        operationQueue = [Node]()
        decimalCount = 0
        decimalFlag = false
    }

    func currentFromInput() {
        if currentValue == nil {
            currentValue = inputValue
        }
    }
    
    func formatInputString(input: String) {
        if decimalFlag {
            if decimalCount == 1 {
                inputString += ".\(input)"
                decimalCount++
            } else {
                inputString += input
                decimalCount++
            }
        } else {
            inputString += input
        }
    }
    
    
    func formatInputValue() {
        let aMorePowerfulString = inputString as NSString
        inputValue = aMorePowerfulString.floatValue
    }
    
    func currentValueIsDisplayed() -> Bool {
        if currentValue != nil {
            let cvString =  "\(currentValue)"
            return cvString == inputString
        }
        return false
    }
    
    func updateDisplayWithCurrent() {
        inputString = "\(currentValue)"
    }
    
    func updateDisplayWithInput(){
        inputString = "\(inputValue)"
    }
}

