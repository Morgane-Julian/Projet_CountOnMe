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

       
    

}
