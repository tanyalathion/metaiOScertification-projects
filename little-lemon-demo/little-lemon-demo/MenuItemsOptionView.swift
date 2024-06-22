//
//  MenuItemsOptionView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemsOptionView: View {
    @Binding var selectedCategories: [Category]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("SELECTED CATEGORIES")) {
                    ForEach(Category.allCases, id: \.self) { category in
                    Button(action: {
                        if selectedCategories.contains(category) {
                        selectedCategories.removeAll { $0 == category }
                        } else {
                            selectedCategories.append(category)
                            }
                        }) {
                        HStack {
                            Text(category.rawValue)
                            Spacer()
                            if selectedCategories.contains(category) {
                                Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                            }
                        }
                        }
                    }
                }
                Section(header: Text("SORT BY")) {
                    ForEach(SortOption.allCases, id: \.self) { option in
                    Text(option.rawValue)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Filter")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    private func applyFilters() {
        // Dismiss the view and apply filters to MenuItemsView
        presentationMode.wrappedValue.dismiss()
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedCategories = Binding.constant([Category.food])
        return MenuItemsOptionView(selectedCategories: selectedCategories)
    }
}
