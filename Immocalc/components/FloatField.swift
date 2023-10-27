//
//  FloatField.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import SwiftUI

/// Displays a float with a title
struct FloatField: View {
    let text: String;
    let binding: Binding<Float>
    var body: some View {
        VStack {
            Text(text)
                .font(.footnote)
                .fontWeight(.light)
            TextField(text, value: binding, format: .number)
        }
    }
}
