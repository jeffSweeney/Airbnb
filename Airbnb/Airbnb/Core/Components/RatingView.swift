//
//  RatingView.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .imageScale(.small)
            
            Text("4.86")
        }
    }
}

#Preview {
    RatingView()
}
