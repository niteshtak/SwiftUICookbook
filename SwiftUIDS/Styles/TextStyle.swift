//
//  TextStyle.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 4/9/21.
//

import Foundation
import SwiftUI

enum TextStyle {
    case heading1, heading2
    
    public var font: Font {
        switch self {
        case .heading1:
            return Font.system(size: 24).weight(.bold)
        case .heading2:
            return Font.system(size: 16).weight(.semibold)
        }
    }
}
