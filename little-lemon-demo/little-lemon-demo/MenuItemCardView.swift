//
//  MenuItemCardView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 24.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemCardView: View {
    let menuItem: MenuItem
    var body: some View {
        NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
            VStack {
                Image(menuItem.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
                Text(menuItem.name)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                Text(String(menuItem.price))
                    .font(.caption2)
                    .padding(.top, 2)
            }
            .padding(5)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

