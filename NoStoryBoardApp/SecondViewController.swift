//
//  SecondViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 31.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var previousViewController: UIViewController?
    
    var buttonToPreviousVC: UIButton = {
        //Initialize Button
        let buttonToNextVC = UIButton()
        //buttonToNextVC.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        buttonToNextVC.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        buttonToNextVC.contentEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        buttonToNextVC.setTitle("To Previous View", for: .normal)
        buttonToNextVC.setTitleColor(#colorLiteral(red: 0.1607843137, green: 0.4862745098, blue: 0.9647058824, alpha: 1), for: .normal)
        buttonToNextVC.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .highlighted)
        buttonToNextVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        buttonToNextVC.translatesAutoresizingMaskIntoConstraints = false
        return buttonToNextVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize View
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(buttonToPreviousVC)
        
        var constraints = [NSLayoutConstraint]()
        
        //Set position of Button
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .height, relatedBy: .equal, toItem: buttonToPreviousVC, attribute: .height, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: buttonToPreviousVC, attribute: .width, relatedBy: .equal, toItem: buttonToPreviousVC, attribute: .width, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
        
    }

    @objc func buttonTapped(sender: UIButton){
        (previousViewController as! FirstViewController).secondViewController = nil
            self.dismiss(animated: true, completion: nil)
        
    }
    deinit {
        print("deinit Second VC")
    }
}
