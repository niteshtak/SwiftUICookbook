//
//  PrimaryButton.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 14/8/21.
//

import SwiftUI

enum ButtonType {
    case primary, outline, plain
        
    var padding: CGFloat {
        return 16
    }
    
    var radius: CGFloat {
        return 30
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .primary, .plain:
            return 0
        case .outline:
            return 1
        }
    }
    
    var borderColor: CGColor {
        switch self {
        case .primary, .plain:
            return UIColor.clear.cgColor
        case .outline:
            return UIColor.blue.cgColor
        }
    }
    
    var backgroundColor: UIColor {
        return .blue
    }
    
    var foregroundColor: UIColor {
        return .white
    }
}

struct ButtonFrameParams {
    static let padding: CGFloat = 12
    static let radius: CGFloat = 8
}

struct AppButton: View {
    let title: String
    let type: ButtonType
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .buttonStyle(AppButtonStyle(type: .primary))
    }
}

struct AppButtonStyle: ButtonStyle {
    var type: ButtonType
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .accentColor(.blue)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(type.padding)
            .background(Color(type.backgroundColor))
            .foregroundColor(Color(type.foregroundColor))
            .cornerRadius(type.radius)
            .padding()
    }
}
