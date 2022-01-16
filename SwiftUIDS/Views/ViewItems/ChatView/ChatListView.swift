//
//  ChatListView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 9/1/22.
//

import SwiftUI

struct ChatListView: View {
    @ObservedObject var model = ChatModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                //MARK:- ScrollView
                CustomScrollView(scrollToEnd: true) {
                    LazyVStack {
                        ForEach(0..<model.messagePositions.count, id:\.self) { index in
                            ChatMessageView(position: model.messagePositions[index], color: model.messagePositions[index] == ChatMessagePosition.right ?.green : .blue) {
                                Text(model.messages[index])
                            }
                        }
                    }
                }.padding(.top)
                //MARK:- text editor
                HStack {
                    ZStack {
                        TextEditor(text: $model.text)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(.gray)
                    }.frame(height: 50)
                    
                    Button("send") {
                        if model.text != "" {
                            model.position = model.position == ChatMessagePosition.right ? ChatMessagePosition.left : ChatMessagePosition.right
                            model.messagePositions.append(model.position)
                            model.messages.append(model.text)
                            model.text = ""
                        }
                    }
                }.padding()
            }
        }
    }
}
