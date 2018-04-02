//
//  ElementStackView.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 02.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ElementStackView: UIStackView {

    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 10
        self.distribution = .fill
        self.alignment = .fill
        self.contentMode = .scaleToFill
        //self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
