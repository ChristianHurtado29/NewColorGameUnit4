//
//  MainView.swift
//  NewColorGameUnit4
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let welcomeMsg = "Which color is dominant?"
    
    public lazy var messageLabel: UILabel = {
    let label = UILabel()
     label.backgroundColor = .systemGray3
     label.textAlignment = .center
     label.text = welcomeMsg
     label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
     return label
    }()
    
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
        setupMessageLabelConstraints()
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
    
    private func setupMessageLabelConstraints() {
        // add the messageLabel to the MainView
        addSubview(messageLabel) // return the messageLabel we created above
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // set top anchor 20 points from the safe area top
            messageLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ])
    }
    
    
}
