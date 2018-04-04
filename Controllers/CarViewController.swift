//
//  CarViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 03.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    weak var previousVC: PassDataDelegate?
    var carImageName: String?
    
    //MARK: - UI Views Setup
    
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
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //Create Image View
        let carImage = UIImage(named: self.carImageName ?? "matiz")
        let carImageView = UIImageView(image: carImage)
        let aspectRatio = (carImage?.size.height)!/(carImage?.size.width)!
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(carImageView)
        view.addSubview(returnToMainButton)
        
        var constraints = [NSLayoutConstraint]()
        
        //Setup ImageView position
        constraints.append(NSLayoutConstraint(item: carImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: carImageView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: carImageView, attribute: .width, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .width, multiplier: (300 / view.bounds.width), constant: 0))
        // Aspect Ratio Trick
        constraints.append(NSLayoutConstraint(item: carImageView, attribute: .height, relatedBy: .equal, toItem: carImageView, attribute: .width, multiplier: aspectRatio, constant: 0))
        
        //Setup Label position
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: carImageView, attribute: .top, multiplier: 1, constant: -30))
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: (300 / view.bounds.width), constant: 0))
        
        //Setup Button position
        constraints.append(NSLayoutConstraint(item: returnToMainButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: carImageView, attribute: .bottom, multiplier: 1, constant: 30))
        constraints.append(NSLayoutConstraint(item: returnToMainButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: returnToMainButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: (100 / view.bounds.width), constant: 0))
        
        
        
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
