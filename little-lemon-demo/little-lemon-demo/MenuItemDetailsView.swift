//
//  MenuItemDetailsView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemDetailsView: View {
    let menuItem: MenuItem
    
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
                Text("\(menuItem.price, specifier: "%.2f")$")
                    .font(.headline)
                    .padding(.bottom, 10)
                Text("Ordered:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("\(menuItem.ordersCount)")
                    .font(.headline)
                    .padding(.bottom, 10)
                Text("Ingredients:")
                    .font(.headline)
                    .fontWeight(.bold)
                ForEach(menuItem.ingredients, id: \.self) { ingredient in
                    Text(ingredient.rawValue.capitalized)
                        .font(.headline)
                        .padding(.bottom, 10)
                }
                .navigationTitle(menuItem.name)
            }
        }
    }
}
