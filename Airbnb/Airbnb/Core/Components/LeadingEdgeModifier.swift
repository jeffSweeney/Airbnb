//
//  LeadingEdgeModifier.swift
//  Airbnb
//
//  Created by Jeffrey Sweeney on 1/21/24.
//

import SwiftUI

struct LeadingEdgeModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
    }
}
