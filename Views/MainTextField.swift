//
//  Mainself.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 02.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class MainTextField: UITextField {

    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.autocorrectionType = .no
        self.borderStyle = .roundedRect
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
