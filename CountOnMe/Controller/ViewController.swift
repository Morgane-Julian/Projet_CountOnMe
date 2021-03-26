//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    var calculManager = CalcManager()
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = ""
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if calculManager.expressionHaveResult(elements: elements) {
            textView.text = ""
        }
        textView.text.append(numberText)
    }
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculManager.expressionIsCorrectAndCanAddOperator(elements: elements) {
            textView.text.append(" + ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculManager.expressionIsCorrectAndCanAddOperator(elements: elements) {
            textView.text.append(" - ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    @IBAction func tappedMultiplicationButton(_ sender: Any) {
        if calculManager.expressionIsCorrectAndCanAddOperator(elements: elements) {
            textView.text.append(" x ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    @IBAction func tappedDivisionButton(_ sender: Any) {
        if calculManager.expressionIsCorrectAndCanAddOperator(elements: elements) {
            textView.text.append(" / ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculManager.expressionIsCorrectAndCanAddOperator(elements: elements) else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard calculManager.expressionHaveEnoughElement(elements: elements) else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        textView.text.append(" = \(calculManager.calculate(operationsToReduce: elements).first!)")
    }
    @IBAction func tappedRefreshButton(_ sender: UIButton) {
        textView.deleteBackward()
    }
    @IBAction func tappedSeparatorButton(_ sender: Any) {
        // rajouter une virgule en vérifiant que la dernière saisie soit un chiffre.
    }
    
    
}
