//
//  CalcManager.swift
//  CountOnMe
//
//  Created by Symbioz on 17/03/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalcManager {
    
    //MARK: Calculation rules
    
    func expressionIsCorrectAndCanAddOperator(elements: [String]) -> Bool {
        guard elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "x"
        else { return false }
        return true
    }
    
    func expressionHaveEnoughElement(elements: [String]) -> Bool {
        guard elements.count >= 3
        else { return false }
        return true
    }
    
    func expressionHaveResult(elements: [String]) -> Bool {
        guard elements.firstIndex(of: "=") != nil
        else { return false }
        return true
    }
    
    func indexOfPrioOperand(table: [String]) -> Int? {
        for element in table {
            if element == "x" || element == "/" {
                return table.firstIndex(of: element)
            }
        }
        return nil
    }
    
    func isDivisionByZero(elements: [String], currentElement: String ) -> Bool {
        if elements.last == "/" && currentElement == "0" {
                return true
        } else {
            return false
        }
    }
    
    
    //MARK: Calculation
    
    var resultat = 0.0
    
    func calculate(operationsToReduce: [String]) -> [String] {
        var table = operationsToReduce
        
        while table.count > 1 {
            
            var leftIndex = 0
            var operandIndex = 1
            var rightIndex = 2
            
            if let index = indexOfPrioOperand(table: table) {
                leftIndex = index - 1
                operandIndex = index
                rightIndex = index + 1
            }
            
            let left = Double(table[leftIndex])!
            let operand = table[operandIndex]
            let right = Double(table[rightIndex])!
            
            switch operand {
            case "+": resultat = left + right
            case "-": resultat = left - right
            case "x": resultat = left * right
            case "/": resultat = left / right
            default: fatalError("Unknown operator !")
            }
            
            table.removeSubrange(leftIndex...rightIndex)
            table.insert("\(resultat)", at: leftIndex)
        }
        return table
    }
}
