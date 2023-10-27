//
//  StockSettingsView.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import SwiftUI

struct StockSettingsView: View {
    
    @State private var store = StockSettingsStore();
    @State private var interestRate: Float = 0;
    
    var body: some View {
        List {
            Section {
                FloatField(text: "Aktien-Rendite", binding: $interestRate)
            }
        }.task {
            do {
                try await store.load();
                if (store.stockSettings != nil) {
                    self.interestRate = (store.stockSettings!).interest;
                }
            } catch {
                // do nothing
            }
        }
        .onChange(of: interestRate) {newValue in
            Task {
                do {
                    try await store.save(settings: StockSettings(interest: newValue));
                } catch {}
            }
        }
    }
}
