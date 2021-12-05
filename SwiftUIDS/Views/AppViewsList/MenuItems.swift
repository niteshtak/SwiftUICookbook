//
//  MenuItems.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 5/9/21.
//

import Foundation

struct MenuItem: Hashable {
    var id: Int
    let title: String
}

let menuItems: [MenuItem] = [
    MenuItem(id: 1, title: "App Buttons"),
    MenuItem(id: 2, title: "App Labels"),
    MenuItem(id: 3, title: "App TextFields"),
    MenuItem(id: 4, title: "In App Notifications"),
    MenuItem(id: 5, title: "Bottom Sheet"),
    MenuItem(id: 6, title: "Vertical User List"),
    MenuItem(id: 7, title: "Horizontal User List"),
    MenuItem(id: 8, title: "Circular Loader"),
    MenuItem(id: 9, title: "Shimmer Effect"),
    MenuItem(id: 10, title: "Swipeable CardView"),
    MenuItem(id: 11, title: "Credit Card Form")
]

let collectionItems: [CollectionItemModel] = [
    CollectionItemModel(id: 1, title: "Item 1", imageUrl: "0"),
    CollectionItemModel(id: 1, title: "Item 2", imageUrl: "1"),
    CollectionItemModel(id: 1, title: "Item 3", imageUrl: "2"),
    CollectionItemModel(id: 1, title: "Item 4", imageUrl: "3"),
    CollectionItemModel(id: 1, title: "Item 5", imageUrl: "4")
]

