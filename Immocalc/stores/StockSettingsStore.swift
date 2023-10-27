//
//  StockSettingsStore.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import SwiftUI

class StockSettingsStore: ObservableObject {
    
    @Published var stockSettings: StockSettings? = nil;
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("stockSettings.data")
    }
    
    func load() async throws {
        let task = Task<StockSettings?, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return StockSettings();
            }
            let settings = try JSONDecoder().decode(StockSettings.self, from: data)
            return settings
        }
        let stockSettings = try await task.value;
        DispatchQueue.main.async {
            self.stockSettings = stockSettings;
        }
    }
    
    func save(settings: StockSettings) async throws {
            let task = Task {
                let data = try JSONEncoder().encode(settings)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
            }
            _ = try await task.value
        }
}
