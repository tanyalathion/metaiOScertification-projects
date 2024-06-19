//
//  ContentView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // Image depuis le catalogue d'assets
                Image("Little Lemon logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()

                // Bouton "Check the menu"
                NavigationLink(destination: MenuItemsView()) {
                    Text("Check the menu")
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color.black)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle()) // Utilisation de PlainButtonStyle pour éviter l'effet de style par défaut de NavigationLink
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
