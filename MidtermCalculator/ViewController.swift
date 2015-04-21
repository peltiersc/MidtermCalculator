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
            currentValue = 0
        } else {
            inputValue = nil
        }
        
        clearFlag = !clearFlag
    }
    
    @IBAction func handlePlusMinusTap(sender: UIButton) {
    
    }
    @IBAction func handlePercentButtonTap(sender: UIButton) {
    
    }
    @IBAction func handleOperationButtonTap(sender: UIButton) {
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
        if inputValue == 0 || inputValue == nil {
            inputValue = Float(input)
            inputString = "\(input)"
        } else {
            inputString += "\(input)"
            let intify = inputString.toInt()!
            inputValue = Float(intify)
        }
    }
    
    func evaluateCurrentExpression() {
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
    }

    func currentFromInput() {
        if currentValue == nil {
            currentValue = inputValue
        }
    }
}

