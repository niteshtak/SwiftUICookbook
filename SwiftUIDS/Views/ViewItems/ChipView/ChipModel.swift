//
//  ChipModel.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 9/4/23.
//

import Foundation
import SwiftUI

struct ChipModel: Identifiable {
    @State var isSelected: Bool
    let id = UUID()
    let systemImage: String
    let titleKey: LocalizedStringKey
}

class ChipsViewModel: ObservableObject {
    @Published var chipArray: [ChipModel] = [
        ChipModel(isSelected: false, systemImage: "heart.circle", titleKey: "Heart"),
        ChipModel(isSelected: false, systemImage: "folder.circle", titleKey: "Folder"),
        ChipModel(isSelected: false, systemImage: "pencil.and.outline", titleKey: "Pen"),
        ChipModel(isSelected: false, systemImage: "book.circle", titleKey: "Book"),
        ChipModel(isSelected: false, systemImage: "paperplane.circle", titleKey: "Paper Plain"),
        ChipModel(isSelected: false, systemImage: "opticaldiscdrive", titleKey: "Optical Drive"),
        ChipModel(isSelected: false, systemImage: "doc.circle", titleKey: "Documents")
    ]
}
