//
//  ViewController.swift
//  NewColorGameUnit4
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadView()
        view.backgroundColor = .white
    }
    
    
    let colors = [
        "Red":UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        "Green":UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
        "Blue":UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
    ]

}

