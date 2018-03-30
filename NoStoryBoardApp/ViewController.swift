//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 30.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var headerView: UIView!
    var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize View
        self.headerView = UIView()
        self.headerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //Add View to the ViewController's view
        self.view.addSubview(self.headerView)
        
        //Set position of view using constraints
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        self.headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        self.headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.headerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        //Initialize Label
        titleLabel = UILabel()
        titleLabel.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        titleLabel.text = "Numbers"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        headerView.addSubview(titleLabel)
        
        //Set Label's position
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.view.safeTopAnchor).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 0).isActive = true
        print(self.view.layoutMargins.left)
//        titleLabel.leftAnchor.constraint(equalTo: self.view.safeLeftAnchor, constant: self.view.layoutMargins.left).isActive = true
//        //titleLabel.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
//        titleLabel.widthAnchor.constraint(equalTo: self.titleLabel.widthAnchor, multiplier: 1).isActive = true
//        titleLabel.heightAnchor.constraint(equalTo: self.titleLabel.heightAnchor, multiplier: 1).isActive = true
    }



}

