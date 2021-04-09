//
//  CalcManagerTestCase.swift
//  CountOnMeTests
//
//  Created by Symbioz on 01/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalcManagerTestCase: XCTestCase {
    
let calculManager = CalcManager()
    
    func testGivenTwoWhenAddTwoThenGiveFour() {
        let table = ["2","+","2"]
       
        XCTAssert(calculManager.calculate(operationsToReduce: table).first == "4.0")
    }

    func testGivenTwoWhenSubstractTwoThenGiveZero() {
        let table = ["2","-","2"]
       
        XCTAssert(calculManager.calculate(operationsToReduce: table).first == "0.0")
    }
    
    func testGivenTwoWhenMultiplicateTwoThenGiveFour() {
        let table = ["2","x","2"]
       
        XCTAssert(calculManager.calculate(operationsToReduce: table).first == "4.0")
    }
    
 func testGivenTwoWhenDividedTwoThenGiveOne() {
    let table = ["2","/","2"]
   
    XCTAssert(calculManager.calculate(operationsToReduce: table).first == "1.0")
}
    
    func testAditionAndMultiplication() {
        let table = ["2","+","2","x","4"]
       
        XCTAssert(calculManager.calculate(operationsToReduce: table).first == "10.0")
    }
    
    func testAditionAndSubstraction() {
        let table = ["2","+","2","-","1"]
       
        XCTAssert(calculManager.calculate(operationsToReduce: table).first == "3.0")
    }
    
    func testAditionAndSubstractionAndMultiplicationAndDivision() {
        let table = ["2","+","2","x","4","-","5","/","2"]
       
        XCTAssert(calculManager.calculate(operationsToReduce: table).first == "7.5")
    }
    
    func testPositiveNumberAndNegativeNumber() {
        let table = ["2","-","4"]
       
        XCTAssert(calculManager.calculate(operationsToReduce: table).first == "-2.0")
    }
    
    func testAddTwoOperand() {
        let table = ["2","+"]
        XCTAssert(calculManager.expressionIsCorrectAndCanAddOperator(elements: table) == false)
    }
    
    func testExpressionIsCorrectAndCanAddOperator() {
        let table = ["2","+","2","-","1","x","1","/","1"]
        XCTAssert(calculManager.expressionIsCorrectAndCanAddOperator(elements: table) == true)
    }
    
    func testExpressionHaveEnoughElementsTrue() {
        let table = ["2","x","3"]
        XCTAssert(calculManager.expressionHaveEnoughElement(elements: table) == true)
    }
    
    func testExpressionHaveEnoughElementsFalse() {
        let table = ["2","x"]
        XCTAssert(calculManager.expressionHaveEnoughElement(elements: table) == false)
    }
    
    func testExpressionHaveResultFalse() {
        let table = ["2","x","3"]
        XCTAssert(calculManager.expressionHaveResult(elements: table) == false)
    }
    
    func testExpressionHaveResultTrue() {
        let table = ["2","x","3","=","6"]
        XCTAssert(calculManager.expressionHaveResult(elements: table) == true)
    }
    
    func testIsDivisionByZero() {
        let table = ["2","/"]
        let currentElement = "0"
        
        XCTAssert(calculManager.isDivisionByZero(elements: table, currentElement: currentElement) == true)
    }

}
