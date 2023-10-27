//
//  SearchSettingsStore.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

class SearchSettingsStore: ObservableObject {
    
    @Published var searchSettings: SearchSettings? = nil;
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("searchSettings.data")
    }
    
    func load() async throws {
        let task = Task<SearchSettings?, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return SearchSettings();
            }
            let settings = try JSONDecoder().decode(SearchSettings.self, from: data)
            return settings
        }
        let searchSettings = try await task.value;
        DispatchQueue.main.async {
            self.searchSettings = searchSettings;
        }
    }
    
    func save(settings: SearchSettings) async throws {
            let task = Task {
                let data = try JSONEncoder().encode(settings)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
            }
            _ = try await task.value
        }
}
