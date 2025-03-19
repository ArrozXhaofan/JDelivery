//
//  Structs.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 18/03/25.
//

import Foundation
import FirebaseFirestore

struct Producto: Codable {
    var type: TypeItem
    var size: SizeItem
}

struct Place: Codable {
    var coordinates: GeoPoint
    var address: String
    var reference: String?
}
