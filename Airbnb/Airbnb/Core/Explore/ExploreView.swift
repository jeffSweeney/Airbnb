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
            SearchAndFilterBar()
            
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0...10, id: \.self) { listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                                .foregroundStyle(Color.primary)
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self) { listing in
                Text("Listing detail view \(listing)")
            }
        }
    }
}

#Preview {
    ExploreView()
}
