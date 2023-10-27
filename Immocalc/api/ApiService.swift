//
//  ApiService.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import Foundation

/// General api service
class ApiService {
    
    var searchSettings: SearchSettings?;
    
    /// Constructor
    init(searchSettings: SearchSettings?) {
        self.searchSettings = searchSettings
    }
    
    /// Gets all search results
    func getSearchResults(completion:@escaping ([SearchObject]) -> ()) {
        if (self.searchSettings != nil) {
            let settings = self.searchSettings!;
            let unformattedUrl = "https://api.thinkimmo.com/immo?type=APARTMENTBUY&active=true&leasehold=" + String(settings.leasehold) + "&foreClosure=" + String(settings.foreClosure) + "&newBuilding=" + String(settings.newBuilding) + "&grossReturnFrom=" + String(settings.grossReturnFrom) + "&grossReturnTo=" + String(settings.grossReturnTo) + "&buyingPriceTo=" + String(settings.buyingPriceTo) + "&sortBy=" + String(settings.sortBy) + "&geoSearches=" + self.formatGeoAreasToJson(areas: settings.geoSearches);
            let formattedUrl = unformattedUrl.addingPercentEncoding(withAllowedCharacters:
                    .urlFragmentAllowed);
            
            let url = URL(string: formattedUrl!)!;
                
                URLSession.shared.dataTask(with: url) { (data, _, _) in
                    let result = try! JSONDecoder().decode(SearchResponse.self, from: data!)
                    DispatchQueue.main.async {
                        completion(result.results)
                    }
                }
                .resume()
        }
    }
    
    /// Formats objects to json
    private func formatGeoAreasToJson(areas: [GeoSearch]) -> String {
        let jsonData = try! JSONEncoder().encode(areas);
        let data = String(data: jsonData, encoding: String.Encoding.utf8);
        return data!;
    }
}
