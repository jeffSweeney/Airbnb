//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import SwiftUI

struct ListingDetailView: View {
    var body: some View {
        ScrollView {
            // MARK: Carousel
            ListingImageCarouselView(height: 320)
            
            // MARK: Listing & Reviews
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 2) {
                        RatingView()
                        
                        Text("-")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .modifier(LeadingEdgeModifier())
            
            Divider()
            
            // MARK: Lister & Details
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Group {
                        Text("Entire villa hosted by")
                        Text("John Smith")
                    }
                    .font(.headline)
                    
                    Text("4 guests - 4 bedrooms - 4 beds - 3 baths")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Image("male-profile-photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            .modifier(LeadingEdgeModifier())
            .padding(.vertical)
            
            Divider()
            
            // MARK: Listing Features
            Text("TODO: Implement")
            
            Divider()
            
            // MARK: Listing Configurations
            Text("TODO: Implement")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
        .preferredColorScheme(.dark)
}
