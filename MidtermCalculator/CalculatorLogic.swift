//
//  CalculatorLogic.swift
//  MidtermCalculator
//
//  Created by Isaac Benham on 4/16/15.
//  Copyright (c) 2015 Sarah Peltier. All rights reserved.
//

import Foundation

enum Operation: Int {
    case Plus = 0
    case Subtract = 1
    case Multiply = 2
    case Divide = 3
    
    func evaluateOperation(#firstValue: Float, secondValue:Float) -> Float{
        switch self{
        case .Plus:
            return firstValue + secondValue
        case .Subtract:
            return firstValue - secondValue
        case .Multiply:
            return firstValue * secondValue
        case .Divide:
            return firstValue / secondValue
        }
    }
}
typealias Node = (Operation, Float)

func walkTree(var nodes:[Node], initial:Float) -> Float {
    
    for node in nodes{
        switch node.0 {
        case .Plus:
            nodes.removeAtIndex(0)
            return initial + walkTree(nodes, node.1)
        case .Subtract:
            nodes.removeAtIndex(0)
            return initial - walkTree(nodes, node.1)
        default:
            nodes.removeAtIndex(0)
            return walkTree(nodes, node.0.evaluateOperation(firstValue: initial, secondValue:node.1))
        }
    }
    return initial
}
