//
//  ImageSliderView.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct ImageSliderView: View {
    var images: [SearchObjectImage]
    var body: some View {
        TabView {
            ForEach(images, id: \.id) { item in
                AsyncImage(url: URL(string: item.originalUrl)) {image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}
