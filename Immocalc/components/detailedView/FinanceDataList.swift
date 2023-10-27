//
//  FinanceDataList.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct FinanceDataList: View {
    var object: SearchObject
    
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 40) {
                TextWithTitle(text: String(object.grossReturn)+"%", title: "Rendite")
                TextWithTitle(text: String(object.rentPricePerSqm)+"€", title: "Preis/m²")
                TextWithTitle(text: object.rentPrice != nil ? String(object.rentPrice!) + "€" : "-/-", title: "Miete")
            }
            Spacer()
            HStack(alignment: .center, spacing: 40) {
                TextWithTitle(text: object.grossReturnCurrent != nil ? String(object.grossReturnCurrent!)+"%" : "-/-", title: "Aktuelle Rendite")
                TextWithTitle(text: object.comission != nil ? String(object.comission!)+"€" : "-/-", title: "Provision")
                TextWithTitle(text: object.rentPriceCurrent != nil ? String(object.rentPriceCurrent!) + "€" : "-/-", title: "Aktuelle Miete")
            }
        }
    }
}
