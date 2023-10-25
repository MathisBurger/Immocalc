//
//  ApiService.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import Foundation

class ApiService {
    func getSearchResults(completion:@escaping ([SearchObject]) -> ()) {
        let url = URL(string: "https://api.thinkimmo.com/immo?type=APARTMENTBUY&active=true&leasehold=false&foreClosure=false&newBuilding=false&grossReturnFrom=6&buyingPriceTo=140000&sortBy=grossReturn,desc&from=0&size=20&grossReturnAnd=false&allowUnknown=false&excludedFields=true&geoSearches=%5B%7B%22geoSearchQuery%22%3A%22Ingolstadt%22,%22geoSearchType%22%3A%22city%22,%22region%22%3A%22Bayern%22%7D%5D&averageAggregation=buyingPrice%3BpricePerSqm%3BsquareMeter%3BconstructionYear%3BrentPrice%3BrentPricePerSqm%3BrunningTime&termsAggregation=platforms.name.keyword,60")!;
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let result = try! JSONDecoder().decode(SearchResponse.self, from: data!)
                DispatchQueue.main.async {
                    completion(result.results)
                }
            }
            .resume()
        }
}
