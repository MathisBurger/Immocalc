//
//  SearchResponse.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import Foundation

struct SearchResponse: Decodable {
    let total: Int
    let results: [SearchObject]
    
}

struct SearchObject: Decodable, Identifiable {
    let id: String
    let title: String
    let zip: String
    let buyingPrice: Int
    let rooms: Int
    let squareMeter: Float
    let rentPricePerSqm: Float
    let pricePerSqm: Int
    let rentPrice: Int
    let rentPriceCurrent: Int?
    let grossReturn: Float
    let grossReturnCurrent: Float?
    let images: [SearchObjectImage]
    
}

struct SearchObjectImage: Decodable {
    let id: String
    let originalUrl: String
}
