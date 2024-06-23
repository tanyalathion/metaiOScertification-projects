//
//  MenuItemsView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemsView: View {
    @State private var showingFilterSheet = false
    @State private var items: [MenuItem] = []
    @State private var selectedCategories: [Category] = []
    @State private var filteredItems: [MenuItem] = []
    
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
