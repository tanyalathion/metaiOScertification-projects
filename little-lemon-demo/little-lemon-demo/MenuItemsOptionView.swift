//
//  MenuItemsOptionView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemsOptionView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("SELECTED CATEGORIES")) {
                    Text("Food")
                    Text("Drink")
                    Text("Dessert")
                }

                Section(header: Text("SORT BY")) {
                    Text("Most Popular")
                    Text("Price $-$$$")
                    Text("A-Z")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Filter", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview  {
    MenuItemsOptionView()
}
