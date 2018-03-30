//
//  ViewController.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 30.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize View
        let headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        //Add View to the ViewController's view
        self.view.addSubview(headerView)
        
        //Set position of view using constraints
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        headerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }



}

