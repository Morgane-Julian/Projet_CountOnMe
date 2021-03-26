//
//  CalcManager.swift
//  CountOnMe
//
//  Created by Symbioz on 17/03/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalcManager {
    
    //MARK: Règles de calcul - Vérifie que toutes les règles soient respectées avant de calculer
    func expressionIsCorrectAndCanAddOperator(elements: [String]) -> Bool {
        guard elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "*"
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
    
    
    //MARK: Calculs
    var resultat = 0
    
    func calculate(operationsToReduce: [String]) -> [String] {
        var table = operationsToReduce
        while table.count > 1 {
            let left = Int(table[0])!
            let operand = table[1]
            let right = Int(table[2])!
            
            
            switch operand {
            case "+": resultat = left + right
            case "-": resultat = left - right
            case "x": resultat = left * right
            case "/": resultat = left / right
            default: fatalError("Unknown operator !")
            }
           
            table = Array(table.dropFirst(3))
            table.insert("\(resultat)", at: 0)
        }
        return table
    }
}

// Ajouter les prio de calculs
// Si un opérateur est égal à x ou / effectue ces opérations en premier

