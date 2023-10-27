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
    @State private var bankInterestRate: Float = 0;
    @State private var valueIncreaseRate: Float = 0;
    
    var body: some View {
        List {
            Section {
                FloatField(text: "Aktien-Rendite", binding: $interestRate)
                FloatField(text: "Bank-Zinssatz", binding: $bankInterestRate)
                FloatField(text: "Immo Wertsteigerung", binding: $valueIncreaseRate)
            }
        }.task {
            do {
                try await store.load();
                if (store.stockSettings != nil) {
                    self.interestRate = (store.stockSettings!).interest;
                    self.bankInterestRate = (store.stockSettings!).bankInterest;
                    self.valueIncreaseRate = (store.stockSettings!).valueIncreaseRate;
                }
            } catch {
                // do nothing
            }
        }
        .onChange(of: interestRate) {newValue in
            Task {
                do {
                    try await store.save(settings: StockSettings(interest: newValue, bankInterest: bankInterestRate, valueIncreaseRate: valueIncreaseRate));
                } catch {}
            }
        }
        .onChange(of: bankInterestRate) {newValue in
            Task {
                do {
                    try await store.save(settings: StockSettings(interest: interestRate, bankInterest: newValue, valueIncreaseRate: valueIncreaseRate));
                } catch {}
            }
        }
        .onChange(of: valueIncreaseRate) {newValue in
            Task {
                do {
                    try await store.save(settings: StockSettings(interest: interestRate, bankInterest: bankInterestRate, valueIncreaseRate: newValue));
                } catch {}
            }
        }
    }
}
