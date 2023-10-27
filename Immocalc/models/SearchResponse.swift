//
//  SearchResponse.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import Foundation

/// The search response from the API
struct SearchResponse: Decodable {
    let total: Int
    let results: [SearchObject]
    
}

/// Single search object that is send by the API
struct SearchObject: Decodable, Identifiable {
    let id: String
    let title: String
    let zip: String
    let buyingPrice: Int
    let rooms: Int
    let squareMeter: Float
    let rentPricePerSqm: Float
    let pricePerSqm: Float
    let rentPrice: Float?
    let rentPriceCurrent: Float?
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
    let originalAddress: SearchObjectLocationAddress?
}

/// An Image of a search object
struct SearchObjectImage: Decodable {
    let id: String
    let originalUrl: String
}

/// A platform of a search object
struct SearchObjectPlatform: Decodable {
    let id: String
    let url: String
}

/// A location of a search object
struct SearchObjectLocation: Decodable {
    let population: Int
    let populationTrend: SearchObjectLocationPopulationTrend
    let score: Int
    let unemploymentRate: Float
    let hasUniversity: Bool
    let numberOfStudents: Int?
    let universityScore: Int?
}

/// Population trend of the city of an object
struct SearchObjectLocationPopulationTrend: Decodable {
    let from: Float
    let to: Float
}

/// Address of an object
struct SearchObjectLocationAddress: Decodable {
    let locationQuery: String?
}
