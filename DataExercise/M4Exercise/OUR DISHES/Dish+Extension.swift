import Foundation
import CoreData


extension Dish {
    static func fetchRequest(forTitle title: String) -> NSFetchRequest<Dish> {
            let request = NSFetchRequest<Dish>(entityName: "Dish")
            request.predicate = NSPredicate(format: "name == %@", title)
            return request
        }

    static func exists(title: String,_ context:NSManagedObjectContext) -> Bool? {
        let request = Dish.fetchRequest()
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", title)
        request.predicate = predicate
            
        do {
            let results = try context.fetch(request)
            return results.count > 0
        } catch (let error){
            print(error.localizedDescription)
            return false
            }
    }

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            if !exists(title: menuItem.title, context)! {
                let dish = Dish(context: context)
                dish.name = menuItem.title
                dish.price = Float(Double(menuItem.price) ?? 0.0)
            }
        }
        
        do {
            try context.save()
        } catch {}
        
    }
    
}
