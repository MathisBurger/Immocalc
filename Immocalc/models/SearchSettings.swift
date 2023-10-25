//
//  RequestParameters.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import Foundation

struct SearchSettings: Hashable, Codable {
    let leasehold: Bool
    /*let foreClosure: Bool?
    let newBuilding: Bool?
    let grossReturnFrom: Float?
    let grossReturnTo: Float?
    let buyingPriceFrom: Int?
    let buyingPriceTo: Int?
    let sortBy: String?
    let geoSearches: String?*/
    
    init() {
        self.leasehold = true;
    }
}
