//
//  SortByInput.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import SwiftUI

/// Input field for input sorting
struct SortByInput: View {
    var selection: Binding<String>
    @State private var sortObject = "leasehold";
    @State private var sortDirection = "desc";
    
    /// Updates the selected data in the parent element
    private func updateSelectionData() {
        let splitArray = self.selection.wrappedValue.components(separatedBy: ",");
        self.sortObject = splitArray[0];
        self.sortDirection = splitArray[1];
    }
    
    var body: some View {
        Section {
            Picker(selection: $sortObject) {
                Text("Pachtobject").tag("leasehold")
                Text("Zwangsversteigerung").tag("foreClosure")
                Text("Neues Gebäude").tag("newBuilding")
                Text("Rendite").tag("grossReturn")
            } label: {
                Text("Objekt")
            }
            Picker(selection: $sortDirection) {
                Text("DESC").tag("desc")
                Text("ASC").tag("asc")
            } label: {
                Text("Richtung")
            }
        } header: {
            Text("Sortieren nach")
        }.onAppear() {
            self.updateSelectionData();
        }
        .onChange(of: selection.wrappedValue) { newSelection in 
            self.updateSelectionData();
        }
        .onChange(of: sortObject) {newSortObject in
            self.selection.wrappedValue = newSortObject + "," + self.sortDirection;
        }
        .onChange(of: sortDirection) {newSortDirection in
            self.selection.wrappedValue = self.sortObject + "," + newSortDirection;
        }
    }
}
