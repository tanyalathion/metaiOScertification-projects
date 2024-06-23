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
    var category: Category // Catégorie de l'élément
    var imageName: String // Nom de l'image dans le catalogue d'assets
    var name: String // Nom de l'élément
}

struct MenuItemsView: View {
    @State private var showingFilterSheet = false
    @State private var items: [MenuItem] = []
    @State private var selectedCategories: [Category] = []
    @State private var filteredItems: [MenuItem] = []
    
    let mockMenuItems: [MenuItem] = [
        MenuItem(category: .food, imageName: "item picture", name: "Plate 1"),
        MenuItem(category: .food, imageName: "item picture", name: "Plate 2"),
        MenuItem(category: .food, imageName: "item picture", name: "Plate 3"),
        MenuItem(category: .food, imageName: "item picture", name: "Plate 4"),
        MenuItem(category: .food, imageName: "item picture", name: "Plate 5"),
        MenuItem(category: .food, imageName: "item picture", name: "Plate 6"),
        MenuItem(category: .drinks, imageName: "item picture", name: "Drink 1"),
        MenuItem(category: .drinks, imageName: "item picture", name: "Drink 2"),
        MenuItem(category: .drinks, imageName: "item picture", name: "Drink 3"),
        MenuItem(category: .drinks, imageName: "item picture", name: "Drink 4"),
        MenuItem(category: .drinks, imageName: "item picture", name: "Drink 5"),
        MenuItem(category: .drinks, imageName: "item picture", name: "Drink 6"),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 1"),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 2"),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 3"),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4"),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 5"),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 6"),
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    CategoryGrid(category: .food, items: filteredItems.filter { $0.category == .food })
                    CategoryGrid(category: .drinks, items: filteredItems.filter { $0.category == .drinks })
                    CategoryGrid(category: .desserts, items: filteredItems.filter { $0.category == .desserts })
                }
                .padding()
            }
            .navigationTitle("Menu")
            .navigationBarItems(trailing:
                Button(action: {
                    showingFilterSheet.toggle()
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            )
            .sheet(isPresented: $showingFilterSheet) {
                MenuItemsOptionView(selectedCategories: $selectedCategories)
            }
            .onAppear {
                filteredItems = mockMenuItems
            }
        }
    }
}


struct CategoryGrid: View {
    let category: Category
    let items: [MenuItem]

    var body: some View {
        VStack(alignment: .leading) {
            Text(category.rawValue)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 5)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                ForEach(items) { item in
                    NavigationLink(destination: MenuItemDetailsView()) {
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
        }
        .padding(.bottom, 20)
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
