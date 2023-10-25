//
//  NavigationRow.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct NavigationRow: View {
    var text: String;
    var icon: Image;
    
    var body: some View {
        HStack {
            icon
            Text(text)
        }
    }
}

struct NavigationRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationRow(text: "Test", icon: Image(systemName: "wifi"))
    }
}
