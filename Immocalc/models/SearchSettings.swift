//
//  RequestParameters.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import Foundation

struct SearchSettings: Hashable, Codable {
    var leasehold: Bool
    var foreClosure: Bool
    var newBuilding: Bool
    var grossReturnFrom: Float
    var grossReturnTo: Float
    var buyingPriceFrom: Int
    var buyingPriceTo: Int
    var sortBy: String
    var geoSearches: [GeoSearch]
    
    init() {
        self.leasehold = false;
        self.foreClosure = false;
        self.newBuilding =  false;
        self.grossReturnFrom = 0;
        self.grossReturnTo = 100;
        self.buyingPriceFrom = 0;
        self.buyingPriceTo = 1000000;
        self.sortBy = "leasehold,desc";
        self.geoSearches = [GeoSearch]();
    }
    
    init(leasehold: Bool, foreClosure: Bool, newBuilding: Bool, grossReturnFrom: Float, grossReturnTo: Float, buyingPriceFrom: Int, buyingPriceTo: Int, sortBy: String, geoSearches: [GeoSearch]) {
        self.leasehold = leasehold;
        self.foreClosure = foreClosure;
        self.newBuilding =  newBuilding;
        self.grossReturnFrom = grossReturnFrom;
        self.grossReturnTo = grossReturnTo;
        self.buyingPriceFrom = buyingPriceFrom;
        self.buyingPriceTo = buyingPriceTo;
        self.sortBy = sortBy;
        self.geoSearches = geoSearches;
    }
}

struct GeoSearch: Hashable, Codable {
    var geoSearchQuery: String
    var geoSearchType: String
    var region: String
    
    init(geoSearchQuery: String, geoSearchType: String, region: String) {
        self.geoSearchQuery = geoSearchQuery
        self.geoSearchType = geoSearchType
        self.region = region
    }
}
