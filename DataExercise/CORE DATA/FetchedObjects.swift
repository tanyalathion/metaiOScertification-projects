import Foundation
import SwiftUI
import CoreData

struct FetchedObjects<Dish, Content>: View where Dish : NSManagedObject, Content : View {
    
  let content: ([Dish]) -> Content

  var request: FetchRequest<Dish>
  var results: FetchedResults<Dish>{ request.wrappedValue }
    
  init(
    predicate: NSPredicate = NSPredicate(value: true),
    sortDescriptors: [NSSortDescriptor] = [],
    @ViewBuilder content: @escaping ([Dish]) -> Content
  ) {
    self.content = content
    self.request = FetchRequest(
      entity: Dish.entity(),
      sortDescriptors: sortDescriptors,
      predicate: predicate
    )
  }
  
  
  var body: some View {
    self.content(results.map { $0 })
  }
  
  
}
