//
//  ChipContainerView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 9/4/23.
//

import Foundation
import SwiftUI

struct ChipContainerView: View {
    @ObservedObject var viewModel = ChipsViewModel()
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return GeometryReader { geo in
            ZStack(alignment: .topLeading, content: {
                ForEach(viewModel.chipArray) { data in
                    ChipView(systemImage: data.systemImage,
                             titleKey: data.titleKey,
                             isSelected: data.isSelected)
                        .padding(.all, 5)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(width - dimension.width) > geo.size.width) {
                                width = 0
                                height -= dimension.height
                            }
                            let result = width
                            if data.id == viewModel.chipArray.last!.id {
                                width = 0
                            } else {
                                width -= dimension.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { dimension in
                            let result = height
                            if data.id == viewModel.chipArray.last!.id {
                                height = 0
                            }
                            return result
                        }
                }
            })
        }
    }
}
