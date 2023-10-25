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
    let platforms: [SearchObjectPlatform]
    let lift: Bool
    let cellar: Bool
    let balcony: Bool
    let garden: Bool
    let rented: Bool
    let comission: Float?
    let locationFactor: SearchObjectLocation
    let originalAddress: SearchObjectLocationAddress
}

struct SearchObjectImage: Decodable {
    let id: String
    let originalUrl: String
}

struct SearchObjectPlatform: Decodable {
    let id: String
    let url: String
}

struct SearchObjectLocation: Decodable {
    let population: Int
    let populationTrend: SearchObjectLocationPopulationTrend
    let score: Int
    let unemploymentRate: Float
    let hasUniversity: Bool
    let numberOfStudents: Int?
    let universityScore: Int?
}

struct SearchObjectLocationPopulationTrend: Decodable {
    let from: Float
    let to: Float
}

struct SearchObjectLocationAddress: Decodable {
    let locationQuery: String
}
