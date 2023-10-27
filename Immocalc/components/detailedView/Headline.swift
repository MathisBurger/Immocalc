//
//  Headline.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

/// Displays text as a headline in the detailed view
struct Headline: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.black)
            .foregroundColor(.primary)
    }
}
