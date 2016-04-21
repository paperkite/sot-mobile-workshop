//
//  ViewController.swift
//  Calc
//
//  Created by Farlei Heinen on 15/04/16.
//  Copyright © 2016 PaperKite. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var mainDisplay: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(35)
        label.textAlignment = .Right
        label.textColor = UIColor.whiteColor()
        
        return label
    }()
    
    lazy var valueA: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .RoundedRect
        textField.backgroundColor = UIColor.whiteColor()
        return textField
    }()
    
    lazy var valueB: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .RoundedRect
        textField.backgroundColor = UIColor.whiteColor()
        return textField
    }()
    
    lazy var valueALabel: UILabel = {
        let valueALabel = UILabel(frame: CGRectZero)
        valueALabel.numberOfLines = 1
        valueALabel.text = "value A"
        return valueALabel
    }()
    
    lazy var valueBLabel: UILabel = {
        let valueBLabel = UILabel(frame: CGRectZero)
        valueBLabel.numberOfLines = 1
        valueBLabel.text = "value B"
        return valueBLabel
    }()
    
    lazy var stackView : UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .FillEqually
        stackView.spacing = 3
        return stackView
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton(type: UIButtonType.Custom)
        addButton.backgroundColor = UIColor.darkGrayColor()
        addButton.titleLabel?.font = UIFont.systemFontOfSize(50)
        addButton.setTitle("+", forState: .Normal)
        addButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addButton.addTarget(self, action: #selector(ViewController.tapAdd(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return addButton
    }()
    
    
    lazy var subButton: UIButton = {
        let subButton = UIButton(type: UIButtonType.Custom)
        subButton.backgroundColor = UIColor.darkGrayColor()
        subButton.titleLabel?.font = UIFont.systemFontOfSize(50)
        subButton.setTitle("-", forState: .Normal)
        subButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        subButton.addTarget(self, action: #selector(ViewController.tapSub(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return subButton
    }()
    
    lazy var multButton: UIButton = {
        let multButton = UIButton(type: UIButtonType.Custom)
        multButton.titleLabel?.font = UIFont.systemFontOfSize(50)
        multButton.backgroundColor = UIColor.darkGrayColor()
        multButton.setTitle("×", forState: .Normal)
        multButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        multButton.addTarget(self, action: #selector(ViewController.tapMult(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return multButton
    }()
    
    lazy var divButton: UIButton = {
        let divButton = UIButton(type: UIButtonType.Custom)
        divButton.titleLabel?.font = UIFont.systemFontOfSize(50)
        divButton.backgroundColor = UIColor.darkGrayColor()
        divButton.setTitle("×", forState: .Normal)
        divButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        divButton.addTarget(self, action: #selector(ViewController.tapDiv(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return divButton
    }()
    
    lazy var infoButton: UIButton = {
        let infoButton = UIButton(type: UIButtonType.InfoDark)
        infoButton.addTarget(self, action: #selector(ViewController.tapInfo(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return infoButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGrayColor()
        
        self.view.addSubview(self.mainDisplay)
        self.view.addSubview(self.valueALabel)
        self.view.addSubview(self.valueBLabel)
        self.view.addSubview(self.valueA)
        self.view.addSubview(self.valueB)
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.addButton)
        self.stackView.addArrangedSubview(self.subButton)
        self.stackView.addArrangedSubview(self.multButton)
        self.stackView.addArrangedSubview(self.divButton)
        self.view.addSubview(self.infoButton)
        
        self.mainDisplay.text = "0.0"
        self.clearInputs()
        
        self.updateConstraintsWithTraitCollection(self.traitCollection)
    }
    
    func updateConstraintsWithTraitCollection(traitCollection: UITraitCollection) {
        
        self.mainDisplay.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.view).offset(30)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.height.equalTo(50)
        }
        
        self.valueALabel.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.mainDisplay.snp_bottom).offset(10)
            make.left.equalTo(self.view).offset(10)
            make.width.equalTo(self.view).multipliedBy(0.4)
            make.height.equalTo(21)
        }
        
        self.valueBLabel.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.mainDisplay.snp_bottom).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.width.equalTo(self.view).multipliedBy(0.4)
            make.height.equalTo(21)
        }
        
        self.valueA.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.valueALabel.snp_bottom)
            make.left.equalTo(self.valueALabel)
            make.width.equalTo(self.valueALabel)
            make.height.equalTo(21)
        }
        
        self.valueB.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.valueBLabel.snp_bottom)
            make.left.equalTo(self.valueBLabel)
            make.width.equalTo(self.valueBLabel)
            make.height.equalTo(21)
        }
        
        self.stackView.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.valueA.snp_bottom).offset(10)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.height.equalTo(80)
        }
        
        self.infoButton.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.stackView.snp_bottom).offset(10)
            make.right.equalTo(self.view).offset(-10)
        }
    }
    
    func clearInputs() {
        
        self.valueA.text = ""
        self.valueB.text = ""
        self.valueA.becomeFirstResponder()
    }
    
    func tapAdd(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA + varB)"
        self.clearInputs()
    }
    
    func tapSub(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA - varB)"
        self.clearInputs()
    }
    
    func tapMult(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA * varB)"
        self.clearInputs()
    }
    
    func tapDiv(sender: UIButton) {
        
        let varA = Double(self.valueA.text ?? "") ?? 0.0
        let varB = Double(self.valueB.text ?? "") ?? 0.0
        self.mainDisplay.text = "\(varA / varB)"
        self.clearInputs()
    }
    
    func tapInfo(sender: UIButton) {
        
        self.presentViewController(AboutViewController(), animated: true, completion: nil)
    }
}

