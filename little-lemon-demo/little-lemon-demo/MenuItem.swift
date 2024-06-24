//
//  MenuItem.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 24.06.2024.
//

import Foundation
import SwiftUI

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var image: String {get}
    var category: MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredient] { get }
}

struct MenuItem: Identifiable {
    var id = UUID()
    let category: MenuCategory // Catégorie de l'élément
    let imageName: String // Nom de l'image dans le catalogue d'assets
    let name: String // Nom de l'élément
    let ingredients: [Ingredient]
    let price: Double
    var ordersCount: Int = 0
}
