//
//  ViewControllerTestCase.swift
//  CountOnMeTests
//
//  Created by Symbioz on 02/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class ViewControllerTestCase: XCTestCase {

    var controller = ViewController()
    
    override func setUp() {
            super.setUp()

            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            controller = storyboard.instantiateInitialViewController() as! ViewController
        }

    
    func testTappedNumberButton() {
        let _ = controller.view
        controller.numberButtons.last?.sendActions(for: .touchUpInside)
        let button = controller.numberButtons.last
        
        XCTAssert(controller.textView.text.contains((button?.title(for: .normal))!))
    }
    
    func testGivenNumberWhenOperatorThenErrorNotification() {
        let _ = controller.view
        controller.numberButtons.last?.sendActions(for: .touchUpInside)
        let button = controller.numberButtons.last?.currentTitle
        controller.textView.text.append(button!)
        
        controller.operandButtons.last?.sendActions(for: .touchUpInside)
        let operandButton = controller.operandButtons.last?.title(for: .normal)
        controller.textView.text.append(operandButton!)
        
        XCTAssert(controller.tappedOperandButton(controller.operandButtons.last!) == controller.errorNotification(notif: .operatorAlreadyHere))
    }
    
    func testGivenCalculWhenTapOnEqualThenTextViewAppendEqualSignAndProgramDoTheCalc() {
        let _ = controller.view
        
        
        controller.numberButtons.last?.sendActions(for: .touchUpInside)
        let button = controller.numberButtons.first?.currentTitle
        controller.textView.text.append(button!)
        
        controller.operandButtons.last?.sendActions(for: .touchUpInside)
        let operandButton = controller.operandButtons.first?.title(for: .normal)
        controller.textView.text.append(operandButton!)
       
        XCTAssert(controller.tappedEqualButton(controller.equalButton) == controller.errorNotification(notif: .correctExpression))
    }
    
    func testGivenElementsWhenTappedCorrectionButtonThenLastElementIsDelete() {
        let _ = controller.view
        
        
        controller.numberButtons.last?.sendActions(for: .touchUpInside)
        let button = controller.numberButtons.first?.currentTitle
        controller.textView.text.append(button!)
        
        XCTAssert(controller.tappedCorrectionButton(controller.correctionButton) == controller.textView.deleteBackward())
    }
    
    func testGivenElementsWhenTappedRefreshButtonThenElementsAreDeleted() {
        let _ = controller.view
        
        
        controller.numberButtons.last?.sendActions(for: .touchUpInside)
        let button = controller.numberButtons.first?.currentTitle
        controller.textView.text.append(button!)
        
        controller.operandButtons.last?.sendActions(for: .touchUpInside)
        let operandButton = controller.operandButtons.first?.title(for: .normal)
        controller.textView.text.append(operandButton!)
        
        XCTAssert(controller.tappedRefreshButton(controller.refreshButton!) == controller.textView.text.removeAll())
    }

}
