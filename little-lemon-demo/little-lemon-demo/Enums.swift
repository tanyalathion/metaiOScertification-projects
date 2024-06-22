//
//  Enums.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 23.06.2024.
//

import Foundation
enum Category: String, CaseIterable {
    case food = "Food"
    case drinks = "Drinks"
    case desserts = "Desserts"
}

enum SortOption: String, CaseIterable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetical = "A-Z"
}
