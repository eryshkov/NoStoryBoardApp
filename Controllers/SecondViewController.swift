//
//  SecondViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 31.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - Previous VC fields
    var additionalCost: Int?
    var cost: Int?
    var totalCost: Int {
        var totalCost = 0
        if let addCost = additionalCost{
            totalCost += addCost
        }
        if let cost = cost{
            totalCost += cost
        }
        return totalCost
    }
    
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
    
    var totalLabel: UILabel = {
        let newLabel = UILabel(frame: .zero)
        newLabel.backgroundColor = .clear
        newLabel.text = "Additional cost is "
        newLabel.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        newLabel.textAlignment = .left
        newLabel.numberOfLines = 1
        newLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return newLabel
    }()
    
    var addLabel: UILabel = {
        let newLabel = UILabel(frame: .zero)
        newLabel.backgroundColor = .clear
        newLabel.text = "Additional cost is "
        newLabel.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        newLabel.textAlignment = .left
        newLabel.numberOfLines = 1
        newLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return newLabel
    }()
    
    var costLabel: UILabel = {
        let newLabel = UILabel(frame: .zero)
        newLabel.backgroundColor = .clear
        newLabel.text = "Additional cost is "
        newLabel.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        newLabel.textAlignment = .left
        newLabel.numberOfLines = 1
        newLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return newLabel
    }()
    
    var messageLabel: UILabel = {
        let newLabel = UILabel(frame: .zero)
        newLabel.backgroundColor = .clear
        newLabel.text = ""
        newLabel.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        newLabel.textAlignment = .left
        newLabel.numberOfLines = 1
        newLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return newLabel
    }()
    
    
    weak var previousViewController: PassDataDelegate?
    
    var titleLabel: UILabel = {
        //Initialize Label
        let titleLabel = MainLabel(text: "Bill", backgroundColor: .clear)
        return titleLabel
    }()
    
    var buttonToPreviousVC: UIButton = {
        //Initialize Button
        let buttonToPreviousVC = MainButton(title: "Accept")
        buttonToPreviousVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return buttonToPreviousVC
    }()
    
    //MARK: - View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performCalculation()
        
        LayoutSetup()
        
    }
    
    //MARK: - Layout Setup
    fileprivate func LayoutSetup() {
        //Initialize View
        self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(costLabel)
        mainStackView.addArrangedSubview(addLabel)
        mainStackView.addArrangedSubview(totalLabel)
        mainStackView.addArrangedSubview(messageLabel)
        mainStackView.addArrangedSubview(buttonToPreviousVC)
        
        var constraints = [NSLayoutConstraint]()
        
        //Setup Main StackView position
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .width, multiplier: (300 / view.bounds.width), constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: - Label init
    func performCalculation() {
        self.cost = Int(arc4random_uniform(1000))
        costLabel.text = (cost ?? 0) != 0 ? "The cost of travel is \(cost ?? 0)" : "Free travel"
        addLabel.text = (additionalCost ?? 0) != 0 ? "Additional cost is \(additionalCost ?? 0)" : "No additional cost"
        totalLabel.text = "Total: \(totalCost)"
    }
    
    //MARK: - Pass Data from Destination View
    func passData(string: String) {
        previousViewController?.passData(with: string)
    }
    
    @objc func buttonTapped(sender: UIButton){
        passData(string: "Total cost was \(totalCost)")
        self.dismiss(animated: true, completion: nil)
        
    }
    deinit {
        print("deinit Second VC")
    }
}
