//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

enum ErrorMessage : String {
    case newCalcul = "Démarrez un nouveau calcul !"
    case incorrectExpression = "Entrez une expression correcte !"
    case operatorAlreadyHere = "Un operateur est déja mis !"
    case impossibleCalcul = "Impossible d'effectuer ce calcul, vérifiez votre saisie."
}

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operandButtons: [UIButton]!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var correctionButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    var calculManager = CalcManager()
    
    var elements: [String] {
        return self.textView.text.split(separator: " ").map { "\($0)" }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = ""
    }
    
    
    //MARK: View Actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if self.calculManager.expressionHaveResult(elements: elements) {
            self.textView.text = ""
        }
        if self.calculManager.isDivisionByZero(elements: elements, currentElement: numberText) {
            self.errorNotification(notif: .impossibleCalcul)
        } else {
            self.textView.text.append(numberText)
        }
    }

    @IBAction func tappedOperandButton(_ sender: UIButton) {
        guard let operandText = sender.title(for: .normal) else {
            return
        }
        if self.calculManager.expressionIsCorrectAndCanAddOperator(elements: elements) {
            self.textView.text.append(" \(operandText) ")
        } else {
            self.errorNotification(notif: .operatorAlreadyHere)
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard self.calculManager.expressionIsCorrectAndCanAddOperator(elements: elements) else {
            return errorNotification(notif: .incorrectExpression)
        }
        guard self.calculManager.expressionHaveEnoughElement(elements: elements) else {
            return errorNotification(notif: .newCalcul)
        }
        self.textView.text.append(" = \(calculManager.calculate(operationsToReduce: elements).first!)")
    }
    
    @IBAction func tappedCorrectionButton(_ sender: UIButton) {
        self.textView.deleteBackward()
    }
    
    @IBAction func tappedRefreshButton(_ sender: Any) {
        self.textView.text.removeAll()
    }
    
    //MARK: Errors Notifications
    func errorNotification(notif: ErrorMessage) {
        let alertVC = UIAlertController(title: "Zéro!", message: "\(notif.rawValue)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
        }
    
}
