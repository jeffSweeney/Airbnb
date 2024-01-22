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
            VStack(alignment: .leading, spacing: 16) {
                ForEach(ListingFeature.MOCK_FEATURES, id: \.self) { feature in
                    HStack(spacing: 16) {
                        Image(systemName: feature.sfSymbolName)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.bold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .lineLimit(2)
                                .minimumScaleFactor(0.75)
                        }
                    }
                }
            }
            .modifier(LeadingEdgeModifier())
            .padding(.vertical)
            
            Divider()
            
            // MARK: Listing Features
            Text("TODO: Implement")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
//        .preferredColorScheme(.dark)
}

// MARK: MOCK data
struct ListingFeature: Hashable {
    let sfSymbolName: String
    let title: String
    let subtitle: String
    
    static var MOCK_FEATURES: [Self] = [
        .init(sfSymbolName: "door.left.hand.open",
              title: "Self check-in",
              subtitle: "Check yourself in with the keypad."),
        .init(sfSymbolName: "medal",
              title: "Superhost",
              subtitle: "Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.")
    ]
}
