//
//  HideKeyBoard.swift
//  NoStoryBoardApp
//
//  Created by Evgeniy Ryshkov on 03.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

extension FirstViewController: UITextFieldDelegate{
    // Hides keyboard on RETURN Button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // Hides keyboard on Touch Outside Tap
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
}

extension FirstViewController: PassDataDelegate{
    
    //MARK: - Pass Data from Destination View Controller
    func passData(with: String) {
        messageToDriverField.text = with
        
    }
}
