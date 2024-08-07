import Foundation
import CoreData


extension Dish {
    static func fetchRequest(forTitle title: String) -> NSFetchRequest<Dish> {
            let request = NSFetchRequest<Dish>(entityName: "Dish")
            request.predicate = NSPredicate(format: "name == %@", title)
            return request
        }

        static func exists(title: String, context: NSManagedObjectContext) -> Bool {
            let request = fetchRequest(forTitle: title)
            do {
                let count = try context.count(for: request)
                return count > 0
            } catch {
                print("Error checking existence of dish: \(error)")
                return false
            }
        }

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            if !exists(title: menuItem.title, context: context) {
                let dish = Dish(context: context)
                dish.name = menuItem.title
                dish.price = menuItem.price
            }
        }
        
        do {
            try context.save()
        } catch {}
        
    }
    
}
