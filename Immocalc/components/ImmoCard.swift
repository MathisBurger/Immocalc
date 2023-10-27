//
//  ImmoCard.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

/// Displays an object in a card
struct ImmoCard: View {
    var object: SearchObject!
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: object.images.first?.originalUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
                
            HStack {
                VStack(alignment: .leading) {
                    Text(object.title)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Divider().padding(.bottom)
                    HStack(alignment: .center, spacing: 20) {
                        TextWithTitle(text: String(object.buyingPrice) +  "€", title: "Kaufpreis")
                        TextWithTitle(text: String(object.squareMeter) + "m²", title: "Fläche")
                        TextWithTitle(text: String(object.grossReturn) + "%", title: "Rendite")
                        TextWithTitle(text: String(object.rooms), title: "Zimmer")
                    }
                }.layoutPriority(100)
                Spacer()
            }.padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}
