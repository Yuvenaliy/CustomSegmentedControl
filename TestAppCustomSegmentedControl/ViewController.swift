//
//  ViewController.swift
//  TestAppCustomSegmentedControl
//
//  Created by Ювеналий on 15.07.2021.
//

import UIKit



class ViewController: UIViewController {
   
    let customSC = CustomSegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0), buttonTitles: ["One", "Two", "Three"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customSC)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        customSC.frame = CGRect(
            x: 36,
            y: 661,
            width: 303,
            height: 50
        )
    }
}

