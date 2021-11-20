//
//  AppCollectionView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 21/9/21.
//

import SwiftUI

struct CollectionItemModel: Identifiable {
    var id: Int
    let title, imageUrl: String
}

struct CollectionItem: View {
    var model: CollectionItemModel
    
    @GestureState var isDetectingLongPress = false
    @State var image = collectionItems[0].imageUrl
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(model.imageUrl)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(5)
                .gesture(LongPressGesture(minimumDuration: 60)
                            .updating($isDetectingLongPress) { currentstate, gestureState,
                                                               transaction in
                                
                                gestureState = currentstate
                                transaction.animation = Animation.spring()
                            }
                            .onChanged({ _ in
                                image = model.imageUrl
                            })
                )
            Text(model.title)
                .font(.caption)
        }
        .padding(.leading, 15)
        .blur(radius: isDetectingLongPress ? 5 : 0)
    }
}

struct HorizontalCollection: View {
    var categoryName: String
    var items: [CollectionItemModel]
    
    @GestureState var isDetectingLongPress = false
    @State var image = collectionItems[0].imageUrl

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading) {
                    Text(categoryName)
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(items.indices, id:\.self) { index in
                                CollectionItem(model: items[index])
                                
                            }
                        }
                    }
                    .frame(height: 185)
                }
            }
        }
    }
}

struct CollectionItem_Previews: PreviewProvider {
    static var previews: some View {
        CollectionItem(model: CollectionItemModel(id: 1, title: "Image 0", imageUrl: "0"))
    }
}
