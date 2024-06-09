enum Ingredient: String{
    case frites="Frites"
    case burger="Cheeseburger"
    case dessert="Compote de fruits"
    case boisson="Coca Zéro"
    case jeu="Livre"
}
let ingredient = Ingredient.burger

switch ingredient {
    case .frites: print("Je vais prendre des \(ingredient.rawValue).")
    case .burger: print("J'aimerais un HappyMeal \(ingredient.rawValue).")
    case .dessert: print("Mettez-moi la \(ingredient.rawValue) comme dessert.")
    case .boisson: print("Comme boisson, je vais prendre un \(ingredient.rawValue).")
    case .jeu: print("Et donnez-moi plutôt le \(ingredient.rawValue) en cadeau.")
}

enum MealInformation {
    case choices(information: String)
}

let mealInformation = MealInformation.choices(information: "Une boisson, un dessert, un cadeau")

switch mealInformation {
case .choices (let information): print("Vous devez choisir: \(information).")
}
