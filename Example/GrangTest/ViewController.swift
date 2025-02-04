//
//  ViewController.swift
//  GrangTest
//
//  Created by ChanhoiOS on 02/04/2025.
//  Copyright (c) 2025 ChanhoiOS. All rights reserved.
//

import UIKit
import GrangTest

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let root = RootingChecker.isJailBreak()
        print("data: ", root)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

