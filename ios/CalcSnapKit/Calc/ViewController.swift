//
//  ViewController.swift
//  Calc
//
//  Created by Farlei Heinen on 15/04/16.
//  Copyright © 2016 PaperKite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainDisplay: UILabel!
    @IBOutlet weak var valueA: UITextField!
    @IBOutlet weak var valueB: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainDisplay.text = "0.0"
        self.clearInputs()
    }
    
    func clearInputs() {
        
        self.valueA.text = ""
        self.valueB.text = ""
        self.valueA.becomeFirstResponder()
    }
    
    @IBAction func tapAdd(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA + varB)"
        self.clearInputs()
    }
    
    @IBAction func tapSub(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA - varB)"
        self.clearInputs()
    }
    
    @IBAction func tapMult(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA * varB)"
        self.clearInputs()
    }
    
    @IBAction func tapDiv(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA / varB)"
        self.clearInputs()
    }
}

