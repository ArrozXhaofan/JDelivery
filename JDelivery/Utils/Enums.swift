//
//  Enums.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import Foundation

enum TypeItem: String, Codable, Hashable {
    case document
    case box
    case clothe
}

enum SizeItem: String, Codable, Hashable {
    case small
    case medium
    case large
}

enum StateDelivery: String, Codable, Hashable {
    case pending
    case onTheWay
    case pickedUp
    case delivered
    case canceled
}


