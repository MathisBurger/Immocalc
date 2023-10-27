//
//  NavigationRow.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

/// A nav row displays all important data of a navigation row
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
