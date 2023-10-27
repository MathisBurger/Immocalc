//
//  BaseDataList.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

/// Displays all the base data of the search object
struct BaseDataList: View {
    var object: SearchObject
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 40) {
                TextWithTitle(text: String(object.buyingPrice) + "€", title: "Kaufpreis")
                TextWithTitle(text: String(object.squareMeter) + "m²", title: "Größe")
                TextWithTitle(text: String(object.rooms), title: "Zimmer")
            }
            Spacer()
            HStack(alignment: .center, spacing: 20) {
                BooleanWithTitle(status: object.lift, title: "Aufzug")
                BooleanWithTitle(status: object.cellar, title: "Internet")
                BooleanWithTitle(status: object.balcony, title: "Balkon")
                BooleanWithTitle(status: object.garden, title: "Garten")
                BooleanWithTitle(status: object.rented, title: "Vermietet")
            }
        }
        
    }
}
