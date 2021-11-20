//
//  TitleLabel.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 3/9/21.
//

import Foundation
import SwiftUI

struct AppLabel: View {
    let title: String
    let style: TextStyle
    
    var body: some View {
        Text(title)
            .font(style.font)
    }
}
