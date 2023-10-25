//
//  ApiService.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import Foundation

class ApiService {
    
    var searchSettings: SearchSettings?;
    
    init(searchSettings: SearchSettings?) {
        self.searchSettings = searchSettings
    }
    
    func getSearchResults(completion:@escaping ([SearchObject]) -> ()) {
        print(searchSettings?.leasehold);
        let url = URL(string: "https://api.thinkimmo.com/immo?type=APARTMENTBUY&active=true&leasehold=false&foreClosure=false&newBuilding=false&grossReturnFrom=6&buyingPriceTo=140000&sortBy=grossReturn,desc&geoSearches=%5B%7B%22geoSearchQuery%22%3A%22Ingolstadt%22,%22geoSearchType%22%3A%22city%22,%22region%22%3A%22Bayern%22%7D%5D")!;
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let result = try! JSONDecoder().decode(SearchResponse.self, from: data!)
                DispatchQueue.main.async {
                    completion(result.results)
                }
            }
            .resume()
        }
}
