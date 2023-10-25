//
//  TextWithTitle.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct TextWithTitle: View {
    var text: String
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.footnote)
                .fontWeight(.light)
            Text(text)
        }
    }
}
