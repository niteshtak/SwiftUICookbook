//
//  ViewsList.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 4/9/21.
//

import SwiftUI

struct ViewsList: View {
    var body: some View {
        List(menuItems, id: \.id) { item in
            NavigationLink(destination: MenuItemDetail(item: item)) {
                Text(item.title)
            }
        }
    }
}

struct ViewRow: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
    }
}
