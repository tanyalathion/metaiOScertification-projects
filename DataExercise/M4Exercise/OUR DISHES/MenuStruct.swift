import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]

    enum CodingKeys: String, CodingKey {
        case menu
    }
}


struct MenuItem: Codable, Hashable, Identifiable {
    let id = UUID() // Identifiant unique pour chaque élément du menu
    
    let title: String
    let price: String

    enum CodingKeys: String, CodingKey {
        case title
        case price
    }
}
