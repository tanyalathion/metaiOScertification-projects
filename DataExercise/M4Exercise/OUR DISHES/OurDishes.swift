import SwiftUI
import CoreData

struct OurDishes: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    @State var searchText = ""
    
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.bottom, 10)
                .padding(.top, 50)
            
            Text ("Tap to order")
                .foregroundColor(.black)
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color("approvedYellow"))
                .cornerRadius(20)
            
            
            NavigationView {
                FetchedObjects(
                    predicate:buildPredicate(),
                    sortDescriptors: buildSortDescriptors()) {
                        (dishes: [Dish]) in
                        List {
                            ForEach(dishes, id: \.self) { dish in
                                DisplayDish(dish)
                                                            .onTapGesture {
                                                                showAlert.toggle()
                                                            }
                                                    }
                        }
                        .searchable(text: $searchText, prompt: "Search for dishes")
                    }
            }
            
            
            // SwiftUI has this space between the title and the list
            // that is amost impossible to remove without incurring
            // into complex steps that run out of the scope of this
            // course, so, this is a hack, to bring the list up
            // try to comment this line and see what happens.
            .padding(.top, -10)//
            
            .alert("Order placed, thanks!",
                   isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            
            // makes the list background invisible, default is gray
                   .scrollContentBackground(.hidden)
            
            // runs when the view appears
                   .task {
                       await dishesModel.reload(viewContext)
                   }
            
        }
    }
    
    func buildPredicate() -> NSPredicate {
        guard !searchText.isEmpty else {
            return NSPredicate(value: true)
        }
        let cleanedSearchText = searchText
        .folding(options: .diacriticInsensitive, locale: .current)
        .lowercased()
              
        let predicateFormat = "name CONTAINS[c] %@"

        return NSPredicate(format: predicateFormat, cleanedSearchText)
        }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "name",
                          ascending: true,
                          selector:
                            #selector(NSString.localizedStandardCompare))]
    }
}

struct OurDishes_Previews: PreviewProvider {
    static var previews: some View {
        OurDishes().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            }
}






