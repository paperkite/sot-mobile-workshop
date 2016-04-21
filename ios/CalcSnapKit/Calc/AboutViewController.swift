//
//  AboutViewController.swift
//  Calc
//
//  Created by Farlei Heinen on 21/04/16.
//  Copyright © 2016 PaperKite. All rights reserved.
//

import UIKit
import SnapKit

class AboutViewController: UIViewController {
    
    lazy var infoLabel: UILabel = {
        let infoLabel = UILabel(frame: CGRectZero)
        infoLabel.numberOfLines = 1
        infoLabel.font = UIFont.systemFontOfSize(32)
        infoLabel.text = "iOS Calculator"
        infoLabel.textColor = UIColor.whiteColor()
        infoLabel.textAlignment = .Center
        return infoLabel
    }()
    
    lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: UIButtonType.Custom)
        closeButton.backgroundColor = UIColor.lightGrayColor()
        closeButton.setTitle("Close", forState: .Normal)
        closeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        closeButton.addTarget(self, action: #selector(AboutViewController.tapClose(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return closeButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        self.view.addSubview(self.infoLabel)
        self.view.addSubview(self.closeButton)

        self.updateConstraintsWithTraitCollection(self.traitCollection)
    }
    
    func updateConstraintsWithTraitCollection(traitCollection: UITraitCollection) {
        
        self.infoLabel.snp_makeConstraints { (make) -> () in
            make.top.equalTo(self.view).offset(30)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(50)
        }
        
        self.closeButton.snp_makeConstraints { (make) -> () in
            make.bottom.equalTo(self.view).offset(-30)
            make.centerX.equalTo(self.view)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
    }

    func tapClose(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
