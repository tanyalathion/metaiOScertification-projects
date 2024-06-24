//
//  MenuCategory.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 23.06.2024.
//

import Foundation

class MenuViewViewModel: ObservableObject {
    // Propriétés pour chaque catégorie d'éléments de menu
    @Published var foodItems: [MenuItem]
    @Published var drinkItems: [MenuItem]
    @Published var dessertItems: [MenuItem]
    
    init() {
        // Exemple : Initialisation des éléments du menu pour chaque catégorie
        foodItems = [
            MenuItem(category: .food, imageName: "item picture", name: "Plate 1", ingredients: [.spinach, .pasta]),
            MenuItem(category: .food, imageName: "item picture", name: "Plate 2", ingredients: [.spinach, .broccoli, .carrot]),
            MenuItem(category: .food, imageName: "item picture", name: "Plate 3", ingredients: [.pasta, .tomatoSauce]),
            MenuItem(category: .food, imageName: "item picture", name: "Plate 4", ingredients: [.broccoli, .carrot]),
            MenuItem(category: .food, imageName: "item picture", name: "Plate 5", ingredients: [.spinach, .broccoli, .carrot, .pasta, .tomatoSauce]),
            MenuItem(category: .food, imageName: "item picture", name: "Plate 6", ingredients: []),
        ]
        
        drinkItems = [
            MenuItem(category: .drinks, imageName: "item picture", name: "Drink 1", ingredients: []),
            MenuItem(category: .drinks, imageName: "item picture", name: "Drink 2", ingredients: []),
            MenuItem(category: .drinks, imageName: "item picture", name: "Drink 3", ingredients: []),
            MenuItem(category: .drinks, imageName: "item picture", name: "Drink 4", ingredients: []),
            MenuItem(category: .drinks, imageName: "item picture", name: "Drink 5", ingredients: []),
            MenuItem(category: .drinks, imageName: "item picture", name: "Drink 6", ingredients: []),
        ]
        
        dessertItems = [
            MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 1", ingredients: [.chocolate, .apple]),
            MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 2", ingredients: [.apple, .cream]),
            MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 3", ingredients: [.chocolate, .lemon]),
            MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4", ingredients: [.chocolate,.cream]),
        ]
    }
}

let mockMenuItems: [MenuItem] = [
    MenuItem(category: .food, imageName: "item picture", name: "Plate 1", ingredients: [.spinach, .pasta]),
    MenuItem(category: .food, imageName: "item picture", name: "Plate 2", ingredients: [.spinach, .broccoli, .carrot]),
    MenuItem(category: .food, imageName: "item picture", name: "Plate 3", ingredients: [.pasta, .tomatoSauce]),
    MenuItem(category: .food, imageName: "item picture", name: "Plate 4", ingredients: [.broccoli, .carrot]),
    MenuItem(category: .food, imageName: "item picture", name: "Plate 5", ingredients: [.spinach, .broccoli, .carrot, .pasta, .tomatoSauce]),
    MenuItem(category: .food, imageName: "item picture", name: "Plate 6", ingredients: []),
    MenuItem(category: .drinks, imageName: "item picture", name: "Drink 1", ingredients: []),
    MenuItem(category: .drinks, imageName: "item picture", name: "Drink 2", ingredients: []),
    MenuItem(category: .drinks, imageName: "item picture", name: "Drink 3", ingredients: []),
    MenuItem(category: .drinks, imageName: "item picture", name: "Drink 4", ingredients: []),
    MenuItem(category: .drinks, imageName: "item picture", name: "Drink 5", ingredients: []),
    MenuItem(category: .drinks, imageName: "item picture", name: "Drink 6", ingredients: []),
    MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 1", ingredients: [.chocolate, .apple]),
    MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 2", ingredients: [.apple, .cream]),
    MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 3", ingredients: [.chocolate, .lemon]),
    MenuItem(category: .desserts, imageName: "item picture", name: "Dessert 4", ingredients: [.chocolate,.cream]),
    ]
