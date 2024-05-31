//
//  User.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let surname: String
    let email: String
}
