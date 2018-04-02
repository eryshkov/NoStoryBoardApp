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
    
    var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var switchStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 30
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
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        
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
        mainStackView.addArrangedSubview(switchStackView)
        mainStackView.addArrangedSubview(textField)
        mainStackView.addArrangedSubview(buttonToNextVC)
        
        var constraints = [NSLayoutConstraint]()
        
        //Set Main StackView position
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        
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

