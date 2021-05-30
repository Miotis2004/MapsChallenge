//
//  Location.swift
//  Maps
//
//  Created by Ronald Joubert on 5/29/21.
//

import Foundation

struct Location: Codable, Identifiable {
    var id = UUID()
    var name: String
    var lat: String
    var long: String
}
