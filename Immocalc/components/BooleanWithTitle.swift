//
//  BooleanWithTitle.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct BooleanWithTitle: View {
    var status: Bool
    var title: String
    
    var body: some View {
        TextWithTitle(text: status ? "Ja" : "Nein", title: title)
    }
}
