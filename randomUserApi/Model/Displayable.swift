//
//  Displayable.swift
//  randomUserApi
//
//  Created by Döbrönte Réka on 2020. 03. 03..
//  Copyright © 2020. dobrontereka. All rights reserved.
//

import Foundation

protocol  Displayable {
    var imageView: Picture { get }
    var nameLabel: (label: String, value: Name) { get }
    var genderLabel: (label: String, value: String) { get }
    var locationLabel: (label: String, value: Location) { get }
    var contactLabel: (label: String, value: String) { get }
}
