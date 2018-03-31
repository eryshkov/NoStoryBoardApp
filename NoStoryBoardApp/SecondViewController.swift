//
//  SecondViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 31.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize View
        self.secondView = UIView()
        self.secondView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //Add View to the ViewController's view
        self.view.addSubview(self.secondView)
        
        //Set position of the Second View
        self.secondView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: secondView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: secondView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0).isActive = true
    }

    

}
