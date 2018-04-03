//
//  CarViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 03.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    var previousVC: PassDataDelegate?
    var carName: String?
    
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
    
    var returnToMainButton: UIButton = {
        let buttonToNextVC = MainButton(title: "Return")
        buttonToNextVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return buttonToNextVC
    }()
    
    var titleLabel: UILabel = {
        //Initialize Label
        let newLabel = MainLabel(text: "This is your car", backgroundColor: .clear)
        return newLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetup()
    }
    
    //MARK: - Layout setup
    func layoutSetup(){
        view.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        
        let carImage = UIImage(named: "matiz")
        let carImageView = UIImageView(image: carImage)
        carImageView.autoresizingMask = .flexibleWidth
        carImageView.frame.size.height = 280.0
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(carImageView)
        mainStackView.addArrangedSubview(returnToMainButton)
        
        var constraints = [NSLayoutConstraint]()
        
        //Setup Main StackView position
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: mainStackView, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .width, multiplier: (300 / view.bounds.width), constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func buttonTapped(sender: UIButton){
        
        self.dismiss(animated: true) {
            self.previousVC?.passData(with: "")
        }
        
    }
    
    deinit {
        print("Car VC deinit")
    }
}
