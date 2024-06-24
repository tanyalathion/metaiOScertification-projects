//
//  MenuItemsView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemsView: View {
    @ObservedObject var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if viewModel.selectedCategory == .all || viewModel.selectedCategory == .food {
                        HStack {
                            Text("Food")
                                .font(.headline)
                                .padding([.leading, .top])
                            Spacer() // Push the text to the left
                        }
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                            ForEach(viewModel.menuItems.filter { $0.category == .food }) { item in
                                MenuItemCardView(menuItem: item)
                            }
                        }
                    }
                    
                    if viewModel.selectedCategory == .all || viewModel.selectedCategory == .drinks {
                        HStack {
                            Text("Drinks")
                                .font(.headline)
                                .padding([.leading, .top])
                            Spacer() // Push the text to the left
                        }
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                            ForEach(viewModel.menuItems.filter { $0.category == .drinks }) { item in
                                MenuItemCardView(menuItem: item)
                            }
                        }
                    }
                    
                    if viewModel.selectedCategory == .all || viewModel.selectedCategory == .desserts {
                        HStack {
                            Text("Desserts")
                                .font(.headline)
                                .padding([.leading, .top])
                            Spacer() // Push the text to the left
                        }
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                            ForEach(viewModel.menuItems.filter { $0.category == .desserts }) { item in
                                MenuItemCardView(menuItem: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .navigationBarItems(trailing: Button(action: {
                viewModel.showFilterOptions.toggle()
            }) {
                Image(systemName: "slider.horizontal.3")
            })
            .sheet(isPresented: $viewModel.showFilterOptions) {
                MenuItemsOptionView(viewModel: viewModel)
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
