//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 30.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, PassDataDelegate {
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text to pass"
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    var titleLabel: UILabel = {
        //Initialize Label
        let titleLabel = UILabel()
        titleLabel.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        titleLabel.text = "First View Controller"
        titleLabel.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    var buttonToNextVC: UIButton = {
        //Initialize Button
        let buttonToNextVC = UIButton()
        //buttonToNextVC.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        buttonToNextVC.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.4862745098, blue: 0.9647058824, alpha: 1)
        buttonToNextVC.contentEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        buttonToNextVC.setTitle("To Next View", for: .normal)
        buttonToNextVC.layer.borderWidth = 1
        buttonToNextVC.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        buttonToNextVC.layer.cornerRadius = 5
        buttonToNextVC.clipsToBounds = true
        buttonToNextVC.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        buttonToNextVC.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .highlighted)
        buttonToNextVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        buttonToNextVC.translatesAutoresizingMaskIntoConstraints = false
        return buttonToNextVC
    }()
    
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

