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
    
    var switchStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var switchArray = [SwitchElement]()
    var labelArray = [ElementLabel]()
    var stackViewArray = [ElementStackView]()
    
    var textField: UITextField = {
        let textField = MainTextField(placeholder: "Message to the driver")
        return textField
    }()
    
    var titleLabel: UILabel = {
        //Initialize Label
        let titleLabel = MainLabel(text: "Call a taxi", backgroundColor: .clear)
        return titleLabel
    }()
    
    var buttonToNextVC: UIButton = {
        let buttonToNextVC = MainButton(title: "Call")
        buttonToNextVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return buttonToNextVC
    }()
    
    //MARK: - View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelSetup()
        layoutSetup()
    }
    //MARK: - Layout Setup
     func layoutSetup() {
        view.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        self.view.addSubview(titleLabel)
        self.view.addSubview(buttonToNextVC)
        self.view.addSubview(textField)
        
        // Generate Switches and Labels dynamically
        var index = 0
        for item in driveArray {
            
            let newSwitch = SwitchElement()
            newSwitch.addTarget(self, action: #selector(switchValueChanged(sender:)), for: .valueChanged)
            newSwitch.tag = 100 + index
            index += 1
            switchArray.append(newSwitch)
            
            let newLabel = ElementLabel(text: item.name, backgroundColor: .clear)
            labelArray.append(newLabel)
            
            let newStack = ElementStackView()
            stackViewArray.append(newStack)
            newStack.addArrangedSubview(newLabel)
            newStack.addArrangedSubview(newSwitch)
            switchStackView.addArrangedSubview(newStack)
        }
        view.addSubview(switchStackView)
        
        var constraints = [NSLayoutConstraint]()
        
        //Set Label's position
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .width, multiplier: 0.3, constant: 0))
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: titleLabel, attribute: .height, multiplier: 1, constant: 0))
        
        //Set position of Button
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .height, relatedBy: .equal, toItem: buttonToNextVC, attribute: .height, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToNextVC, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.15, constant: 0))
        
        //Set Text Field position
        constraints.append(NSLayoutConstraint(item: textField, attribute: .bottom, relatedBy: .equal, toItem: buttonToNextVC, attribute: .top, multiplier: 1, constant: -10))
        constraints.append(NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.25, constant: 0))
        constraints.append(NSLayoutConstraint(item: textField, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        //Set StackView position
        constraints.append(NSLayoutConstraint(item: switchStackView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 20))
        constraints.append(NSLayoutConstraint(item: switchStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: switchStackView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: textField, attribute: .top, multiplier: 1, constant: -20))
        constraints.append(NSLayoutConstraint(item: switchStackView, attribute: .width, relatedBy: .equal, toItem: textField, attribute: .width, multiplier: 1, constant: 0))

        
        NSLayoutConstraint.activate(constraints)
    }
    
    func modelSetup(){
        driveArray.append(DriveParameters(name: "Baby chair", cost: 200, capacity: 1))
        driveArray.append(DriveParameters(name: "Empty trunk", cost: 100, capacity: 2))
        driveArray.append(DriveParameters(name: "Music", cost: 50, capacity: 0))
        driveArray.append(DriveParameters(name: "Water", cost: 200, capacity: 0))
        driveArray.append(DriveParameters(name: "Body wagon", cost: 100, capacity: 2))
        
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
    
    @objc func switchValueChanged(sender: UISwitch){
        driveArray[sender.tag-100].isChecked = sender.isOn
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

