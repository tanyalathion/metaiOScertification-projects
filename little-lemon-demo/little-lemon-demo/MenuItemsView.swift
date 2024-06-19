//
//  MenuItemsView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Menu Items View")
                    .font(.largeTitle)
                
                Spacer()
            }
            .navigationBarTitle("Menu Items")
            .navigationBarItems(trailing:
                Button(action: {
                    // Action lorsque le bouton est pressé
                    showMenuOptions()
                }) {
                    Image(systemName: "gear")
                }
            )
        }
    }

    func showMenuOptions() {
        NavigationLink(destination: MenuItemsOptionView()) {
            EmptyView() // Utilisation de EmptyView pour cacher le lien de navigation visible
        }
    }
}
