//
//  ViewController.swift
//  Buggy
//
//  Created by Samksha Bhardwaj on 17/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
//        print("Called buttonTapped(_:)")
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
//        print("sender: \(sender)")
//        print("Is control on \(sender.isOn)")
    }
    
    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        for _ in 0...10 {
            array.removeObject(at: 0)
        }
    }
    
}

