//
//  UserManager.swift
//  randomUserApi
//
//  Created by Döbrönte Réka on 2020. 03. 03..
//  Copyright © 2020. dobrontereka. All rights reserved.
//

import UIKit
import AlamofireImage

struct UserManager {
    
    func getFullName(name: Name) -> String {
        let fullName = "\(name.title) \(name.first) \(name.last)"
        
        return fullName
    }
    
    mutating func getImage(picture: URL, round: Bool) -> UIImage {
        let data = try! Data(contentsOf: picture)
        var image = UIImage(data: data, scale: UIScreen.main.scale)!
        
        if round {
            image = image.af.imageRoundedIntoCircle()
        }
        
        return image
    }
    
    func getFullLocation(location: Location) -> String {
        
        let encoder = JSONEncoder()
        let postCode = try! encoder.encode(location.postcode)
        let postCodeToString = String(data: postCode, encoding: .utf8)!
        let postCodeToPrint = postCodeToString.replacingOccurrences(of: "\"", with: "")
        
        let street = "\(location.street.name) \(location.street.number)"
        
        let fullLocation: [String] = [location.country, location.state, location.city, street, postCodeToPrint]
        
        let string = fullLocation.map { String($0) }
            .joined(separator: "\n")
        
        return string
    }
}
