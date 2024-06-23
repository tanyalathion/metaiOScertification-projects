//
//  Ingredient.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 23.06.2024.
//

import Foundation

enum Ingredient {
    case spinach
    case broccoli
    case carrot
    case pasta
    case tomatoSauce
    case chocolate
    case cream
    case apple
    case lemon
    
    var description: String {
        switch self {
        case .spinach:
            return "Spinach"
        case .broccoli:
            return "Broccoli"
        case .carrot:
            return "Carrot"
        case .pasta:
            return "Pasta"
        case .tomatoSauce:
            return "Tomato Sauce"
        case.chocolate:
            return "Chocolate"
        case.cream:
            return "Cream"
        case.apple:
            return "Apple"
        case.lemon:
            return "Lemon"
        }
    }
}
