//
//  MenuItemsView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var category: String // Catégorie de l'élément
    var imageName: String // Nom de l'image dans le catalogue d'assets
    var name: String // Nom de l'élément
}

struct MenuItemsView: View {
    let mockMenuItems: [MenuItem] = [
            MenuItem(category: "Food", imageName: "item picture", name: "Plate 1"),
            MenuItem(category: "Food", imageName: "item picture", name: "Plate 2"),
            MenuItem(category: "Food", imageName: "item picture", name: "Plate 3"),
            MenuItem(category: "Food", imageName: "item picture", name: "Plate 4"),
            MenuItem(category: "Food", imageName: "item picture", name: "Plate 5"),
            MenuItem(category: "Food", imageName: "item picture", name: "Plate 6"),
            MenuItem(category: "Drinks", imageName: "item picture", name: "Drink 1"),
            MenuItem(category: "Drinks", imageName: "item picture", name: "Drink 2"),
            MenuItem(category: "Drinks", imageName: "item picture", name: "Drink 3"),
            MenuItem(category: "Drinks", imageName: "item picture", name: "Drink 4"),
            MenuItem(category: "Drinks", imageName: "item picture", name: "Drink 5"),
            MenuItem(category: "Drinks", imageName: "item picture", name: "Drink 6"),
            MenuItem(category: "Desserts", imageName: "item picture", name: "Dessert 1"),
            MenuItem(category: "Desserts", imageName: "item picture", name: "Dessert 2"),
            MenuItem(category: "Desserts", imageName: "item picture", name: "Dessert 3"),
            MenuItem(category: "Desserts", imageName: "item picture", name: "Dessert 4"),
            MenuItem(category: "Desserts", imageName: "item picture", name: "Dessert 5"),
            MenuItem(category: "Desserts", imageName: "item picture", name: "Dessert 6"),
            // Ajouter d'autres éléments fictifs selon les besoins
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    CategoryGrid(category: "Food", items: mockMenuItems.filter { $0.category == "Food" })
                    CategoryGrid(category: "Drinks", items: mockMenuItems.filter { $0.category == "Drinks" })
                    CategoryGrid(category: "Desserts", items: mockMenuItems.filter { $0.category == "Desserts" })
                }
                .padding()
            }
        }
        .navigationBarTitle("Menu")
        .navigationBarItems(trailing:
            NavigationLink(destination: MenuItemsOptionView()) {
                Image(systemName: "line.horizontal.3.decrease.circle")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            }
        )
    }
}

struct CategoryGrid: View {
    let category: String
    let items: [MenuItem]

    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 5)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(items) { item in
                    VStack {
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)

                        Text(item.name)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .padding(5)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
        }
        .padding(.bottom, 20)
    }
}
