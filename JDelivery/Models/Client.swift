//
//  Cliente.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import Foundation
import FirebaseFirestore

struct Client: Codable, Identifiable {
    @DocumentID var id: String?
    var email: String
    var names: String
    var deliveryList: [Delivery]
}
