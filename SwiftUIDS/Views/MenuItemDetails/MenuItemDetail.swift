//
//  MenuItemDetail.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 5/9/21.
//

import SwiftUI

struct MenuItemDetail: View {
    let item: MenuItem
    
    @StateObject var chipsViewModel = ChipsViewModel()
    @State private var bottomSheetShown = false
    @State private var showBanner: Bool = false
    @State var bannerData: BannerData = BannerData(title: "Notification Title", message: "A random message to display on banner.", status: .warning)
    
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
        case 10:
            CardStackView()
        case 11:
            CardFormView()
        case 12:
            ChartView()
        case 13:
            FaceIdAuth()
        case 14:
            ChatListView()
        case 15:
            ChipsContentView()
        default:
            //Text("No Item available yet")
            Button(action: {
                    self.showBanner = true
                }) {
                    Text("Show Banner")
                }.banner(data: $bannerData, show: $showBanner)
        }
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetail(item: menuItems[0])
    }
}
