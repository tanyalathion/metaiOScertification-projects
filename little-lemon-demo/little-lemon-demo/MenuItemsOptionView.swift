import SwiftUI

struct MenuItemsOptionView: View {
    @ObservedObject var viewModel: MenuViewViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SELECTED CATEGORY")) {
                    ForEach(MenuCategory.allCases, id: \.self) { category in
                        HStack {
                            Text(category.rawValue)
                            Spacer()
                            if category == viewModel.selectedCategory {
                                Image(systemName: "checkmark")
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.updateCategory(category)
                        }
                    }
                }

                Section(header: Text("SORT BY")) {
                    ForEach(SortOption.allCases, id: \.self) { option in
                        HStack {
                            Text(option.rawValue)
                            Spacer()
                            if option == viewModel.sortOption {
                                Image(systemName: "checkmark")
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.updateSortOption(option)
                        }
                    }
                }
            }
            .navigationBarTitle("Filter", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    @StateObject static var viewModel = MenuViewViewModel()
    
    static var previews: some View {
        MenuItemsOptionView(viewModel: viewModel)
    }
}

