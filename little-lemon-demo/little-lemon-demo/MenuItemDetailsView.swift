//
//  MenuItemDetailsView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemDetailsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("Little Lemon logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 100)
                Text("Price:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("some prices to do")
                    .font(.headline)
                    .padding(.bottom, 10)
                Text("Ordered:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("A number to find")
                    .font(.headline)
                    .padding(.bottom, 10)
                Text("Ingredients:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("some ingredients to do")
                    .font(.headline)
                    .padding(.bottom, 10)
            }
            .navigationTitle("Food 5")
        }
    }
}

#Preview  {
    MenuItemDetailsView()
}
