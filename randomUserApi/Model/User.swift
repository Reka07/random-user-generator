//
//  User.swift
//  randomUserApi
//
//  Created by Döbrönte Réka on 2020. 03. 03..
//  Copyright © 2020. dobrontereka. All rights reserved.
//

import Foundation

// MARK: - Response
struct Response: Decodable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let phone, cell: String
    let picture: Picture
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Postcode
}

// MARK: - Postcode
enum Postcode: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Postcode"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: URL
}


extension Result: Displayable {
    var imageView: Picture {
        picture
    }
    
    var nameLabel: (label: String, value: Name) {
        ("NAME", name)
    }
    
    var genderLabel: (label: String, value: String) {
        ("GENDER", gender)
    }
    
    var locationLabel: (label: String, value: Location) {
        ("LOCATION", location)
    }
    
    var contactLabel: (label: String, value: String) {
        ("PHONE", phone)
    }
}
