//
//  SearchView.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct SearchView: View {
    @State var objects = [SearchObject]();
    
    
    var body: some View {
        VStack {
            ForEach(objects) { object in
                ImmoCard(object: object)
            }
        }.navigationBarTitle(Text("Objects"), displayMode:.automatic)
        .onAppear() {
                ApiService().getSearchResults { searchObjects in
                    self.objects = searchObjects;
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
