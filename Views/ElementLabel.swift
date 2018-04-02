//
//  ElementLabel.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 02.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ElementLabel: UILabel {

    init(text: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.text = text
        self.padding = UIEdgeInsetsMake(3, 3, 3, 3)
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
