//
//  SecondViewControllerExt.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 03.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

extension SecondViewController: PassDataDelegate{
    //MARK: - Pass Data from Destination View Controller
    func passData(with: String) {
        self.dismiss(animated: true, completion: nil)
    }
}
