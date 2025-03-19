//
//  Pedido.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import Foundation
import FirebaseFirestore

struct Delivery: Codable, Identifiable {
    @DocumentID var id: String?
    var idCliend: String
    var idWorker: String?
    var createdDate: Date
    var shippingDate: Date?
    var amount: Int
    var state: StateDelivery
    var items: [Producto]
    var pickupPlace: Place
    var shippingPlace: Place
    var price: Double
    var isPaid: Bool
}
