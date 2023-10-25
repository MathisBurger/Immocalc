//
//  ContentView.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    SearchView()
                } label: {
                    NavigationRow(text: "Alle Objekte", icon: Image(systemName: "magnifyingglass"))
                }
                NavigationLink {
                    SearchSettingsView()
                } label: {
                    NavigationRow(text: "Suche bearbeiten", icon: Image(systemName: "gear"))
                }
            }.navigationTitle("Start")
        } detail: {
            Text("Select next step")
        }
    }
}
