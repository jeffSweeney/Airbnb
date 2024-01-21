//
//  ListingImageCarouselView.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    // MOCK
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
        "listing-5",
        "listing-6",
        "listing-7",
        "listing-8",
    ]
    
    let height: CGFloat
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: height)
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(height: 320)
}
