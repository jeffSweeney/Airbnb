//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import SwiftUI

struct ListingItemView: View {
    // MOCK
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.bold)
                    
                    Group {
                        Text("12 mi away")
                        
                        Text("Nov 3-10")
                    }
                    .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                    
                    Text("4.86")
                }
            }
            .font(.footnote)
            
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
