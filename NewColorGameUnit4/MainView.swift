//
//  MainView.swift
//  NewColorGameUnit4
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public lazy var imgView : UIImageView = {
        let img = UIImageView()
        img.backgroundColor = newColor()
        return img
    }()
    
    var redColor = CGFloat.random(in: 0...1)
    var greenColor = CGFloat.random(in: 0...1)
    var blueColor = CGFloat.random(in: 0...1)
    
    func newColor() -> UIColor {
        redColor = CGFloat.random(in: 0...1)
        greenColor = CGFloat.random(in: 0...1)
        blueColor = CGFloat.random(in: 0...1)
        let newColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        return newColor
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit(){
        setupImageViewConstraints()
    }
    
    
    private func setupImageViewConstraints() {
        addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // set top anchor 20 points from the safe area top
            imgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imgView.heightAnchor.constraint(equalToConstant: 400),
            imgView.widthAnchor.constraint(equalToConstant: 374)
            ])
    }
    
    
    
}