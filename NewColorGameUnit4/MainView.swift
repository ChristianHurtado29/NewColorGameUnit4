//
//  MainView.swift
//  NewColorGameUnit4
//
//  Created by Christian Hurtado on 1/28/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var welcomeMsg = "Which color is dominant?"
    var playerScore = "Player score: 0"
    var highScore = "High score: 0"
    var score = 0
    var highScoreInt = 0
    
    public lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.textAlignment = .center
        label.text = welcomeMsg
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    public lazy var playerScoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.textAlignment = .center
        label.text = playerScore
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    public lazy var highScoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.textAlignment = .center
        label.text = highScore
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    
    public lazy var imgView : UIImageView = {
        let img = UIImageView()
        img.backgroundColor = newColor()
        return img
    }()
    
    public lazy var redButton : UIButton = {
        let redButton = UIButton()
        redButton.tag = 0
        redButton.backgroundColor = .red
        redButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return redButton
    }()
    
    public lazy var greenButton : UIButton = {
        let greenButton = UIButton()
        greenButton.tag = 1
        greenButton.backgroundColor = .green
        greenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return greenButton
    }()
    
    public lazy var blueButton : UIButton = {
        let blueButton = UIButton()
        blueButton.tag = 2
        blueButton.backgroundColor = .blue
        blueButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return blueButton
    }()
    
    public lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
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
    
    let colors = [
        "Red":UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        "Green":UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
        "Blue":UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
    ]
    
    func colorButton(withColor color:UIColor, title:String) -> [UIButton] {
        let array = [redButton, greenButton, blueButton]
        return array
    }
    
    @objc
    private func buttonPressed(_ sender: UIButton) {
      let array = [redColor, greenColor, blueColor]
        let highColor = array.max() ?? 0
        switch highColor {
        case redColor:
            if sender.tag == 0{
                messageLabel.text = "⭐️Correct! 🙌🚀⭐️"
                imgView.backgroundColor = newColor()
                score += 1
                playerScoreLabel.text = "Player Score: \(score)"
                if score > highScoreInt{
                    highScoreInt = score
                    highScoreLabel.text = "High Score: \(highScoreInt)"
                }
            }
            else{
                welcomeMsg = "😵Wrong!⚰️"
                score = 0
                playerScore = "Player Score: 0"
                playerScoreLabel.text = "Player Score: \(score)"
            }
        case greenColor:
            if sender.tag == 1{
                messageLabel.text = "⭐️Correct! 🙌🚀⭐️"
                    imgView.backgroundColor = newColor()
                    score += 1
                    playerScoreLabel.text = "Player Score: \(score)"
                    if score > highScoreInt{
                        highScoreInt = score
                        highScoreLabel.text = "High Score: \(highScoreInt)"
                    }
                }
                else{
                    welcomeMsg = "😵Wrong!⚰️"
                    score = 0
                    playerScore = "Player Score: 0"
                    playerScoreLabel.text = "Player Score: \(score)"
            }
        case blueColor:
            if sender.tag == 2{
                messageLabel.text = "⭐️Correct! 🙌🚀⭐️"
                    imgView.backgroundColor = newColor()
                    score += 1
                    playerScoreLabel.text = "Player Score: \(score)"
                    if score > highScoreInt{
                        highScoreInt = score
                        highScoreLabel.text = "High Score: \(highScoreInt)"
                    }
                }
                else{
                messageLabel.text = "😵Wrong!⚰️"
                    score = 0
                    playerScore = "Player Score: 0"
                    playerScoreLabel.text = "Player Score: \(score)"
            }
        default:
            break
        }
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
        displayButtons()
        setupPlayerScoreConstraints()
        setupHighScoreLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imgView.heightAnchor.constraint(equalToConstant: 400),
            imgView.widthAnchor.constraint(equalToConstant: 374)
        ])
    }
    
    private func setupMessageLabelConstraints() {
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func displayButtons(){
        addSubview(stackView)
        stackView.spacing = 130
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(greenButton)
        stackView.addArrangedSubview(blueButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)])
    }
    
    private func setupPlayerScoreConstraints() {
        addSubview(playerScoreLabel)
        playerScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playerScoreLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            playerScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            playerScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupHighScoreLabelConstraints() {
        addSubview(highScoreLabel)
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highScoreLabel.topAnchor.constraint(equalTo: playerScoreLabel.bottomAnchor, constant: 30),
            highScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            highScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
}
