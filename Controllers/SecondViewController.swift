//
//  SecondViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 31.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //MARK: - UI Views Setup
    var textField: UITextField = {
        let textField = MainTextField(placeholder: "Enter text to pass")
        return textField
    }()
    
    weak var previousViewController: PassDataDelegate?
    
    var titleLabel: UILabel = {
        //Initialize Label
        let titleLabel = MainLabel(text: "Second View Controller", backgroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        return titleLabel
    }()
    
    var buttonToPreviousVC: UIButton = {
        //Initialize Button
        let buttonToPreviousVC = MainButton(title: "To Previous View")
        buttonToPreviousVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return buttonToPreviousVC
    }()
    
    //MARK: - View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LayoutSetup()
        
    }
    
    //MARK: - Layout Setup
    fileprivate func LayoutSetup() {
        //Initialize View
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(buttonToPreviousVC)
        view.addSubview(titleLabel)
        view.addSubview(textField)
        
        var constraints = [NSLayoutConstraint]()
        
        //Set position of Button
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .height, relatedBy: .equal, toItem: buttonToPreviousVC, attribute: .height, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .width, relatedBy: .equal, toItem: buttonToPreviousVC, attribute: .width, multiplier: 1, constant: 0))
        
        //Set Label's position
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .width, multiplier: 0.3, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: titleLabel, attribute: .height, multiplier: 1, constant: 0))
        
        //Set Text Field position
        constraints.append(NSLayoutConstraint(item: textField, attribute: .bottom, relatedBy: .equal, toItem: buttonToPreviousVC, attribute: .top, multiplier: 1, constant: -10))
        constraints.append(NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.25, constant: 0))
        constraints.append(NSLayoutConstraint(item: textField, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: - Pass Data from Destination View
    func passData(string: String) {
        previousViewController?.passData(with: string)
    }
    
    @objc func buttonTapped(sender: UIButton){
        if let text = textField.text{
            passData(string: text)
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    deinit {
        print("deinit Second VC")
    }
}
