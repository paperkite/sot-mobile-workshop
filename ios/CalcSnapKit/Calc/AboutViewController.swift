//
//  AboutViewController.swift
//  Calc
//
//  Created by Farlei Heinen on 21/04/16.
//  Copyright © 2016 PaperKite. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapClose(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
