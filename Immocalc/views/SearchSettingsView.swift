//
//  SearchSettingsView.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

/// View for editing search settings
struct SearchSettingsView: View {
    
    @State private var searchSettings = SearchSettingsStore();
    @State private var leasehold = false;
    @State private var foreClosure = false;
    @State private var newBuilding = false;
    @State private var grossReturnFrom: Float = 0.0;
    @State private var grossReturnTo: Float = 0.0;
    @State private var buyingPriceTo: Int = 0;
    @State private var sortBy: String = "leasehold,desc";
    @State private var geoSearches = [GeoSearch]();
    @State private var notificationText = "";
    @State private var notificationShown = false;
    
    /// Saves the search settings
    func saveData() async {
        let data = SearchSettings(leasehold: leasehold, foreClosure: foreClosure, newBuilding: newBuilding, grossReturnFrom: grossReturnFrom, grossReturnTo: grossReturnTo, buyingPriceFrom: 0, buyingPriceTo: buyingPriceTo, sortBy: sortBy, geoSearches: geoSearches);
        do {
            await try searchSettings.save(settings: data);
            notificationText = "Erfolgreich gespeichert";
            notificationShown.toggle();
        } catch {
            notificationText = "Fehler beim Speichern";
            notificationShown.toggle();
        }
    }
    
    var body: some View {
        List {
            Toggle(isOn: $leasehold) {
                Text("Pachtobject")
            }
            Toggle(isOn: $foreClosure) {
                Text("Zwangsversteigerung")
            }
            Toggle(isOn: $newBuilding) {
                Text("Neues Gebäude")
            }
            Section {
                FloatField(text: "min. Rendite", binding: $grossReturnFrom)
                FloatField(text: "max. Rendite", binding: $grossReturnTo)
            } header: {
                Text("Rendite")
            }
            IntegerField(text: "max. Kaufpreis", binding: $buyingPriceTo)
            SortByInput(selection: $sortBy)
            GeoSearchInput(geoSearches: $geoSearches)
            Section {
                Button("Speichern") {
                    Task {
                        await saveData();
                    }
                }.alert(notificationText, isPresented: $notificationShown) {
                    Button("OK") {notificationShown.toggle()}
                }
            }
        }
        .task {
            do {
                try await searchSettings.load();
                if (searchSettings.searchSettings != nil) {
                    self.leasehold = (searchSettings.searchSettings!).leasehold;
                    self.foreClosure = (searchSettings.searchSettings!).foreClosure;
                    self.newBuilding = (searchSettings.searchSettings!).newBuilding;
                    self.grossReturnFrom = (searchSettings.searchSettings!).grossReturnFrom;
                    self.grossReturnTo = (searchSettings.searchSettings!).grossReturnTo;
                    self.buyingPriceTo = (searchSettings.searchSettings!).buyingPriceTo;
                    self.sortBy = (searchSettings.searchSettings!).sortBy;
                    self.geoSearches = (searchSettings.searchSettings!).geoSearches;
                }
            } catch {
                // do nothing
            }
            
        }
    }
}
