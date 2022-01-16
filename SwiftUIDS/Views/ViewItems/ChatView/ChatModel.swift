//
//  ChatModel.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 9/1/22.
//

import Foundation

enum ChatMessagePosition {
    case left
    case right
}

class ChatModel: ObservableObject {
    var text = ""
    @Published var messages : [String] = []
    @Published var messagePositions : [ChatMessagePosition] = []
    @Published var position = ChatMessagePosition.right
}
