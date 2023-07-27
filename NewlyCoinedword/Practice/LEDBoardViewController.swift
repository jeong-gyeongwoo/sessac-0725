//
//  LEDBoardViewController.swift
//  NewlyCoinedword
//
//  Created by 정경우 on 2023/07/27.
//

import UIKit

class LEDBoardViewController: UIViewController {
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var wordSendButton: UIButton!
    @IBOutlet var wordColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeButtonStyle()
    }
    
    func makeButtonStyle() {
        wordSendButton.layer.borderWidth = 1
        wordSendButton.layer.borderColor = UIColor.black.cgColor
        wordSendButton.layer.cornerRadius = 5
        wordSendButton.clipsToBounds = true
        
        wordColorButton.layer.borderWidth = 1
        wordColorButton.layer.borderColor = UIColor.black.cgColor
        wordColorButton.layer.cornerRadius = 5
        wordColorButton.clipsToBounds = true
    }
    
    func RandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
    
    @IBAction func changeWordColorRandom(_ sender: UIButton) {
        resultLabel.textColor = RandomColor()
        wordColorButton.tintColor = resultLabel.textColor
        // wordColorButton.titleLabel?.textColor = UIColor.green
        // viewDidLoad()에 두면 처음만 바뀌고 여긴 아예 안바뀜..
    }
    
    @IBAction func sendingWord(_ sender: UIButton) {
        resultLabel.text = wordTextField.text
        
    }
    
    @IBAction func dropKeyTextField(_ sender: UITextField) {
    }
    
    @IBAction func keyEdit(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        wordSendButton.isEnabled.toggle()
    }
    
}
