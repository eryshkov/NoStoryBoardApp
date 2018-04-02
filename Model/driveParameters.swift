//
//  driveParameters.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 02.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

struct DriveParameters {
    var name: String
    var cost: Int
    var capacity: Int
    var isChecked: Bool
    init(name:String, cost: Int, capacity: Int, isChecked: Bool = false) {
        self.name = name
        self.cost = cost
        self.capacity = capacity
        self.isChecked = isChecked
    }
}

var driveArray = [DriveParameters]()


