//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 30.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, PassDataDelegate {
    
    var carImageName: String?
    
    //MARK: - Previous VC fields
    var additionalCost: Int?
    
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
        return stackView
    }()
    
    var switchArray = [SwitchElement]()
    var labelArray = [ElementLabel]()
    var stackViewArray = [ElementStackView]()
    
    var messageToDriverField: UITextField = {
        let textField = MainTextField(placeholder: "Message to the driver")
        return textField
    }()
    
    var titleLabel: UILabel = {
        //Initialize Label
        let newLabel = MainLabel(text: "Call a taxi", backgroundColor: .clear)
        return newLabel
    }()
    
    var totalLabel: UILabel = {
        let newLabel = UILabel(frame: .zero)
        newLabel.backgroundColor = .clear
        newLabel.text = "No additional cost"
        newLabel.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        newLabel.textAlignment = .left
        newLabel.numberOfLines = 1
        newLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return newLabel
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
        mainStackView.addArrangedSubview(messageToDriverField)
        
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
        mainStackView.addArrangedSubview(totalLabel)
        mainStackView.addArrangedSubview(buttonToNextVC)
        
        var constraints = [NSLayoutConstraint]()
        
        //Setup Main StackView position
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .width, multiplier: (300 / view.bounds.width), constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func modelSetup(){
        driveArray.append(DriveParameters(name: "Baby chair", cost: 200, capacity: 1))
        driveArray.append(DriveParameters(name: "Empty trunk", cost: 100, capacity: 2))
        driveArray.append(DriveParameters(name: "Music", cost: 50, capacity: 0))
        driveArray.append(DriveParameters(name: "Water", cost: 200, capacity: 0))
        driveArray.append(DriveParameters(name: "Body wagon", cost: 100, capacity: 4))
        
    }
    
    //MARK: - Pass Data from Destination View
    func passData(with: String) {
        messageToDriverField.text = with
        
    }
    
    @objc func buttonTapped(sender: UIButton){
        
        //Initialize Second View Controller
        let secondViewController = SecondViewController()
        
        //Setup Delegate. It's needed for feedback from Destination View
        secondViewController.previousViewController = self
        
        //Pass Data to Destination View
        let message = messageToDriverField.text! == "" ? "No message to the driver" : "Message to the driver:\n\(messageToDriverField.text!)"
        secondViewController.messageLabel.text = message
        
        secondViewController.additionalCost = self.additionalCost
        secondViewController.carImageName = self.carImageName
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    
    @objc func switchValueChanged(sender: UISwitch){
        driveArray[sender.tag-100].isChecked = sender.isOn
        
        var addTotalCost = 0
        var totalCapacity = 0
        for item in driveArray {
            addTotalCost += item.isChecked ? item.cost : 0
            totalCapacity += item.isChecked ? item.capacity : 0
        }
        totalLabel.text = addTotalCost != 0 ? "Additional cost is \(addTotalCost)" : "No additional cost"
        self.additionalCost = addTotalCost
        
        switch totalCapacity {
        case 0:
            self.carImageName = "matiz"
        case 1...3:
            self.carImageName = "lancer"
        default:
            self.carImageName = "truck"
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

