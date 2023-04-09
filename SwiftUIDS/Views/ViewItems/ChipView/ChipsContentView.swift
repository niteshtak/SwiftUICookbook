//
//  ChipsContentView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 9/4/23.
//

import Foundation
import SwiftUI

struct ChipsContentView: View {
    @StateObject var viewModel = ChipsViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Select Your Chips")
                .font(.title)
                .fontWeight(.bold)
            ScrollView {
                ChipContainerView(viewModel: viewModel)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
