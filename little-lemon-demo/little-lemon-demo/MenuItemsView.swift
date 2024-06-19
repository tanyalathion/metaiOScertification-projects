//
//  MenuItemsView.swift
//  little-lemon-demo
//
//  Created by Tanya Lathion on 19.06.2024.
//

import Foundation
import SwiftUI

struct MenuItemsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Menu Items View")
                    .font(.largeTitle)
                
                Spacer()
                
                NavigationLink(destination: MenuItemsOptionView()) {
                    Text("See options")
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color.black)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarTitle("Menu")
        }
    }
}
