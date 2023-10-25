//
//  SearchView.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct SearchView: View {
    @State var objects = [SearchObject]();
    @StateObject var settingsStore = SearchSettingsStore();
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if (settingsStore.searchSettings != nil) {
                        ForEach(objects) { object in
                            NavigationLink {
                                ObjectDetailsView(object: object)
                            } label: {
                                ImmoCard(object: object)
                            }
                        }
                    } else {
                        Text("Es existieren keine Sucheinstellungen")
                    }
                }.navigationBarTitle(Text("Objekte"), displayMode:.automatic)
                .onChange(of: settingsStore.searchSettings) { newValue in
                    ApiService(searchSettings: newValue).getSearchResults { searchObjects in
                            self.objects = searchObjects;
                    }
                }
                .onAppear() {
                    if (settingsStore.searchSettings != nil) {
                        ApiService(searchSettings: settingsStore.searchSettings).getSearchResults { searchObjects in
                                self.objects = searchObjects;
                        }
                    }
                }
            }
        }.task {
            do {
                try await settingsStore.load();
            } catch {
                // nothing happend
            }
        }
    }
}
