//
//  IntegerField.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import SwiftUI

/// Input field for integer values
struct IntegerField: View {
    let text: String;
    let binding: Binding<Int>
    var body: some View {
        VStack {
            Text(text)
                .font(.footnote)
                .fontWeight(.light)
            TextField(text, value: binding, format: .number)
        }
    }
}
