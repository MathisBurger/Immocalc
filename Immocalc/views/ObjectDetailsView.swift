//
//  ObjectDetailsView.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

/// Displays all object details
struct ObjectDetailsView: View {
    var object: SearchObject
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ImageSliderView(images: object.images)
                Spacer()
                Text(object.title)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                Divider()
                Spacer()
                Headline(text: "Grunddaten")
                BaseDataList(object: object)
                Divider()
                Spacer()
            }
            VStack(alignment: .center) {
                Headline(text: "Finanzdaten")
                FinanceDataList(object: object)
                Divider()
                Spacer()
            }
            VStack(alignment: .center) {
                Headline(text: "Standortanalyse")
                LocationDataList(object: object)
                Divider()
                Spacer()
            }
            VStack(alignment: .center) {
                Headline(text: "ROI Analyse")
                RoiDataList(object: object)
                Divider()
                Spacer()
            }
            .toolbar {
                if (!object.platforms.isEmpty) {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("Zum Angebot") {
                            if let url = URL(string: object.platforms[0].url) {
                               UIApplication.shared.open(url)
                            }
                        }
                    }
                }
            }
        }
    }
}
