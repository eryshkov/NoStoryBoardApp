//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 30.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var titleLabel: UILabel!
    var buttonToNextVC: UIButton!
    var segue: UIStoryboardSegue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize Label
        titleLabel = UILabel()
        titleLabel.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        titleLabel.text = "First View Controller"
        titleLabel.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        view.addSubview(titleLabel)
        
        //Set Label's position
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.view.safeTopAnchor).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: titleLabel, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: titleLabel, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        //Initialize Button
        buttonToNextVC = UIButton()
        //buttonToNextVC.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        buttonToNextVC.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        buttonToNextVC.contentEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        buttonToNextVC.setTitle("To Next View", for: .normal)
        buttonToNextVC.setTitleColor(#colorLiteral(red: 0.1607843137, green: 0.4862745098, blue: 0.9647058824, alpha: 1), for: .normal)
        buttonToNextVC.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .highlighted)
        view.addSubview(buttonToNextVC)
        buttonToNextVC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        //Set position of Button
        buttonToNextVC.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: buttonToNextVC, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: buttonToNextVC, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: buttonToNextVC, attribute: .height, relatedBy: .equal, toItem: buttonToNextVC, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: buttonToNextVC, attribute: .width, relatedBy: .equal, toItem: buttonToNextVC, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        
        
        
    }
    
    @objc func buttonTapped(sender: UIButton){
        //Initialize Segue
        let secondViewController = SecondViewController()
        self.segue = UIStoryboardSegue(identifier: "Segue", source: self, destination: secondViewController, performHandler: {
            self.present(secondViewController, animated: true, completion: nil)
        })
        self.segue.perform()
    }
}

