//
//  MainButton.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 02.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit
class MainButton: UIButton{
    init(title: String) {
        super.init(frame: .zero)
        
        //Initialize Button
        //self.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        self.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.4862745098, blue: 0.9647058824, alpha: 1)
        self.contentEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        self.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .highlighted)
        //self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
