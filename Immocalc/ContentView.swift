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
                    HistoryView()
                } label: {
                    NavigationRow(text: "History", icon: Image(systemName: "wifi"))
                }
                NavigationLink {
                    CalculateView()
                } label: {
                    NavigationRow(text: "Calculate", icon: Image(systemName: "speaker"))
                }
                NavigationLink {
                    SearchView()
                } label: {
                    NavigationRow(text: "Search", icon: Image(systemName: "search"))
                }
            }.navigationTitle("Start")
        } detail: {
            Text("Select next step")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
