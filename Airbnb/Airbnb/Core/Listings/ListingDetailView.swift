//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import MapKit
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
            
            // MARK: Listing Bedrooms
            VStack(alignment: .leading) {
                Text("Where you'll sleep")
                    .font(.headline)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(1 ... 4, id: \.self) { bedroom in
                            BedroomCard(bedroomNumber: bedroom)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .modifier(LeadingEdgeModifier())
            .padding(.vertical)
            
            Divider()
            
            // MARK: Listing Offers
            VStack(alignment: .leading, spacing: 12) {
                Text("What this place offers")
                    .font(.headline)
                    .fontWeight(.bold)
                
                ForEach(ListingOffer.MOCK_OFFERS, id: \.self) { offer in
                    HStack {
                        Image(systemName: offer.sfSymbolName)
                            .frame(width: 30)
                        
                        Text(offer.offer)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }

            }
            .modifier(LeadingEdgeModifier())
            .padding(.vertical)
            
            Divider()
            
            // MARK: Listing Location
            VStack(alignment: .leading) {
                Text("Where you'll be")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Map()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .modifier(LeadingEdgeModifier())
            .padding(.vertical)
            
            Divider()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
//        .preferredColorScheme(.dark)
}

// MARK: - Subviews
struct BedroomCard: View {
    let bedroomNumber: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "bed.double")
            
            Text("Bedroom \(bedroomNumber)")
                .font(.caption)
                .fontWeight(.semibold)
        }
        .padding()
        .frame(width: 140, height: 90, alignment: .leading)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 0.5)
        }
    }
}

// MARK: MOCK data Models
struct ListingFeature: Hashable {
    let sfSymbolName: String
    let title: String
    let subtitle: String
    
    static let MOCK_FEATURES: [Self] = [
        .init(sfSymbolName: "door.left.hand.open",
              title: "Self check-in",
              subtitle: "Check yourself in with the keypad."),
        .init(sfSymbolName: "medal",
              title: "Superhost",
              subtitle: "Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.")
    ]
}

struct ListingOffer: Hashable {
    let sfSymbolName: String
    let offer: String
    
    static let MOCK_OFFERS: [Self] = [
        .init(sfSymbolName: "wifi", offer: "Wifi"),
        .init(sfSymbolName: "checkerboard.shield", offer: "Alarm System"),
        .init(sfSymbolName: "building", offer: "Balcony"),
        .init(sfSymbolName: "washer", offer: "Laundry"),
        .init(sfSymbolName: "tv", offer: "TV"),
    ]
}
