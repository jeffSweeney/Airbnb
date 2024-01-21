//
//  ExploreView.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0...10, id: \.self) { listing in
                        ListingItemView()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
