//
//  GeoSearchInput.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import SwiftUI

/// Inputs geosearch data
struct GeoSearchInput: View {
    
    var geoSearches: Binding<[GeoSearch]>
    @State private var searchQuery = "";
    @State private var region = "";
    @State private var alertShown = false;
    
    /// Adds an geosearch
    func addToGeoSearches() {
        let search = GeoSearch(geoSearchQuery: searchQuery, geoSearchType: "city", region: region);
        self.searchQuery = "";
        self.region = "";
        self.geoSearches.wrappedValue.append(search);
        self.alertShown.toggle();
    }
    
    /// Cancels the add action
    func cancelAddAction()  {
        self.searchQuery = "";
        self.region = "";
        self.alertShown.toggle();
    }
    
    /// Removes an specific element
    func removeElement(el: GeoSearch) {
        let index = self.geoSearches.wrappedValue.firstIndex(of: el);
        if (index != nil) {
            self.geoSearches.wrappedValue.remove(at: index!)
        }
    }
    
    var body: some View {
        Section {
            ForEach(geoSearches.wrappedValue, id: \.hashValue) {element in
                HStack {
                    Text(element.geoSearchQuery + ", " + element.region)
                    Spacer()
                    Button {
                        removeElement(el: element)
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(Color(.systemRed))
                    }
                }
            }
            Button("Hinzufügen") {
                alertShown.toggle();
            }
            .alert("Neuer Ort", isPresented: $alertShown) {
                TextField("Ort eingeben", text: $searchQuery)
                TextField("Region eingenen", text: $region)
                HStack {
                    Button("Abbrechen", action: cancelAddAction)
                    Button("Hinzufügen", action: addToGeoSearches)
                }
            }
        } header: {
            Text("Orte")
        }
    }
}
