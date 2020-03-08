//
//  UsersTableViewCell.swift
//  randomUserApi
//
//  Created by Döbrönte Réka on 2020. 03. 06..
//  Copyright © 2020. dobrontereka. All rights reserved.
//

import UIKit
import Alamofire

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var userManager = UserManager()
    
    func setUsers(user: Result) {
        let fullName = userManager.getFullName(name: user.name)
        let image = userManager.getImage(picture: user.picture.thumbnail, round: true)
        
        userImageView.image = image
        userNameLabel.text = fullName
    }
    
}
