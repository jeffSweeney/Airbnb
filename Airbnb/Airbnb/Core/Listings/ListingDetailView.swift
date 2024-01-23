//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import MapKit
import SwiftUI

struct ListingDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.7617,
                                                                                  longitude: -80.1918),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                          longitudeDelta: 0.05))
    
    var body: some View {
        ScrollView {
            // MARK: Carousel
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }

            }
            
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
                .scrollTargetBehavior(.paging)
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
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Map(coordinateRegion: $region)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .modifier(LeadingEdgeModifier())
            .padding(.vertical)
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                .padding(.horizontal, 32)
            }
            .background(colorScheme == .dark ? .black : .white)
        }
    }
}

#Preview {
    ListingDetailView()
        .preferredColorScheme(.dark)
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
