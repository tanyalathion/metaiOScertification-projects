//
//  MenuCategory.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 23.06.2024.
//

import Foundation

class MenuViewViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = mockMenuItems
    @Published var selectedCategory: MenuCategory = .all
    @Published var sortOption: SortOption = .mostPopular
    @Published var showFilterOptions: Bool = false
    
    var sortedAndFilteredItems: [MenuItem] {
        var filteredItems: [MenuItem]
        
        switch selectedCategory {
        case .all:
            filteredItems = menuItems
        case .food:
            filteredItems = menuItems.filter { $0.category == .food }
        case .drinks:
            filteredItems = menuItems.filter { $0.category == .drinks }
        case .desserts:
            filteredItems = menuItems.filter { $0.category == .desserts }
        }
        
        enum SortOption: String, CaseIterable {
            case mostPopular = "Most Popular"
            case price = "Price $-$$$"
            case aToZ = "A-Z"
        }
        return filteredItems
    }
    
    func updateCategory(_ category: MenuCategory) {
        selectedCategory = category
    }
    
    func updateSortOption(_ option: SortOption) {
        sortOption = option
    }
    
    
}

let mockFoodItems: [MenuItem] = [
    MenuItem(category: .food, imageName: "item picture", name: "Carbonnara", ingredients: [.bacon, .pasta, .eggs], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Fondue", ingredients: [.cheese, .bread], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Raclette", ingredients: [.cheese, .potatoes], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Burger", ingredients: [.beef, .bread, .potatoes], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Meat and Vegetables", ingredients: [.spinach, .broccoli, .carrot, .beef], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Full prot plate", ingredients: [.beef, .eggs], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Bolo Pasta", ingredients: [.pasta, .tomatoSauce, .beef], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Morning Plate", ingredients: [.eggs, .bacon], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Alpen Macaroni", ingredients: [.pasta, .bacon, .cheese, .cream], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Vegan Plate", ingredients: [.carrot, .bread, .broccoli, .spinach], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Diet Raclette", ingredients: [.cheese], price: 12.99, ordersCount: 10),
    MenuItem(category: .food, imageName: "item picture", name: "Simple Pasta", ingredients: [.pasta, .butter], price: 12.99, ordersCount: 10),
    ]
    
let mockDrinkItems: [MenuItem] = [
    MenuItem(category: .drinks, imageName: "item picture", name: "Coke", ingredients: [.soft], price: 2.99, ordersCount: 108),
    MenuItem(category: .drinks, imageName: "item picture", name: "Ice Tea", ingredients: [.soft], price: 2.99, ordersCount: 165),
    MenuItem(category: .drinks, imageName: "item picture", name: "Lemonade", ingredients: [.soft], price: 1.99, ordersCount: 202),
    MenuItem(category: .drinks, imageName: "item picture", name: "Beer", ingredients: [.alcool], price: 3.50, ordersCount: 89),
    MenuItem(category: .drinks, imageName: "item picture", name: "Red Wine", ingredients: [.alcool], price: 4.5, ordersCount: 34),
    MenuItem(category: .drinks, imageName: "item picture", name: "White Wine", ingredients: [.alcool], price: 4.5, ordersCount: 47),
    ]
    
let mockDessertItems: [MenuItem] = [
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 1", ingredients: [.chocolate, .apple], price: 12.99, ordersCount: 10),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 2", ingredients: [.apple, .cream], price: 12.99, ordersCount: 10),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 3", ingredients: [.chocolate, .lemon], price: 12.99, ordersCount: 10),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4", ingredients: [.chocolate,.cream], price: 12.99, ordersCount: 10),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4", ingredients: [.chocolate,.cream], price: 12.99, ordersCount: 10),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4", ingredients: [.chocolate,.cream], price: 12.99, ordersCount: 10),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4", ingredients: [.chocolate,.cream], price: 12.99, ordersCount: 10),
        MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4", ingredients: [.chocolate,.cream], price: 12.99, ordersCount: 10),
    ]

let mockMenuItems: [MenuItem] = mockFoodItems + mockDrinkItems + mockDessertItems
