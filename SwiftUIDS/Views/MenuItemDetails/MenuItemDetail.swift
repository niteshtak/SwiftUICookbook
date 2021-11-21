//
//  MenuItemDetail.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 5/9/21.
//

import SwiftUI

struct MenuItemDetail: View {
    let item: MenuItem
    
    @State private var bottomSheetShown = false
    
    var body: some View {
        switch item.id {
        case 1:
            AppButton(title: "Primary Button", type: .primary) {
                print("Button Pressed!")
            }
        case 2:
            AppLabel(title: "Title Label", style: .heading1)
        case 3:
            VStack {
                NameTextField(text: "")
                NameTextFieldWithImage(text: "")
            }
        case 5:
            GeometryReader { geometry in
                        Color.white
                        BottomSheet(
                            isOpen: self.$bottomSheetShown,
                            maxHeight: geometry.size.height * 0.7
                        ) {
                            Color.blue
                        }
                    }.edgesIgnoringSafeArea(.all)
        case 6:
            VerticalListView()
        case 7:
            HorizontalListView()
        case 8:
            ActivityIndicator()
        case 9:
            ShimmerCardListView()
        default:
            Text("No Item available yet")
        }
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetail(item: menuItems[0])
    }
}
