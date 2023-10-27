//
//  StockSettings.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import Foundation

struct StockSettings : Codable, Hashable {
    var interest: Float;
    
    init(interest: Float) {
        self.interest = interest
    }
    
    init() {
        self.interest = 0;
    }
}


