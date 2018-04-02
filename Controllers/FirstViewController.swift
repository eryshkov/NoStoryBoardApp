//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 30.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, PassDataDelegate {
    //MARK: - UI Views Setup
    var textField: UITextField = {
        let textField = MainTextField(placeholder: "Enter text to pass")
        return textField
    }()
    
    var titleLabel: UILabel = {
        //Initialize Label
        let titleLabel = MainLabel(text: "First View Controller", backgroundColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1))
        return titleLabel
    }()
    
    var buttonToNextVC: UIButton = {
        let buttonToNextVC = MainButton(title: "To Next View")
        buttonToNextVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return buttonToNextVC
    }()
    
    //MARK: - View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LayoutSetup()
    }
    //MARK: - Layout Setup
    fileprivate func LayoutSetup() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(buttonToNextVC)
        self.view.addSubview(textField)
        
        var constraints = [NSLayoutConstraint]()
        
        //Set Label's position
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .width, multiplier: 0.3, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: titleLabel, attribute: .height, multiplier: 1, constant: 0))
        
        //Set position of Button
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .height, relatedBy: .equal, toItem: buttonToNextVC, attribute: .height, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .width, relatedBy: .equal, toItem: buttonToNextVC, attribute: .width, multiplier: 1, constant: 0))
        
        //Set Text Field position
        constraints.append(NSLayoutConstraint(item: textField, attribute: .bottom, relatedBy: .equal, toItem: buttonToNextVC, attribute: .top, multiplier: 1, constant: -10))
        constraints.append(NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.25, constant: 0))
        constraints.append(NSLayoutConstraint(item: textField, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: - Pass Data from Destination View
    func passData(with: String) {
        textField.text = with
        
    }
    
    @objc func buttonTapped(sender: UIButton){
        //Initialize Second View Controller
        let secondViewController = SecondViewController()
        secondViewController.previousViewController = self //Setup Delegate
        secondViewController.textField.text = textField.text //Pass Data to Destination View
        self.present(secondViewController, animated: true, completion: nil)
        
        
    }
}

